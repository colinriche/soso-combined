// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class VenueInfoStruct extends FFFirebaseStruct {
  VenueInfoStruct({
    String? retailer,
    String? address,
    String? postcode,
    String? retailerEmail,
    String? parkingCompany,
    String? landowner,
    String? landownerAddress,
    String? landownerEmail,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _retailer = retailer,
        _address = address,
        _postcode = postcode,
        _retailerEmail = retailerEmail,
        _parkingCompany = parkingCompany,
        _landowner = landowner,
        _landownerAddress = landownerAddress,
        _landownerEmail = landownerEmail,
        super(firestoreUtilData);

  // "retailer" field.
  String? _retailer;
  String get retailer => _retailer ?? '';
  set retailer(String? val) => _retailer = val;
  bool hasRetailer() => _retailer != null;

  // "address" field.
  String? _address;
  String get address => _address ?? '';
  set address(String? val) => _address = val;
  bool hasAddress() => _address != null;

  // "postcode" field.
  String? _postcode;
  String get postcode => _postcode ?? '';
  set postcode(String? val) => _postcode = val;
  bool hasPostcode() => _postcode != null;

  // "retailer_email" field.
  String? _retailerEmail;
  String get retailerEmail => _retailerEmail ?? '';
  set retailerEmail(String? val) => _retailerEmail = val;
  bool hasRetailerEmail() => _retailerEmail != null;

  // "parking_company" field.
  String? _parkingCompany;
  String get parkingCompany => _parkingCompany ?? '';
  set parkingCompany(String? val) => _parkingCompany = val;
  bool hasParkingCompany() => _parkingCompany != null;

  // "landowner" field.
  String? _landowner;
  String get landowner => _landowner ?? '';
  set landowner(String? val) => _landowner = val;
  bool hasLandowner() => _landowner != null;

  // "landowner_address" field.
  String? _landownerAddress;
  String get landownerAddress => _landownerAddress ?? '';
  set landownerAddress(String? val) => _landownerAddress = val;
  bool hasLandownerAddress() => _landownerAddress != null;

  // "landowner_email" field.
  String? _landownerEmail;
  String get landownerEmail => _landownerEmail ?? '';
  set landownerEmail(String? val) => _landownerEmail = val;
  bool hasLandownerEmail() => _landownerEmail != null;

  static VenueInfoStruct fromMap(Map<String, dynamic> data) => VenueInfoStruct(
        retailer: data['retailer'] as String?,
        address: data['address'] as String?,
        postcode: data['postcode'] as String?,
        retailerEmail: data['retailer_email'] as String?,
        parkingCompany: data['parking_company'] as String?,
        landowner: data['landowner'] as String?,
        landownerAddress: data['landowner_address'] as String?,
        landownerEmail: data['landowner_email'] as String?,
      );

  static VenueInfoStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? VenueInfoStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'retailer': _retailer,
        'address': _address,
        'postcode': _postcode,
        'retailer_email': _retailerEmail,
        'parking_company': _parkingCompany,
        'landowner': _landowner,
        'landowner_address': _landownerAddress,
        'landowner_email': _landownerEmail,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'retailer': serializeParam(
          _retailer,
          ParamType.String,
        ),
        'address': serializeParam(
          _address,
          ParamType.String,
        ),
        'postcode': serializeParam(
          _postcode,
          ParamType.String,
        ),
        'retailer_email': serializeParam(
          _retailerEmail,
          ParamType.String,
        ),
        'parking_company': serializeParam(
          _parkingCompany,
          ParamType.String,
        ),
        'landowner': serializeParam(
          _landowner,
          ParamType.String,
        ),
        'landowner_address': serializeParam(
          _landownerAddress,
          ParamType.String,
        ),
        'landowner_email': serializeParam(
          _landownerEmail,
          ParamType.String,
        ),
      }.withoutNulls;

  static VenueInfoStruct fromSerializableMap(Map<String, dynamic> data) =>
      VenueInfoStruct(
        retailer: deserializeParam(
          data['retailer'],
          ParamType.String,
          false,
        ),
        address: deserializeParam(
          data['address'],
          ParamType.String,
          false,
        ),
        postcode: deserializeParam(
          data['postcode'],
          ParamType.String,
          false,
        ),
        retailerEmail: deserializeParam(
          data['retailer_email'],
          ParamType.String,
          false,
        ),
        parkingCompany: deserializeParam(
          data['parking_company'],
          ParamType.String,
          false,
        ),
        landowner: deserializeParam(
          data['landowner'],
          ParamType.String,
          false,
        ),
        landownerAddress: deserializeParam(
          data['landowner_address'],
          ParamType.String,
          false,
        ),
        landownerEmail: deserializeParam(
          data['landowner_email'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'VenueInfoStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is VenueInfoStruct &&
        retailer == other.retailer &&
        address == other.address &&
        postcode == other.postcode &&
        retailerEmail == other.retailerEmail &&
        parkingCompany == other.parkingCompany &&
        landowner == other.landowner &&
        landownerAddress == other.landownerAddress &&
        landownerEmail == other.landownerEmail;
  }

  @override
  int get hashCode => const ListEquality().hash([
        retailer,
        address,
        postcode,
        retailerEmail,
        parkingCompany,
        landowner,
        landownerAddress,
        landownerEmail
      ]);
}

VenueInfoStruct createVenueInfoStruct({
  String? retailer,
  String? address,
  String? postcode,
  String? retailerEmail,
  String? parkingCompany,
  String? landowner,
  String? landownerAddress,
  String? landownerEmail,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    VenueInfoStruct(
      retailer: retailer,
      address: address,
      postcode: postcode,
      retailerEmail: retailerEmail,
      parkingCompany: parkingCompany,
      landowner: landowner,
      landownerAddress: landownerAddress,
      landownerEmail: landownerEmail,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

VenueInfoStruct? updateVenueInfoStruct(
  VenueInfoStruct? venueInfo, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    venueInfo
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addVenueInfoStructData(
  Map<String, dynamic> firestoreData,
  VenueInfoStruct? venueInfo,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (venueInfo == null) {
    return;
  }
  if (venueInfo.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && venueInfo.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final venueInfoData = getVenueInfoFirestoreData(venueInfo, forFieldValue);
  final nestedData = venueInfoData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = venueInfo.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getVenueInfoFirestoreData(
  VenueInfoStruct? venueInfo, [
  bool forFieldValue = false,
]) {
  if (venueInfo == null) {
    return {};
  }
  final firestoreData = mapToFirestore(venueInfo.toMap());

  // Add any Firestore field values
  venueInfo.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getVenueInfoListFirestoreData(
  List<VenueInfoStruct>? venueInfos,
) =>
    venueInfos?.map((e) => getVenueInfoFirestoreData(e, true)).toList() ?? [];
