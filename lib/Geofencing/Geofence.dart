import 'dart:async';
import 'dart:io';
import 'dart:isolate';
import 'dart:math';
import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter_background/flutter_background.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:flutter_background_service_android/flutter_background_service_android.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:geofence_service/geofence_service.dart'
    as GFS; // Import Geofence from the package with a prefix
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

final _activityStreamController = StreamController<Activity>.broadcast();

class GeofenceServiceManager {
  StreamController<Activity> get activityStreamController =>
      _activityStreamController;

  Future<void> initiate() async {
    await AndroidAlarmManager.initialize();
    const int helloAlarmID = 0;
    await AndroidAlarmManager.periodic(
        const Duration(hours: 1), helloAlarmID, restart);

    bool isFlutterEngineInitialized = false;

    List<MyGeofence> geofenceList = await fetchGeofenceList();
    if (!isFlutterEngineInitialized) {
      await FlutterBackground.initialize();
      isFlutterEngineInitialized = true;
    }
    // Initialize the service
    await initializeService(geofenceList);
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
        .then((_) {});
  }
}

const notificationChannelId = 'my_foreground';
const notificationId = 888;
Timer? serviceTimer;

class GeofenceService {
  GFS.GeofenceService? _instance;

  GeofenceService._privateConstructor();

  static final GeofenceService _instanceService =
      GeofenceService._privateConstructor();

  factory GeofenceService() {
    return _instanceService;
  }

  GFS.GeofenceService get instance {
    _instance ??= GFS.GeofenceService.instance.setup(
      interval: 2000,
      accuracy: 200,
      loiteringDelayMs: 40000,
      statusChangeDelayMs: 10000,
      useActivityRecognition: true,
      allowMockLocations: false,
      printDevLog: true,
      geofenceRadiusSortType: GFS.GeofenceRadiusSortType.DESC,
    );
    return _instance!;
  }
}

Future<void> initializeService(List<MyGeofence> geofenceList) async {
  final service = FlutterBackgroundService();

  /// OPTIONAL, using a custom notification channel id
  const AndroidNotificationChannel channel = AndroidNotificationChannel(
    'my_foreground', // id
    'MY FOREGROUND SERVICE', // title
    description: 'This channel is used for important notifications.',
    // description
    importance: Importance.low, // importance must be at low or higher level
  );

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  if (Platform.isIOS || Platform.isAndroid) {
    await flutterLocalNotificationsPlugin.initialize(
      const InitializationSettings(
        iOS: DarwinInitializationSettings(),
        android: AndroidInitializationSettings('ic_bg_service_small'),
      ),
    );
  }

  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);

  await service.configure(
    androidConfiguration: AndroidConfiguration(
      // this will be executed when the app is in the foreground or background in a separate isolate
      onStart: onStart,

      // auto start service
      autoStart: true,
      isForegroundMode: true,

      notificationChannelId: 'my_foreground',
      initialNotificationTitle: 'Geofence SERVICE',
      initialNotificationContent: 'Initializing',
      foregroundServiceNotificationId: 888,
    ),
    iosConfiguration: IosConfiguration(
      // auto start service
      autoStart: true,

      // this will be executed when the app is in the foreground in a separate isolate
      onForeground: onStart,

      // you have to enable background fetch capability on Xcode project
    ),
  );

  service.startService();

  final geofenceService = GeofenceService().instance;

  geofenceService.addGeofenceStatusChangeListener(_onGeofenceStatusChanged);
  geofenceService.addLocationChangeListener(_onLocationChanged);
  geofenceService.addActivityChangeListener(_onActivityChanged);
  geofenceService.addLocationServicesStatusChangeListener(
      _onLocationServicesStatusChanged);

  geofenceService.start(
    geofenceList.map((myGeofence) {
      return GFS.Geofence(
        id: myGeofence.id,
        latitude: myGeofence.latitude,
        longitude: myGeofence.longitude,
        radius: [
          GFS.GeofenceRadius(
            id: myGeofence.radius.id,
            length: myGeofence.radius.length,
          ),
        ],
      );
    }).toList(),
  );
}

/*@pragma('vm:entry-point')*/
Future<void> restart() async {
  final DateTime now = DateTime.now();
  final int isolateId = Isolate.current.hashCode;
  GeofenceService().instance.stop();
  List<MyGeofence> geofenceList = await fetchGeofenceList();
//await FlutterBackground.initialize();
// Initialize the service
  await initializeService(geofenceList);
}

bool isServicePaused = false;

@pragma('vm:entry-point')
void onStart(ServiceInstance service) async {
  // Only available for Flutter 3.0.0 and later

  // For Flutter prior to version 3.0.0
  // We have to register the plugin manually

  SharedPreferences preferences = await SharedPreferences.getInstance();
  await preferences.setString("hello", "world");

  /// OPTIONAL when using a custom notification
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  // bring to foreground
  Timer.periodic(const Duration(seconds: 8), (timer) async {
    if (service is AndroidServiceInstance) {
      if (await service.isForegroundService()) {
        /// OPTIONAL for use custom notification
        /// the notification id must be equals with AndroidConfiguration when you call configure() method.
        flutterLocalNotificationsPlugin.show(
          888,
          'Geofence SERVICE',
          'geofencing ${DateFormat('hh:mm a').format(DateTime.now())}',
          const NotificationDetails(
            android: AndroidNotificationDetails(
              'my_foreground',
              'MY FOREGROUND SERVICE',
              icon: 'ic_bg_service_small',
              ongoing: true,
            ),
          ),
        );

        // if you don't use custom notification, uncomment this
      }
    }

    /// you can see this log in logcat
    print('FLUTTER BACKGROUND SERVICE: ${DateTime.now()}');

    // test using an external plugin
    final deviceInfo = DeviceInfoPlugin();
    String? device;
    if (Platform.isAndroid) {
      final androidInfo = await deviceInfo.androidInfo;
      device = androidInfo.model;
    }

    service.invoke(
      'update',
      {
        "current_date": DateTime.now().toIso8601String(),
        "device": device,
      },
    );
  });
  if (service is AndroidServiceInstance) {
    service.on('setAsForeground').listen((event) {
      service.setAsForegroundService();
    });

    service.on('setAsBackground').listen((event) {
      service.setAsBackgroundService();
    });
  }
}

void pauseService() {
  if (serviceTimer != null) {
    serviceTimer!.cancel();
  }
  isServicePaused = true;

  GeofenceService().instance.stop();

  serviceTimer = Timer(const Duration(hours: 1), () {
    resumeService();
  });
  print('Service paused');
}

Future<void> resumeService() async {
  if (serviceTimer != null) {
    serviceTimer!.cancel();
  }

  List<MyGeofence> geofenceList = await fetchGeofenceList();
  //await FlutterBackground.initialize();
  // Initialize the service
  await initializeService(geofenceList);

  isServicePaused = false;

  print('Service resumed');
}

Future<List<MyGeofence>> fetchGeofenceList() async {
  try {
    final QuerySnapshot<Map<String, dynamic>> snapshot =
        await FirebaseFirestore.instance.collection('places').get();

    final geofenceData = snapshot.docs;

    List<MyGeofence> geofenceList = [];

    for (var doc in geofenceData) {
      Map<String, dynamic> data = doc.data();
      GeoPoint latLng = data['latlang'];
      double latitude = latLng.latitude;
      double longitude = latLng.longitude;

      final geofence = MyGeofence(
        id: data['name'],
        latitude: latitude,
        longitude: longitude,
        radius: GeofenceRadius(
          id: '${data['radius']} meters',
          length: double.parse(data['radius'].toString()),
        ),
      );

      geofenceList.add(geofence);
    }

    return geofenceList;
  } catch (e) {
    print('Error fetching geofence list: $e');
    return []; // Return an empty list in case of an error
  }
}

class GeofenceRadius {
  final String id;
  final double length;

  GeofenceRadius({
    required this.id,
    required this.length,
  });

  factory GeofenceRadius.fromJson(Map<String, dynamic> json) {
    return GeofenceRadius(
      id: json['id'],
      length: json['length'],
    );
  }
}

class MyGeofence {
  final String id;
  final double latitude;
  final double longitude;
  final GeofenceRadius radius;

  MyGeofence({
    required this.id,
    required this.latitude,
    required this.longitude,
    required this.radius,
  });

  factory MyGeofence.fromJson(Map<String, dynamic> json) {
    return MyGeofence(
      id: json['id'],
      latitude: json['latitude'],
      longitude: json['longitude'],
      radius: GeofenceRadius.fromJson(json['radius']),
    );
  }
}

// This function is to be called when the geofence status is changed.
Map<String, GFS.GeofenceStatus> previousStatusMap = {};

Future<void> _onGeofenceStatusChanged(
    GFS.Geofence geofence,
    GFS.GeofenceRadius geofenceRadius,
    GFS.GeofenceStatus geofenceStatus,
    GFS.Location location) async {
  print('geofence: ${geofence.toJson()}');
  print('geofenceRadius: ${geofenceRadius.toJson()}');
  print('geofenceStatus: ${geofenceStatus.toString()}');

  try {
    final now = DateTime.now();
    List<String> placeNames = [];
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference logsCollection = firestore.collection("logs");
    GeoPoint locationGeoPoint = GeoPoint(location.latitude, location.longitude);
    User? user = FirebaseAuth.instance.currentUser;
    CollectionReference users = firestore.collection("users");
    CollectionReference ignored = firestore.collection("ignore_list");
    QuerySnapshot<Object?> querySnapshot = await users
        .where('email', isEqualTo: user?.email)
        .limit(1) // Limit the result to one document (assuming email is unique)
        .get();
    final String? licensePlate;
    if (querySnapshot.docs.isNotEmpty) {
      // Access the first document (there should be only one)
      final DocumentSnapshot<Map<String, dynamic>> document =
          querySnapshot.docs.first as DocumentSnapshot<Map<String, dynamic>>;

      // Access the 'license_plate' field from the document
      licensePlate = document['licence_plate'];
    } else {
      // No document found with the specified email
      licensePlate = "null";
    }
    final QuerySnapshot querys =
        await ignored.where('user_email', isEqualTo: user?.email).get();
    if (querys.docs.isNotEmpty) {
      final List<DocumentSnapshot> documents = querys.docs;
      for (var document in documents) {
        final data = document.data() as Map<String, dynamic>;

        if (data != null) {
          final placeName = data['place_name'];
          if (placeName is String) {
            placeNames.add(placeName);
          }
        }
      }
    }

    if (!placeNames.contains(geofence.id)) {
      if (previousStatusMap.containsKey(geofence.id) &&
          previousStatusMap[geofence.id] == geofenceStatus) {
        print('Status is the same as the previous status. Skipping insertion.');
      } else {
        // Update the previous status for the current place
        previousStatusMap[geofence.id] = geofenceStatus;

        DocumentReference newLogDoc = await logsCollection.add({
          'name': geofence.id,
          'latlang': locationGeoPoint,
          'status': geofenceStatus.toString().split('.').last,
          'time': Timestamp.fromDate(now),
          'user_email': user?.email,
          'licence_plate': licensePlate,
        });

        print('Data inserted successfully into Firebase  Database');
      }
    } else {
      print('ignored');
    }
  } catch (e) {
    print('Error inserting data into Firebase  Database: $e');
  }
}

// This function is to be called when the activity has changed.
void _onActivityChanged(GFS.Activity prevActivity, GFS.Activity currActivity) {
  print('prevActivity: ${prevActivity.toJson()}');
  print('currActivity: ${currActivity.toJson()}');
}

class Activity {
  final double speed;

  Activity({required this.speed});
}

// This function is to be called when the location has changed.
void _onLocationChanged(GFS.Location location) {
  _activityStreamController.sink.add(Activity(
    speed: location.speed ?? 0.0,
  ));
  print('location: ${location.toJson()}');
}

// This function is to be called when a location services status change occurs
// since the service was started.
void _onLocationServicesStatusChanged(bool status) {
  print('isLocationServicesEnabled: $status');
}

// This function is used to handle errors that occur in the service.
void _onError(dynamic error) {
  print('Error: $error');
}
