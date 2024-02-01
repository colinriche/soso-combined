import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class IgnoreListRecord extends FirestoreRecord {
  IgnoreListRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "place_name" field.
  String? _placeName;
  String get placeName => _placeName ?? '';
  bool hasPlaceName() => _placeName != null;

  // "user_email" field.
  String? _userEmail;
  String get userEmail => _userEmail ?? '';
  bool hasUserEmail() => _userEmail != null;

  // "place_id" field.
  int? _placeId;
  int get placeId => _placeId ?? 0;
  bool hasPlaceId() => _placeId != null;

  // "latlang" field.
  LatLng? _latlang;
  LatLng? get latlang => _latlang;
  bool hasLatlang() => _latlang != null;

  // "user_ref" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  void _initializeFields() {
    _placeName = snapshotData['place_name'] as String?;
    _userEmail = snapshotData['user_email'] as String?;
    _placeId = castToType<int>(snapshotData['place_id']);
    _latlang = snapshotData['latlang'] as LatLng?;
    _userRef = snapshotData['user_ref'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('ignore_list');

  static Stream<IgnoreListRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => IgnoreListRecord.fromSnapshot(s));

  static Future<IgnoreListRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => IgnoreListRecord.fromSnapshot(s));

  static IgnoreListRecord fromSnapshot(DocumentSnapshot snapshot) =>
      IgnoreListRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static IgnoreListRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      IgnoreListRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'IgnoreListRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is IgnoreListRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createIgnoreListRecordData({
  String? placeName,
  String? userEmail,
  int? placeId,
  LatLng? latlang,
  DocumentReference? userRef,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'place_name': placeName,
      'user_email': userEmail,
      'place_id': placeId,
      'latlang': latlang,
      'user_ref': userRef,
    }.withoutNulls,
  );

  return firestoreData;
}

class IgnoreListRecordDocumentEquality implements Equality<IgnoreListRecord> {
  const IgnoreListRecordDocumentEquality();

  @override
  bool equals(IgnoreListRecord? e1, IgnoreListRecord? e2) {
    return e1?.placeName == e2?.placeName &&
        e1?.userEmail == e2?.userEmail &&
        e1?.placeId == e2?.placeId &&
        e1?.latlang == e2?.latlang &&
        e1?.userRef == e2?.userRef;
  }

  @override
  int hash(IgnoreListRecord? e) => const ListEquality()
      .hash([e?.placeName, e?.userEmail, e?.placeId, e?.latlang, e?.userRef]);

  @override
  bool isValidKey(Object? o) => o is IgnoreListRecord;
}
