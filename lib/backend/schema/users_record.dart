import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsersRecord extends FirestoreRecord {
  UsersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "licence_plate" field.
  String? _licencePlate;
  String get licencePlate => _licencePlate ?? '';
  bool hasLicencePlate() => _licencePlate != null;

  // "blue_badge" field.
  String? _blueBadge;
  String get blueBadge => _blueBadge ?? '';
  bool hasBlueBadge() => _blueBadge != null;

  // "home_leased" field.
  bool? _homeLeased;
  bool get homeLeased => _homeLeased ?? false;
  bool hasHomeLeased() => _homeLeased != null;

  // "car_leased" field.
  bool? _carLeased;
  bool get carLeased => _carLeased ?? false;
  bool hasCarLeased() => _carLeased != null;

  // "tracking" field.
  bool? _tracking;
  bool get tracking => _tracking ?? false;
  bool hasTracking() => _tracking != null;

  // "account_verified" field.
  bool? _accountVerified;
  bool get accountVerified => _accountVerified ?? false;
  bool hasAccountVerified() => _accountVerified != null;

  // "black_box" field.
  bool? _blackBox;
  bool get blackBox => _blackBox ?? false;
  bool hasBlackBox() => _blackBox != null;

  // "leasing_company" field.
  String? _leasingCompany;
  String get leasingCompany => _leasingCompany ?? '';
  bool hasLeasingCompany() => _leasingCompany != null;

  // "V5_logbook" field.
  bool? _v5Logbook;
  bool get v5Logbook => _v5Logbook ?? false;
  bool hasV5Logbook() => _v5Logbook != null;

  // "tickets_paid" field.
  bool? _ticketsPaid;
  bool get ticketsPaid => _ticketsPaid ?? false;
  bool hasTicketsPaid() => _ticketsPaid != null;

  // "licence_plate2" field.
  String? _licencePlate2;
  String get licencePlate2 => _licencePlate2 ?? '';
  bool hasLicencePlate2() => _licencePlate2 != null;

  // "licence_plate_url" field.
  String? _licencePlateUrl;
  String get licencePlateUrl => _licencePlateUrl ?? '';
  bool hasLicencePlateUrl() => _licencePlateUrl != null;

  // "licence_plate2_url" field.
  String? _licencePlate2Url;
  String get licencePlate2Url => _licencePlate2Url ?? '';
  bool hasLicencePlate2Url() => _licencePlate2Url != null;

  // "blue_badge_url" field.
  String? _blueBadgeUrl;
  String get blueBadgeUrl => _blueBadgeUrl ?? '';
  bool hasBlueBadgeUrl() => _blueBadgeUrl != null;

  // "parking_permit_url" field.
  String? _parkingPermitUrl;
  String get parkingPermitUrl => _parkingPermitUrl ?? '';
  bool hasParkingPermitUrl() => _parkingPermitUrl != null;

  // "rental_1" field.
  RentalStruct? _rental1;
  RentalStruct get rental1 => _rental1 ?? RentalStruct();
  bool hasRental1() => _rental1 != null;

  // "rental_2" field.
  RentalStruct? _rental2;
  RentalStruct get rental2 => _rental2 ?? RentalStruct();
  bool hasRental2() => _rental2 != null;

  // "plate1_nickname" field.
  String? _plate1Nickname;
  String get plate1Nickname => _plate1Nickname ?? '';
  bool hasPlate1Nickname() => _plate1Nickname != null;

  // "plate2_nickname" field.
  String? _plate2Nickname;
  String get plate2Nickname => _plate2Nickname ?? '';
  bool hasPlate2Nickname() => _plate2Nickname != null;

  // "blue_badge_driver" field.
  bool? _blueBadgeDriver;
  bool get blueBadgeDriver => _blueBadgeDriver ?? false;
  bool hasBlueBadgeDriver() => _blueBadgeDriver != null;

  // "parking_space" field.
  bool? _parkingSpace;
  bool get parkingSpace => _parkingSpace ?? false;
  bool hasParkingSpace() => _parkingSpace != null;

  // "licence_plate1" field.
  String? _licencePlate1;
  String get licencePlate1 => _licencePlate1 ?? '';
  bool hasLicencePlate1() => _licencePlate1 != null;

  // "parking_permit" field.
  bool? _parkingPermit;
  bool get parkingPermit => _parkingPermit ?? false;
  bool hasParkingPermit() => _parkingPermit != null;

  // "vehicle_first" field.
  VehicleStruct? _vehicleFirst;
  VehicleStruct get vehicleFirst => _vehicleFirst ?? VehicleStruct();
  bool hasVehicleFirst() => _vehicleFirst != null;

  // "vehicle_second" field.
  VehicleStruct? _vehicleSecond;
  VehicleStruct get vehicleSecond => _vehicleSecond ?? VehicleStruct();
  bool hasVehicleSecond() => _vehicleSecond != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _licencePlate = snapshotData['licence_plate'] as String?;
    _blueBadge = snapshotData['blue_badge'] as String?;
    _homeLeased = snapshotData['home_leased'] as bool?;
    _carLeased = snapshotData['car_leased'] as bool?;
    _tracking = snapshotData['tracking'] as bool?;
    _accountVerified = snapshotData['account_verified'] as bool?;
    _blackBox = snapshotData['black_box'] as bool?;
    _leasingCompany = snapshotData['leasing_company'] as String?;
    _v5Logbook = snapshotData['V5_logbook'] as bool?;
    _ticketsPaid = snapshotData['tickets_paid'] as bool?;
    _licencePlate2 = snapshotData['licence_plate2'] as String?;
    _licencePlateUrl = snapshotData['licence_plate_url'] as String?;
    _licencePlate2Url = snapshotData['licence_plate2_url'] as String?;
    _blueBadgeUrl = snapshotData['blue_badge_url'] as String?;
    _parkingPermitUrl = snapshotData['parking_permit_url'] as String?;
    _rental1 = RentalStruct.maybeFromMap(snapshotData['rental_1']);
    _rental2 = RentalStruct.maybeFromMap(snapshotData['rental_2']);
    _plate1Nickname = snapshotData['plate1_nickname'] as String?;
    _plate2Nickname = snapshotData['plate2_nickname'] as String?;
    _blueBadgeDriver = snapshotData['blue_badge_driver'] as bool?;
    _parkingSpace = snapshotData['parking_space'] as bool?;
    _licencePlate1 = snapshotData['licence_plate1'] as String?;
    _parkingPermit = snapshotData['parking_permit'] as bool?;
    _vehicleFirst = VehicleStruct.maybeFromMap(snapshotData['vehicle_first']);
    _vehicleSecond = VehicleStruct.maybeFromMap(snapshotData['vehicle_second']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsersRecord.fromSnapshot(s));

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UsersRecord.fromSnapshot(s));

  static UsersRecord fromSnapshot(DocumentSnapshot snapshot) => UsersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UsersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UsersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUsersRecordData({
  String? email,
  String? displayName,
  String? photoUrl,
  String? uid,
  DateTime? createdTime,
  String? phoneNumber,
  String? licencePlate,
  String? blueBadge,
  bool? homeLeased,
  bool? carLeased,
  bool? tracking,
  bool? accountVerified,
  bool? blackBox,
  String? leasingCompany,
  bool? v5Logbook,
  bool? ticketsPaid,
  String? licencePlate2,
  String? licencePlateUrl,
  String? licencePlate2Url,
  String? blueBadgeUrl,
  String? parkingPermitUrl,
  RentalStruct? rental1,
  RentalStruct? rental2,
  String? plate1Nickname,
  String? plate2Nickname,
  bool? blueBadgeDriver,
  bool? parkingSpace,
  String? licencePlate1,
  bool? parkingPermit,
  VehicleStruct? vehicleFirst,
  VehicleStruct? vehicleSecond,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'display_name': displayName,
      'photo_url': photoUrl,
      'uid': uid,
      'created_time': createdTime,
      'phone_number': phoneNumber,
      'licence_plate': licencePlate,
      'blue_badge': blueBadge,
      'home_leased': homeLeased,
      'car_leased': carLeased,
      'tracking': tracking,
      'account_verified': accountVerified,
      'black_box': blackBox,
      'leasing_company': leasingCompany,
      'V5_logbook': v5Logbook,
      'tickets_paid': ticketsPaid,
      'licence_plate2': licencePlate2,
      'licence_plate_url': licencePlateUrl,
      'licence_plate2_url': licencePlate2Url,
      'blue_badge_url': blueBadgeUrl,
      'parking_permit_url': parkingPermitUrl,
      'rental_1': RentalStruct().toMap(),
      'rental_2': RentalStruct().toMap(),
      'plate1_nickname': plate1Nickname,
      'plate2_nickname': plate2Nickname,
      'blue_badge_driver': blueBadgeDriver,
      'parking_space': parkingSpace,
      'licence_plate1': licencePlate1,
      'parking_permit': parkingPermit,
      'vehicle_first': VehicleStruct().toMap(),
      'vehicle_second': VehicleStruct().toMap(),
    }.withoutNulls,
  );

  // Handle nested data for "rental_1" field.
  addRentalStructData(firestoreData, rental1, 'rental_1');

  // Handle nested data for "rental_2" field.
  addRentalStructData(firestoreData, rental2, 'rental_2');

  // Handle nested data for "vehicle_first" field.
  addVehicleStructData(firestoreData, vehicleFirst, 'vehicle_first');

  // Handle nested data for "vehicle_second" field.
  addVehicleStructData(firestoreData, vehicleSecond, 'vehicle_second');

  return firestoreData;
}

class UsersRecordDocumentEquality implements Equality<UsersRecord> {
  const UsersRecordDocumentEquality();

  @override
  bool equals(UsersRecord? e1, UsersRecord? e2) {
    return e1?.email == e2?.email &&
        e1?.displayName == e2?.displayName &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.uid == e2?.uid &&
        e1?.createdTime == e2?.createdTime &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.licencePlate == e2?.licencePlate &&
        e1?.blueBadge == e2?.blueBadge &&
        e1?.homeLeased == e2?.homeLeased &&
        e1?.carLeased == e2?.carLeased &&
        e1?.tracking == e2?.tracking &&
        e1?.accountVerified == e2?.accountVerified &&
        e1?.blackBox == e2?.blackBox &&
        e1?.leasingCompany == e2?.leasingCompany &&
        e1?.v5Logbook == e2?.v5Logbook &&
        e1?.ticketsPaid == e2?.ticketsPaid &&
        e1?.licencePlate2 == e2?.licencePlate2 &&
        e1?.licencePlateUrl == e2?.licencePlateUrl &&
        e1?.licencePlate2Url == e2?.licencePlate2Url &&
        e1?.blueBadgeUrl == e2?.blueBadgeUrl &&
        e1?.parkingPermitUrl == e2?.parkingPermitUrl &&
        e1?.rental1 == e2?.rental1 &&
        e1?.rental2 == e2?.rental2 &&
        e1?.plate1Nickname == e2?.plate1Nickname &&
        e1?.plate2Nickname == e2?.plate2Nickname &&
        e1?.blueBadgeDriver == e2?.blueBadgeDriver &&
        e1?.parkingSpace == e2?.parkingSpace &&
        e1?.licencePlate1 == e2?.licencePlate1 &&
        e1?.parkingPermit == e2?.parkingPermit &&
        e1?.vehicleFirst == e2?.vehicleFirst &&
        e1?.vehicleSecond == e2?.vehicleSecond;
  }

  @override
  int hash(UsersRecord? e) => const ListEquality().hash([
        e?.email,
        e?.displayName,
        e?.photoUrl,
        e?.uid,
        e?.createdTime,
        e?.phoneNumber,
        e?.licencePlate,
        e?.blueBadge,
        e?.homeLeased,
        e?.carLeased,
        e?.tracking,
        e?.accountVerified,
        e?.blackBox,
        e?.leasingCompany,
        e?.v5Logbook,
        e?.ticketsPaid,
        e?.licencePlate2,
        e?.licencePlateUrl,
        e?.licencePlate2Url,
        e?.blueBadgeUrl,
        e?.parkingPermitUrl,
        e?.rental1,
        e?.rental2,
        e?.plate1Nickname,
        e?.plate2Nickname,
        e?.blueBadgeDriver,
        e?.parkingSpace,
        e?.licencePlate1,
        e?.parkingPermit,
        e?.vehicleFirst,
        e?.vehicleSecond
      ]);

  @override
  bool isValidKey(Object? o) => o is UsersRecord;
}
