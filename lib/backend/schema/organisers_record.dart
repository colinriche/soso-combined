import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class OrganisersRecord extends FirestoreRecord {
  OrganisersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "organiser_id" field.
  int? _organiserId;
  int get organiserId => _organiserId ?? 0;
  bool hasOrganiserId() => _organiserId != null;

  // "organiser_type" field.
  String? _organiserType;
  String get organiserType => _organiserType ?? '';
  bool hasOrganiserType() => _organiserType != null;

  // "organiser" field.
  String? _organiser;
  String get organiser => _organiser ?? '';
  bool hasOrganiser() => _organiser != null;

  // "location" field.
  String? _location;
  String get location => _location ?? '';
  bool hasLocation() => _location != null;

  // "single_venue" field.
  bool? _singleVenue;
  bool get singleVenue => _singleVenue ?? false;
  bool hasSingleVenue() => _singleVenue != null;

  // "national_membership" field.
  bool? _nationalMembership;
  bool get nationalMembership => _nationalMembership ?? false;
  bool hasNationalMembership() => _nationalMembership != null;

  void _initializeFields() {
    _organiserId = castToType<int>(snapshotData['organiser_id']);
    _organiserType = snapshotData['organiser_type'] as String?;
    _organiser = snapshotData['organiser'] as String?;
    _location = snapshotData['location'] as String?;
    _singleVenue = snapshotData['single_venue'] as bool?;
    _nationalMembership = snapshotData['national_membership'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('organisers');

  static Stream<OrganisersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => OrganisersRecord.fromSnapshot(s));

  static Future<OrganisersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => OrganisersRecord.fromSnapshot(s));

  static OrganisersRecord fromSnapshot(DocumentSnapshot snapshot) =>
      OrganisersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static OrganisersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      OrganisersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'OrganisersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is OrganisersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createOrganisersRecordData({
  int? organiserId,
  String? organiserType,
  String? organiser,
  String? location,
  bool? singleVenue,
  bool? nationalMembership,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'organiser_id': organiserId,
      'organiser_type': organiserType,
      'organiser': organiser,
      'location': location,
      'single_venue': singleVenue,
      'national_membership': nationalMembership,
    }.withoutNulls,
  );

  return firestoreData;
}

class OrganisersRecordDocumentEquality implements Equality<OrganisersRecord> {
  const OrganisersRecordDocumentEquality();

  @override
  bool equals(OrganisersRecord? e1, OrganisersRecord? e2) {
    return e1?.organiserId == e2?.organiserId &&
        e1?.organiserType == e2?.organiserType &&
        e1?.organiser == e2?.organiser &&
        e1?.location == e2?.location &&
        e1?.singleVenue == e2?.singleVenue &&
        e1?.nationalMembership == e2?.nationalMembership;
  }

  @override
  int hash(OrganisersRecord? e) => const ListEquality().hash([
        e?.organiserId,
        e?.organiserType,
        e?.organiser,
        e?.location,
        e?.singleVenue,
        e?.nationalMembership
      ]);

  @override
  bool isValidKey(Object? o) => o is OrganisersRecord;
}
