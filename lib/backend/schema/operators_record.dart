import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class OperatorsRecord extends FirestoreRecord {
  OperatorsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "operator_id" field.
  int? _operatorId;
  int get operatorId => _operatorId ?? 0;
  bool hasOperatorId() => _operatorId != null;

  // "operator" field.
  String? _operator;
  String get operator => _operator ?? '';
  bool hasOperator() => _operator != null;

  // "operator_email" field.
  String? _operatorEmail;
  String get operatorEmail => _operatorEmail ?? '';
  bool hasOperatorEmail() => _operatorEmail != null;

  // "operator_url" field.
  String? _operatorUrl;
  String get operatorUrl => _operatorUrl ?? '';
  bool hasOperatorUrl() => _operatorUrl != null;

  // "ata" field.
  String? _ata;
  String get ata => _ata ?? '';
  bool hasAta() => _ata != null;

  void _initializeFields() {
    _operatorId = castToType<int>(snapshotData['operator_id']);
    _operator = snapshotData['operator'] as String?;
    _operatorEmail = snapshotData['operator_email'] as String?;
    _operatorUrl = snapshotData['operator_url'] as String?;
    _ata = snapshotData['ata'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('operators');

  static Stream<OperatorsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => OperatorsRecord.fromSnapshot(s));

  static Future<OperatorsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => OperatorsRecord.fromSnapshot(s));

  static OperatorsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      OperatorsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static OperatorsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      OperatorsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'OperatorsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is OperatorsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createOperatorsRecordData({
  int? operatorId,
  String? operator,
  String? operatorEmail,
  String? operatorUrl,
  String? ata,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'operator_id': operatorId,
      'operator': operator,
      'operator_email': operatorEmail,
      'operator_url': operatorUrl,
      'ata': ata,
    }.withoutNulls,
  );

  return firestoreData;
}

class OperatorsRecordDocumentEquality implements Equality<OperatorsRecord> {
  const OperatorsRecordDocumentEquality();

  @override
  bool equals(OperatorsRecord? e1, OperatorsRecord? e2) {
    return e1?.operatorId == e2?.operatorId &&
        e1?.operator == e2?.operator &&
        e1?.operatorEmail == e2?.operatorEmail &&
        e1?.operatorUrl == e2?.operatorUrl &&
        e1?.ata == e2?.ata;
  }

  @override
  int hash(OperatorsRecord? e) => const ListEquality().hash(
      [e?.operatorId, e?.operator, e?.operatorEmail, e?.operatorUrl, e?.ata]);

  @override
  bool isValidKey(Object? o) => o is OperatorsRecord;
}
