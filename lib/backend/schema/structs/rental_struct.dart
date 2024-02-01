// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RentalStruct extends FFFirebaseStruct {
  RentalStruct({
    String? company,
    String? ticketsPaid,
    String? v5Logbook,
    String? blackBox,
    String? tracking,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _company = company,
        _ticketsPaid = ticketsPaid,
        _v5Logbook = v5Logbook,
        _blackBox = blackBox,
        _tracking = tracking,
        super(firestoreUtilData);

  // "company" field.
  String? _company;
  String get company => _company ?? '';
  set company(String? val) => _company = val;
  bool hasCompany() => _company != null;

  // "tickets_paid" field.
  String? _ticketsPaid;
  String get ticketsPaid => _ticketsPaid ?? '';
  set ticketsPaid(String? val) => _ticketsPaid = val;
  bool hasTicketsPaid() => _ticketsPaid != null;

  // "V5_logbook" field.
  String? _v5Logbook;
  String get v5Logbook => _v5Logbook ?? '';
  set v5Logbook(String? val) => _v5Logbook = val;
  bool hasV5Logbook() => _v5Logbook != null;

  // "black_box" field.
  String? _blackBox;
  String get blackBox => _blackBox ?? '';
  set blackBox(String? val) => _blackBox = val;
  bool hasBlackBox() => _blackBox != null;

  // "tracking" field.
  String? _tracking;
  String get tracking => _tracking ?? '';
  set tracking(String? val) => _tracking = val;
  bool hasTracking() => _tracking != null;

  static RentalStruct fromMap(Map<String, dynamic> data) => RentalStruct(
        company: data['company'] as String?,
        ticketsPaid: data['tickets_paid'] as String?,
        v5Logbook: data['V5_logbook'] as String?,
        blackBox: data['black_box'] as String?,
        tracking: data['tracking'] as String?,
      );

  static RentalStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? RentalStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'company': _company,
        'tickets_paid': _ticketsPaid,
        'V5_logbook': _v5Logbook,
        'black_box': _blackBox,
        'tracking': _tracking,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'company': serializeParam(
          _company,
          ParamType.String,
        ),
        'tickets_paid': serializeParam(
          _ticketsPaid,
          ParamType.String,
        ),
        'V5_logbook': serializeParam(
          _v5Logbook,
          ParamType.String,
        ),
        'black_box': serializeParam(
          _blackBox,
          ParamType.String,
        ),
        'tracking': serializeParam(
          _tracking,
          ParamType.String,
        ),
      }.withoutNulls;

  static RentalStruct fromSerializableMap(Map<String, dynamic> data) =>
      RentalStruct(
        company: deserializeParam(
          data['company'],
          ParamType.String,
          false,
        ),
        ticketsPaid: deserializeParam(
          data['tickets_paid'],
          ParamType.String,
          false,
        ),
        v5Logbook: deserializeParam(
          data['V5_logbook'],
          ParamType.String,
          false,
        ),
        blackBox: deserializeParam(
          data['black_box'],
          ParamType.String,
          false,
        ),
        tracking: deserializeParam(
          data['tracking'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'RentalStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is RentalStruct &&
        company == other.company &&
        ticketsPaid == other.ticketsPaid &&
        v5Logbook == other.v5Logbook &&
        blackBox == other.blackBox &&
        tracking == other.tracking;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([company, ticketsPaid, v5Logbook, blackBox, tracking]);
}

RentalStruct createRentalStruct({
  String? company,
  String? ticketsPaid,
  String? v5Logbook,
  String? blackBox,
  String? tracking,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    RentalStruct(
      company: company,
      ticketsPaid: ticketsPaid,
      v5Logbook: v5Logbook,
      blackBox: blackBox,
      tracking: tracking,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

RentalStruct? updateRentalStruct(
  RentalStruct? rental, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    rental
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addRentalStructData(
  Map<String, dynamic> firestoreData,
  RentalStruct? rental,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (rental == null) {
    return;
  }
  if (rental.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && rental.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final rentalData = getRentalFirestoreData(rental, forFieldValue);
  final nestedData = rentalData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = rental.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getRentalFirestoreData(
  RentalStruct? rental, [
  bool forFieldValue = false,
]) {
  if (rental == null) {
    return {};
  }
  final firestoreData = mapToFirestore(rental.toMap());

  // Add any Firestore field values
  rental.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getRentalListFirestoreData(
  List<RentalStruct>? rentals,
) =>
    rentals?.map((e) => getRentalFirestoreData(e, true)).toList() ?? [];
