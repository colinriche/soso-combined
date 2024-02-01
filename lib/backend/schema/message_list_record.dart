import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MessageListRecord extends FirestoreRecord {
  MessageListRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "selected_message" field.
  String? _selectedMessage;
  String get selectedMessage => _selectedMessage ?? '';
  bool hasSelectedMessage() => _selectedMessage != null;

  // "select_msg_id" field.
  int? _selectMsgId;
  int get selectMsgId => _selectMsgId ?? 0;
  bool hasSelectMsgId() => _selectMsgId != null;

  void _initializeFields() {
    _selectedMessage = snapshotData['selected_message'] as String?;
    _selectMsgId = castToType<int>(snapshotData['select_msg_id']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('message_list');

  static Stream<MessageListRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MessageListRecord.fromSnapshot(s));

  static Future<MessageListRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MessageListRecord.fromSnapshot(s));

  static MessageListRecord fromSnapshot(DocumentSnapshot snapshot) =>
      MessageListRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MessageListRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MessageListRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MessageListRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MessageListRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMessageListRecordData({
  String? selectedMessage,
  int? selectMsgId,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'selected_message': selectedMessage,
      'select_msg_id': selectMsgId,
    }.withoutNulls,
  );

  return firestoreData;
}

class MessageListRecordDocumentEquality implements Equality<MessageListRecord> {
  const MessageListRecordDocumentEquality();

  @override
  bool equals(MessageListRecord? e1, MessageListRecord? e2) {
    return e1?.selectedMessage == e2?.selectedMessage &&
        e1?.selectMsgId == e2?.selectMsgId;
  }

  @override
  int hash(MessageListRecord? e) =>
      const ListEquality().hash([e?.selectedMessage, e?.selectMsgId]);

  @override
  bool isValidKey(Object? o) => o is MessageListRecord;
}
