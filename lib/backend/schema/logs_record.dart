import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class LogsRecord extends FirestoreRecord {
  LogsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "time" field.
  DateTime? _time;
  DateTime? get time => _time;
  bool hasTime() => _time != null;

  // "latlang" field.
  LatLng? _latlang;
  LatLng? get latlang => _latlang;
  bool hasLatlang() => _latlang != null;

  // "user_email" field.
  String? _userEmail;
  String get userEmail => _userEmail ?? '';
  bool hasUserEmail() => _userEmail != null;

  // "user_ref" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  // "licence_plate" field.
  String? _licencePlate;
  String get licencePlate => _licencePlate ?? '';
  bool hasLicencePlate() => _licencePlate != null;

  // "place_id" field.
  int? _placeId;
  int get placeId => _placeId ?? 0;
  bool hasPlaceId() => _placeId != null;

  // "place_info" field.
  String? _placeInfo;
  String get placeInfo => _placeInfo ?? '';
  bool hasPlaceInfo() => _placeInfo != null;

  // "places_info" field.
  VenueInfoStruct? _placesInfo;
  VenueInfoStruct get placesInfo => _placesInfo ?? VenueInfoStruct();
  bool hasPlacesInfo() => _placesInfo != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _status = snapshotData['status'] as String?;
    _time = snapshotData['time'] as DateTime?;
    _latlang = snapshotData['latlang'] as LatLng?;
    _userEmail = snapshotData['user_email'] as String?;
    _userRef = snapshotData['user_ref'] as DocumentReference?;
    _licencePlate = snapshotData['licence_plate'] as String?;
    _placeId = castToType<int>(snapshotData['place_id']);
    _placeInfo = snapshotData['place_info'] as String?;
    _placesInfo = VenueInfoStruct.maybeFromMap(snapshotData['places_info']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('logs');

  static Stream<LogsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => LogsRecord.fromSnapshot(s));

  static Future<LogsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => LogsRecord.fromSnapshot(s));

  static LogsRecord fromSnapshot(DocumentSnapshot snapshot) => LogsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static LogsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      LogsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'LogsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is LogsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createLogsRecordData({
  String? name,
  String? status,
  DateTime? time,
  LatLng? latlang,
  String? userEmail,
  DocumentReference? userRef,
  String? licencePlate,
  int? placeId,
  String? placeInfo,
  VenueInfoStruct? placesInfo,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'status': status,
      'time': time,
      'latlang': latlang,
      'user_email': userEmail,
      'user_ref': userRef,
      'licence_plate': licencePlate,
      'place_id': placeId,
      'place_info': placeInfo,
      'places_info': VenueInfoStruct().toMap(),
    }.withoutNulls,
  );

  // Handle nested data for "places_info" field.
  addVenueInfoStructData(firestoreData, placesInfo, 'places_info');

  return firestoreData;
}

class LogsRecordDocumentEquality implements Equality<LogsRecord> {
  const LogsRecordDocumentEquality();

  @override
  bool equals(LogsRecord? e1, LogsRecord? e2) {
    return e1?.name == e2?.name &&
        e1?.status == e2?.status &&
        e1?.time == e2?.time &&
        e1?.latlang == e2?.latlang &&
        e1?.userEmail == e2?.userEmail &&
        e1?.userRef == e2?.userRef &&
        e1?.licencePlate == e2?.licencePlate &&
        e1?.placeId == e2?.placeId &&
        e1?.placeInfo == e2?.placeInfo &&
        e1?.placesInfo == e2?.placesInfo;
  }

  @override
  int hash(LogsRecord? e) => const ListEquality().hash([
        e?.name,
        e?.status,
        e?.time,
        e?.latlang,
        e?.userEmail,
        e?.userRef,
        e?.licencePlate,
        e?.placeId,
        e?.placeInfo,
        e?.placesInfo
      ]);

  @override
  bool isValidKey(Object? o) => o is LogsRecord;
}
