import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class VisitsRecord extends FirestoreRecord {
  VisitsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "latlang" field.
  LatLng? _latlang;
  LatLng? get latlang => _latlang;
  bool hasLatlang() => _latlang != null;

  // "with_gps" field.
  bool? _withGps;
  bool get withGps => _withGps ?? false;
  bool hasWithGps() => _withGps != null;

  // "location_info" field.
  String? _locationInfo;
  String get locationInfo => _locationInfo ?? '';
  bool hasLocationInfo() => _locationInfo != null;

  // "entry_exit" field.
  String? _entryExit;
  String get entryExit => _entryExit ?? '';
  bool hasEntryExit() => _entryExit != null;

  // "user_ref" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "licence_plate" field.
  String? _licencePlate;
  String get licencePlate => _licencePlate ?? '';
  bool hasLicencePlate() => _licencePlate != null;

  // "action_id" field.
  int? _actionId;
  int get actionId => _actionId ?? 0;
  bool hasActionId() => _actionId != null;

  // "action_message" field.
  String? _actionMessage;
  String get actionMessage => _actionMessage ?? '';
  bool hasActionMessage() => _actionMessage != null;

  // "option_id" field.
  int? _optionId;
  int get optionId => _optionId ?? 0;
  bool hasOptionId() => _optionId != null;

  // "option_message" field.
  String? _optionMessage;
  String get optionMessage => _optionMessage ?? '';
  bool hasOptionMessage() => _optionMessage != null;

  // "current_location" field.
  bool? _currentLocation;
  bool get currentLocation => _currentLocation ?? false;
  bool hasCurrentLocation() => _currentLocation != null;

  void _initializeFields() {
    _createdAt = snapshotData['created_at'] as DateTime?;
    _latlang = snapshotData['latlang'] as LatLng?;
    _withGps = snapshotData['with_gps'] as bool?;
    _locationInfo = snapshotData['location_info'] as String?;
    _entryExit = snapshotData['entry_exit'] as String?;
    _userRef = snapshotData['user_ref'] as DocumentReference?;
    _email = snapshotData['email'] as String?;
    _licencePlate = snapshotData['licence_plate'] as String?;
    _actionId = castToType<int>(snapshotData['action_id']);
    _actionMessage = snapshotData['action_message'] as String?;
    _optionId = castToType<int>(snapshotData['option_id']);
    _optionMessage = snapshotData['option_message'] as String?;
    _currentLocation = snapshotData['current_location'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('visits');

  static Stream<VisitsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => VisitsRecord.fromSnapshot(s));

  static Future<VisitsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => VisitsRecord.fromSnapshot(s));

  static VisitsRecord fromSnapshot(DocumentSnapshot snapshot) => VisitsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static VisitsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      VisitsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'VisitsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is VisitsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createVisitsRecordData({
  DateTime? createdAt,
  LatLng? latlang,
  bool? withGps,
  String? locationInfo,
  String? entryExit,
  DocumentReference? userRef,
  String? email,
  String? licencePlate,
  int? actionId,
  String? actionMessage,
  int? optionId,
  String? optionMessage,
  bool? currentLocation,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'created_at': createdAt,
      'latlang': latlang,
      'with_gps': withGps,
      'location_info': locationInfo,
      'entry_exit': entryExit,
      'user_ref': userRef,
      'email': email,
      'licence_plate': licencePlate,
      'action_id': actionId,
      'action_message': actionMessage,
      'option_id': optionId,
      'option_message': optionMessage,
      'current_location': currentLocation,
    }.withoutNulls,
  );

  return firestoreData;
}

class VisitsRecordDocumentEquality implements Equality<VisitsRecord> {
  const VisitsRecordDocumentEquality();

  @override
  bool equals(VisitsRecord? e1, VisitsRecord? e2) {
    return e1?.createdAt == e2?.createdAt &&
        e1?.latlang == e2?.latlang &&
        e1?.withGps == e2?.withGps &&
        e1?.locationInfo == e2?.locationInfo &&
        e1?.entryExit == e2?.entryExit &&
        e1?.userRef == e2?.userRef &&
        e1?.email == e2?.email &&
        e1?.licencePlate == e2?.licencePlate &&
        e1?.actionId == e2?.actionId &&
        e1?.actionMessage == e2?.actionMessage &&
        e1?.optionId == e2?.optionId &&
        e1?.optionMessage == e2?.optionMessage &&
        e1?.currentLocation == e2?.currentLocation;
  }

  @override
  int hash(VisitsRecord? e) => const ListEquality().hash([
        e?.createdAt,
        e?.latlang,
        e?.withGps,
        e?.locationInfo,
        e?.entryExit,
        e?.userRef,
        e?.email,
        e?.licencePlate,
        e?.actionId,
        e?.actionMessage,
        e?.optionId,
        e?.optionMessage,
        e?.currentLocation
      ]);

  @override
  bool isValidKey(Object? o) => o is VisitsRecord;
}
