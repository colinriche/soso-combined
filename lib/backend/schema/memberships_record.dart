import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MembershipsRecord extends FirestoreRecord {
  MembershipsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "organiser" field.
  String? _organiser;
  String get organiser => _organiser ?? '';
  bool hasOrganiser() => _organiser != null;

  // "member_number" field.
  String? _memberNumber;
  String get memberNumber => _memberNumber ?? '';
  bool hasMemberNumber() => _memberNumber != null;

  // "national_membership" field.
  bool? _nationalMembership;
  bool get nationalMembership => _nationalMembership ?? false;
  bool hasNationalMembership() => _nationalMembership != null;

  // "single_venue" field.
  bool? _singleVenue;
  bool get singleVenue => _singleVenue ?? false;
  bool hasSingleVenue() => _singleVenue != null;

  // "date_added" field.
  DateTime? _dateAdded;
  DateTime? get dateAdded => _dateAdded;
  bool hasDateAdded() => _dateAdded != null;

  // "date_removed" field.
  DateTime? _dateRemoved;
  DateTime? get dateRemoved => _dateRemoved;
  bool hasDateRemoved() => _dateRemoved != null;

  // "removed_by" field.
  String? _removedBy;
  String get removedBy => _removedBy ?? '';
  bool hasRemovedBy() => _removedBy != null;

  // "removed_flag" field.
  bool? _removedFlag;
  bool get removedFlag => _removedFlag ?? false;
  bool hasRemovedFlag() => _removedFlag != null;

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

  // "organiser_id" field.
  int? _organiserId;
  int get organiserId => _organiserId ?? 0;
  bool hasOrganiserId() => _organiserId != null;

  // "licence_plate_registered" field.
  String? _licencePlateRegistered;
  String get licencePlateRegistered => _licencePlateRegistered ?? '';
  bool hasLicencePlateRegistered() => _licencePlateRegistered != null;

  // "location" field.
  String? _location;
  String get location => _location ?? '';
  bool hasLocation() => _location != null;

  void _initializeFields() {
    _organiser = snapshotData['organiser'] as String?;
    _memberNumber = snapshotData['member_number'] as String?;
    _nationalMembership = snapshotData['national_membership'] as bool?;
    _singleVenue = snapshotData['single_venue'] as bool?;
    _dateAdded = snapshotData['date_added'] as DateTime?;
    _dateRemoved = snapshotData['date_removed'] as DateTime?;
    _removedBy = snapshotData['removed_by'] as String?;
    _removedFlag = snapshotData['removed_flag'] as bool?;
    _userRef = snapshotData['user_ref'] as DocumentReference?;
    _email = snapshotData['email'] as String?;
    _licencePlate = snapshotData['licence_plate'] as String?;
    _organiserId = castToType<int>(snapshotData['organiser_id']);
    _licencePlateRegistered =
        snapshotData['licence_plate_registered'] as String?;
    _location = snapshotData['location'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('memberships');

  static Stream<MembershipsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MembershipsRecord.fromSnapshot(s));

  static Future<MembershipsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MembershipsRecord.fromSnapshot(s));

  static MembershipsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      MembershipsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MembershipsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MembershipsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MembershipsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MembershipsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMembershipsRecordData({
  String? organiser,
  String? memberNumber,
  bool? nationalMembership,
  bool? singleVenue,
  DateTime? dateAdded,
  DateTime? dateRemoved,
  String? removedBy,
  bool? removedFlag,
  DocumentReference? userRef,
  String? email,
  String? licencePlate,
  int? organiserId,
  String? licencePlateRegistered,
  String? location,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'organiser': organiser,
      'member_number': memberNumber,
      'national_membership': nationalMembership,
      'single_venue': singleVenue,
      'date_added': dateAdded,
      'date_removed': dateRemoved,
      'removed_by': removedBy,
      'removed_flag': removedFlag,
      'user_ref': userRef,
      'email': email,
      'licence_plate': licencePlate,
      'organiser_id': organiserId,
      'licence_plate_registered': licencePlateRegistered,
      'location': location,
    }.withoutNulls,
  );

  return firestoreData;
}

class MembershipsRecordDocumentEquality implements Equality<MembershipsRecord> {
  const MembershipsRecordDocumentEquality();

  @override
  bool equals(MembershipsRecord? e1, MembershipsRecord? e2) {
    return e1?.organiser == e2?.organiser &&
        e1?.memberNumber == e2?.memberNumber &&
        e1?.nationalMembership == e2?.nationalMembership &&
        e1?.singleVenue == e2?.singleVenue &&
        e1?.dateAdded == e2?.dateAdded &&
        e1?.dateRemoved == e2?.dateRemoved &&
        e1?.removedBy == e2?.removedBy &&
        e1?.removedFlag == e2?.removedFlag &&
        e1?.userRef == e2?.userRef &&
        e1?.email == e2?.email &&
        e1?.licencePlate == e2?.licencePlate &&
        e1?.organiserId == e2?.organiserId &&
        e1?.licencePlateRegistered == e2?.licencePlateRegistered &&
        e1?.location == e2?.location;
  }

  @override
  int hash(MembershipsRecord? e) => const ListEquality().hash([
        e?.organiser,
        e?.memberNumber,
        e?.nationalMembership,
        e?.singleVenue,
        e?.dateAdded,
        e?.dateRemoved,
        e?.removedBy,
        e?.removedFlag,
        e?.userRef,
        e?.email,
        e?.licencePlate,
        e?.organiserId,
        e?.licencePlateRegistered,
        e?.location
      ]);

  @override
  bool isValidKey(Object? o) => o is MembershipsRecord;
}
