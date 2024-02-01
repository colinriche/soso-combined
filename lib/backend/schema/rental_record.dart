import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RentalRecord extends FirestoreRecord {
  RentalRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "company" field.
  String? _company;
  String get company => _company ?? '';
  bool hasCompany() => _company != null;

  // "tickets_paid" field.
  bool? _ticketsPaid;
  bool get ticketsPaid => _ticketsPaid ?? false;
  bool hasTicketsPaid() => _ticketsPaid != null;

  // "V5_logbook" field.
  bool? _v5Logbook;
  bool get v5Logbook => _v5Logbook ?? false;
  bool hasV5Logbook() => _v5Logbook != null;

  // "user_ref" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  void _initializeFields() {
    _company = snapshotData['company'] as String?;
    _ticketsPaid = snapshotData['tickets_paid'] as bool?;
    _v5Logbook = snapshotData['V5_logbook'] as bool?;
    _userRef = snapshotData['user_ref'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('rental');

  static Stream<RentalRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => RentalRecord.fromSnapshot(s));

  static Future<RentalRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => RentalRecord.fromSnapshot(s));

  static RentalRecord fromSnapshot(DocumentSnapshot snapshot) => RentalRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static RentalRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      RentalRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'RentalRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is RentalRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createRentalRecordData({
  String? company,
  bool? ticketsPaid,
  bool? v5Logbook,
  DocumentReference? userRef,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'company': company,
      'tickets_paid': ticketsPaid,
      'V5_logbook': v5Logbook,
      'user_ref': userRef,
    }.withoutNulls,
  );

  return firestoreData;
}

class RentalRecordDocumentEquality implements Equality<RentalRecord> {
  const RentalRecordDocumentEquality();

  @override
  bool equals(RentalRecord? e1, RentalRecord? e2) {
    return e1?.company == e2?.company &&
        e1?.ticketsPaid == e2?.ticketsPaid &&
        e1?.v5Logbook == e2?.v5Logbook &&
        e1?.userRef == e2?.userRef;
  }

  @override
  int hash(RentalRecord? e) => const ListEquality()
      .hash([e?.company, e?.ticketsPaid, e?.v5Logbook, e?.userRef]);

  @override
  bool isValidKey(Object? o) => o is RentalRecord;
}
