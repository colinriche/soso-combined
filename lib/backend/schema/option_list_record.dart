import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class OptionListRecord extends FirestoreRecord {
  OptionListRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "option_id" field.
  int? _optionId;
  int get optionId => _optionId ?? 0;
  bool hasOptionId() => _optionId != null;

  // "option_message" field.
  String? _optionMessage;
  String get optionMessage => _optionMessage ?? '';
  bool hasOptionMessage() => _optionMessage != null;

  void _initializeFields() {
    _optionId = castToType<int>(snapshotData['option_id']);
    _optionMessage = snapshotData['option_message'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('option_list');

  static Stream<OptionListRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => OptionListRecord.fromSnapshot(s));

  static Future<OptionListRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => OptionListRecord.fromSnapshot(s));

  static OptionListRecord fromSnapshot(DocumentSnapshot snapshot) =>
      OptionListRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static OptionListRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      OptionListRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'OptionListRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is OptionListRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createOptionListRecordData({
  int? optionId,
  String? optionMessage,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'option_id': optionId,
      'option_message': optionMessage,
    }.withoutNulls,
  );

  return firestoreData;
}

class OptionListRecordDocumentEquality implements Equality<OptionListRecord> {
  const OptionListRecordDocumentEquality();

  @override
  bool equals(OptionListRecord? e1, OptionListRecord? e2) {
    return e1?.optionId == e2?.optionId &&
        e1?.optionMessage == e2?.optionMessage;
  }

  @override
  int hash(OptionListRecord? e) =>
      const ListEquality().hash([e?.optionId, e?.optionMessage]);

  @override
  bool isValidKey(Object? o) => o is OptionListRecord;
}
