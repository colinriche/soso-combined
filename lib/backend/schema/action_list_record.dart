import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ActionListRecord extends FirestoreRecord {
  ActionListRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "action_id" field.
  int? _actionId;
  int get actionId => _actionId ?? 0;
  bool hasActionId() => _actionId != null;

  // "action_message" field.
  String? _actionMessage;
  String get actionMessage => _actionMessage ?? '';
  bool hasActionMessage() => _actionMessage != null;

  void _initializeFields() {
    _actionId = castToType<int>(snapshotData['action_id']);
    _actionMessage = snapshotData['action_message'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('action_list');

  static Stream<ActionListRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ActionListRecord.fromSnapshot(s));

  static Future<ActionListRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ActionListRecord.fromSnapshot(s));

  static ActionListRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ActionListRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ActionListRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ActionListRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ActionListRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ActionListRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createActionListRecordData({
  int? actionId,
  String? actionMessage,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'action_id': actionId,
      'action_message': actionMessage,
    }.withoutNulls,
  );

  return firestoreData;
}

class ActionListRecordDocumentEquality implements Equality<ActionListRecord> {
  const ActionListRecordDocumentEquality();

  @override
  bool equals(ActionListRecord? e1, ActionListRecord? e2) {
    return e1?.actionId == e2?.actionId &&
        e1?.actionMessage == e2?.actionMessage;
  }

  @override
  int hash(ActionListRecord? e) =>
      const ListEquality().hash([e?.actionId, e?.actionMessage]);

  @override
  bool isValidKey(Object? o) => o is ActionListRecord;
}
