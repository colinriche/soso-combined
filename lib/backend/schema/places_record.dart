import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PlacesRecord extends FirestoreRecord {
  PlacesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "radius" field.
  int? _radius;
  int get radius => _radius ?? 0;
  bool hasRadius() => _radius != null;

  // "date_added" field.
  DateTime? _dateAdded;
  DateTime? get dateAdded => _dateAdded;
  bool hasDateAdded() => _dateAdded != null;

  // "added_by" field.
  DocumentReference? _addedBy;
  DocumentReference? get addedBy => _addedBy;
  bool hasAddedBy() => _addedBy != null;

  // "added_by_name" field.
  String? _addedByName;
  String get addedByName => _addedByName ?? '';
  bool hasAddedByName() => _addedByName != null;

  // "added_by_email" field.
  String? _addedByEmail;
  String get addedByEmail => _addedByEmail ?? '';
  bool hasAddedByEmail() => _addedByEmail != null;

  // "latlang" field.
  LatLng? _latlang;
  LatLng? get latlang => _latlang;
  bool hasLatlang() => _latlang != null;

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
    _radius = castToType<int>(snapshotData['radius']);
    _dateAdded = snapshotData['date_added'] as DateTime?;
    _addedBy = snapshotData['added_by'] as DocumentReference?;
    _addedByName = snapshotData['added_by_name'] as String?;
    _addedByEmail = snapshotData['added_by_email'] as String?;
    _latlang = snapshotData['latlang'] as LatLng?;
    _placeId = castToType<int>(snapshotData['place_id']);
    _placeInfo = snapshotData['place_info'] as String?;
    _placesInfo = VenueInfoStruct.maybeFromMap(snapshotData['places_info']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('places');

  static Stream<PlacesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PlacesRecord.fromSnapshot(s));

  static Future<PlacesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PlacesRecord.fromSnapshot(s));

  static PlacesRecord fromSnapshot(DocumentSnapshot snapshot) => PlacesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PlacesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PlacesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PlacesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PlacesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPlacesRecordData({
  String? name,
  int? radius,
  DateTime? dateAdded,
  DocumentReference? addedBy,
  String? addedByName,
  String? addedByEmail,
  LatLng? latlang,
  int? placeId,
  String? placeInfo,
  VenueInfoStruct? placesInfo,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'radius': radius,
      'date_added': dateAdded,
      'added_by': addedBy,
      'added_by_name': addedByName,
      'added_by_email': addedByEmail,
      'latlang': latlang,
      'place_id': placeId,
      'place_info': placeInfo,
      'places_info': VenueInfoStruct().toMap(),
    }.withoutNulls,
  );

  // Handle nested data for "places_info" field.
  addVenueInfoStructData(firestoreData, placesInfo, 'places_info');

  return firestoreData;
}

class PlacesRecordDocumentEquality implements Equality<PlacesRecord> {
  const PlacesRecordDocumentEquality();

  @override
  bool equals(PlacesRecord? e1, PlacesRecord? e2) {
    return e1?.name == e2?.name &&
        e1?.radius == e2?.radius &&
        e1?.dateAdded == e2?.dateAdded &&
        e1?.addedBy == e2?.addedBy &&
        e1?.addedByName == e2?.addedByName &&
        e1?.addedByEmail == e2?.addedByEmail &&
        e1?.latlang == e2?.latlang &&
        e1?.placeId == e2?.placeId &&
        e1?.placeInfo == e2?.placeInfo &&
        e1?.placesInfo == e2?.placesInfo;
  }

  @override
  int hash(PlacesRecord? e) => const ListEquality().hash([
        e?.name,
        e?.radius,
        e?.dateAdded,
        e?.addedBy,
        e?.addedByName,
        e?.addedByEmail,
        e?.latlang,
        e?.placeId,
        e?.placeInfo,
        e?.placesInfo
      ]);

  @override
  bool isValidKey(Object? o) => o is PlacesRecord;
}
