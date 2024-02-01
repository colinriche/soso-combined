// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class VehicleStruct extends FFFirebaseStruct {
  VehicleStruct({
    String? licencePlate,
    bool? keeper,
    String? nickName,
    String? make,
    String? model,
    String? colour,
    bool? electric,
    bool? private,
    bool? leaseed,
    bool? rented,
    bool? companyCar,
    String? leasingCompany,
    String? rentalCompany,
    bool? automaticTickets,
    bool? v5LogbookHeld,
    bool? blackBox,
    bool? trackerInstalled,
    bool? dashCam,
    String? platePhotoUrl,
    String? parkingPermitUrl,
    bool? commercialUse,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _licencePlate = licencePlate,
        _keeper = keeper,
        _nickName = nickName,
        _make = make,
        _model = model,
        _colour = colour,
        _electric = electric,
        _private = private,
        _leaseed = leaseed,
        _rented = rented,
        _companyCar = companyCar,
        _leasingCompany = leasingCompany,
        _rentalCompany = rentalCompany,
        _automaticTickets = automaticTickets,
        _v5LogbookHeld = v5LogbookHeld,
        _blackBox = blackBox,
        _trackerInstalled = trackerInstalled,
        _dashCam = dashCam,
        _platePhotoUrl = platePhotoUrl,
        _parkingPermitUrl = parkingPermitUrl,
        _commercialUse = commercialUse,
        super(firestoreUtilData);

  // "licence_plate" field.
  String? _licencePlate;
  String get licencePlate => _licencePlate ?? '';
  set licencePlate(String? val) => _licencePlate = val;
  bool hasLicencePlate() => _licencePlate != null;

  // "keeper" field.
  bool? _keeper;
  bool get keeper => _keeper ?? false;
  set keeper(bool? val) => _keeper = val;
  bool hasKeeper() => _keeper != null;

  // "nick_name" field.
  String? _nickName;
  String get nickName => _nickName ?? '';
  set nickName(String? val) => _nickName = val;
  bool hasNickName() => _nickName != null;

  // "make" field.
  String? _make;
  String get make => _make ?? '';
  set make(String? val) => _make = val;
  bool hasMake() => _make != null;

  // "model" field.
  String? _model;
  String get model => _model ?? '';
  set model(String? val) => _model = val;
  bool hasModel() => _model != null;

  // "colour" field.
  String? _colour;
  String get colour => _colour ?? '';
  set colour(String? val) => _colour = val;
  bool hasColour() => _colour != null;

  // "electric" field.
  bool? _electric;
  bool get electric => _electric ?? false;
  set electric(bool? val) => _electric = val;
  bool hasElectric() => _electric != null;

  // "private" field.
  bool? _private;
  bool get private => _private ?? false;
  set private(bool? val) => _private = val;
  bool hasPrivate() => _private != null;

  // "leaseed" field.
  bool? _leaseed;
  bool get leaseed => _leaseed ?? false;
  set leaseed(bool? val) => _leaseed = val;
  bool hasLeaseed() => _leaseed != null;

  // "rented" field.
  bool? _rented;
  bool get rented => _rented ?? false;
  set rented(bool? val) => _rented = val;
  bool hasRented() => _rented != null;

  // "company_car" field.
  bool? _companyCar;
  bool get companyCar => _companyCar ?? false;
  set companyCar(bool? val) => _companyCar = val;
  bool hasCompanyCar() => _companyCar != null;

  // "leasing_company" field.
  String? _leasingCompany;
  String get leasingCompany => _leasingCompany ?? '';
  set leasingCompany(String? val) => _leasingCompany = val;
  bool hasLeasingCompany() => _leasingCompany != null;

  // "rental_company" field.
  String? _rentalCompany;
  String get rentalCompany => _rentalCompany ?? '';
  set rentalCompany(String? val) => _rentalCompany = val;
  bool hasRentalCompany() => _rentalCompany != null;

  // "automatic_tickets" field.
  bool? _automaticTickets;
  bool get automaticTickets => _automaticTickets ?? false;
  set automaticTickets(bool? val) => _automaticTickets = val;
  bool hasAutomaticTickets() => _automaticTickets != null;

  // "V5_logbook_held" field.
  bool? _v5LogbookHeld;
  bool get v5LogbookHeld => _v5LogbookHeld ?? false;
  set v5LogbookHeld(bool? val) => _v5LogbookHeld = val;
  bool hasV5LogbookHeld() => _v5LogbookHeld != null;

  // "black_box" field.
  bool? _blackBox;
  bool get blackBox => _blackBox ?? false;
  set blackBox(bool? val) => _blackBox = val;
  bool hasBlackBox() => _blackBox != null;

  // "tracker_installed" field.
  bool? _trackerInstalled;
  bool get trackerInstalled => _trackerInstalled ?? false;
  set trackerInstalled(bool? val) => _trackerInstalled = val;
  bool hasTrackerInstalled() => _trackerInstalled != null;

  // "dash_cam" field.
  bool? _dashCam;
  bool get dashCam => _dashCam ?? false;
  set dashCam(bool? val) => _dashCam = val;
  bool hasDashCam() => _dashCam != null;

  // "plate_photo_url" field.
  String? _platePhotoUrl;
  String get platePhotoUrl => _platePhotoUrl ?? '';
  set platePhotoUrl(String? val) => _platePhotoUrl = val;
  bool hasPlatePhotoUrl() => _platePhotoUrl != null;

  // "parking_permit_url" field.
  String? _parkingPermitUrl;
  String get parkingPermitUrl => _parkingPermitUrl ?? '';
  set parkingPermitUrl(String? val) => _parkingPermitUrl = val;
  bool hasParkingPermitUrl() => _parkingPermitUrl != null;

  // "commercial_use" field.
  bool? _commercialUse;
  bool get commercialUse => _commercialUse ?? false;
  set commercialUse(bool? val) => _commercialUse = val;
  bool hasCommercialUse() => _commercialUse != null;

  static VehicleStruct fromMap(Map<String, dynamic> data) => VehicleStruct(
        licencePlate: data['licence_plate'] as String?,
        keeper: data['keeper'] as bool?,
        nickName: data['nick_name'] as String?,
        make: data['make'] as String?,
        model: data['model'] as String?,
        colour: data['colour'] as String?,
        electric: data['electric'] as bool?,
        private: data['private'] as bool?,
        leaseed: data['leaseed'] as bool?,
        rented: data['rented'] as bool?,
        companyCar: data['company_car'] as bool?,
        leasingCompany: data['leasing_company'] as String?,
        rentalCompany: data['rental_company'] as String?,
        automaticTickets: data['automatic_tickets'] as bool?,
        v5LogbookHeld: data['V5_logbook_held'] as bool?,
        blackBox: data['black_box'] as bool?,
        trackerInstalled: data['tracker_installed'] as bool?,
        dashCam: data['dash_cam'] as bool?,
        platePhotoUrl: data['plate_photo_url'] as String?,
        parkingPermitUrl: data['parking_permit_url'] as String?,
        commercialUse: data['commercial_use'] as bool?,
      );

  static VehicleStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? VehicleStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'licence_plate': _licencePlate,
        'keeper': _keeper,
        'nick_name': _nickName,
        'make': _make,
        'model': _model,
        'colour': _colour,
        'electric': _electric,
        'private': _private,
        'leaseed': _leaseed,
        'rented': _rented,
        'company_car': _companyCar,
        'leasing_company': _leasingCompany,
        'rental_company': _rentalCompany,
        'automatic_tickets': _automaticTickets,
        'V5_logbook_held': _v5LogbookHeld,
        'black_box': _blackBox,
        'tracker_installed': _trackerInstalled,
        'dash_cam': _dashCam,
        'plate_photo_url': _platePhotoUrl,
        'parking_permit_url': _parkingPermitUrl,
        'commercial_use': _commercialUse,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'licence_plate': serializeParam(
          _licencePlate,
          ParamType.String,
        ),
        'keeper': serializeParam(
          _keeper,
          ParamType.bool,
        ),
        'nick_name': serializeParam(
          _nickName,
          ParamType.String,
        ),
        'make': serializeParam(
          _make,
          ParamType.String,
        ),
        'model': serializeParam(
          _model,
          ParamType.String,
        ),
        'colour': serializeParam(
          _colour,
          ParamType.String,
        ),
        'electric': serializeParam(
          _electric,
          ParamType.bool,
        ),
        'private': serializeParam(
          _private,
          ParamType.bool,
        ),
        'leaseed': serializeParam(
          _leaseed,
          ParamType.bool,
        ),
        'rented': serializeParam(
          _rented,
          ParamType.bool,
        ),
        'company_car': serializeParam(
          _companyCar,
          ParamType.bool,
        ),
        'leasing_company': serializeParam(
          _leasingCompany,
          ParamType.String,
        ),
        'rental_company': serializeParam(
          _rentalCompany,
          ParamType.String,
        ),
        'automatic_tickets': serializeParam(
          _automaticTickets,
          ParamType.bool,
        ),
        'V5_logbook_held': serializeParam(
          _v5LogbookHeld,
          ParamType.bool,
        ),
        'black_box': serializeParam(
          _blackBox,
          ParamType.bool,
        ),
        'tracker_installed': serializeParam(
          _trackerInstalled,
          ParamType.bool,
        ),
        'dash_cam': serializeParam(
          _dashCam,
          ParamType.bool,
        ),
        'plate_photo_url': serializeParam(
          _platePhotoUrl,
          ParamType.String,
        ),
        'parking_permit_url': serializeParam(
          _parkingPermitUrl,
          ParamType.String,
        ),
        'commercial_use': serializeParam(
          _commercialUse,
          ParamType.bool,
        ),
      }.withoutNulls;

  static VehicleStruct fromSerializableMap(Map<String, dynamic> data) =>
      VehicleStruct(
        licencePlate: deserializeParam(
          data['licence_plate'],
          ParamType.String,
          false,
        ),
        keeper: deserializeParam(
          data['keeper'],
          ParamType.bool,
          false,
        ),
        nickName: deserializeParam(
          data['nick_name'],
          ParamType.String,
          false,
        ),
        make: deserializeParam(
          data['make'],
          ParamType.String,
          false,
        ),
        model: deserializeParam(
          data['model'],
          ParamType.String,
          false,
        ),
        colour: deserializeParam(
          data['colour'],
          ParamType.String,
          false,
        ),
        electric: deserializeParam(
          data['electric'],
          ParamType.bool,
          false,
        ),
        private: deserializeParam(
          data['private'],
          ParamType.bool,
          false,
        ),
        leaseed: deserializeParam(
          data['leaseed'],
          ParamType.bool,
          false,
        ),
        rented: deserializeParam(
          data['rented'],
          ParamType.bool,
          false,
        ),
        companyCar: deserializeParam(
          data['company_car'],
          ParamType.bool,
          false,
        ),
        leasingCompany: deserializeParam(
          data['leasing_company'],
          ParamType.String,
          false,
        ),
        rentalCompany: deserializeParam(
          data['rental_company'],
          ParamType.String,
          false,
        ),
        automaticTickets: deserializeParam(
          data['automatic_tickets'],
          ParamType.bool,
          false,
        ),
        v5LogbookHeld: deserializeParam(
          data['V5_logbook_held'],
          ParamType.bool,
          false,
        ),
        blackBox: deserializeParam(
          data['black_box'],
          ParamType.bool,
          false,
        ),
        trackerInstalled: deserializeParam(
          data['tracker_installed'],
          ParamType.bool,
          false,
        ),
        dashCam: deserializeParam(
          data['dash_cam'],
          ParamType.bool,
          false,
        ),
        platePhotoUrl: deserializeParam(
          data['plate_photo_url'],
          ParamType.String,
          false,
        ),
        parkingPermitUrl: deserializeParam(
          data['parking_permit_url'],
          ParamType.String,
          false,
        ),
        commercialUse: deserializeParam(
          data['commercial_use'],
          ParamType.bool,
          false,
        ),
      );

  @override
  String toString() => 'VehicleStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is VehicleStruct &&
        licencePlate == other.licencePlate &&
        keeper == other.keeper &&
        nickName == other.nickName &&
        make == other.make &&
        model == other.model &&
        colour == other.colour &&
        electric == other.electric &&
        private == other.private &&
        leaseed == other.leaseed &&
        rented == other.rented &&
        companyCar == other.companyCar &&
        leasingCompany == other.leasingCompany &&
        rentalCompany == other.rentalCompany &&
        automaticTickets == other.automaticTickets &&
        v5LogbookHeld == other.v5LogbookHeld &&
        blackBox == other.blackBox &&
        trackerInstalled == other.trackerInstalled &&
        dashCam == other.dashCam &&
        platePhotoUrl == other.platePhotoUrl &&
        parkingPermitUrl == other.parkingPermitUrl &&
        commercialUse == other.commercialUse;
  }

  @override
  int get hashCode => const ListEquality().hash([
        licencePlate,
        keeper,
        nickName,
        make,
        model,
        colour,
        electric,
        private,
        leaseed,
        rented,
        companyCar,
        leasingCompany,
        rentalCompany,
        automaticTickets,
        v5LogbookHeld,
        blackBox,
        trackerInstalled,
        dashCam,
        platePhotoUrl,
        parkingPermitUrl,
        commercialUse
      ]);
}

VehicleStruct createVehicleStruct({
  String? licencePlate,
  bool? keeper,
  String? nickName,
  String? make,
  String? model,
  String? colour,
  bool? electric,
  bool? private,
  bool? leaseed,
  bool? rented,
  bool? companyCar,
  String? leasingCompany,
  String? rentalCompany,
  bool? automaticTickets,
  bool? v5LogbookHeld,
  bool? blackBox,
  bool? trackerInstalled,
  bool? dashCam,
  String? platePhotoUrl,
  String? parkingPermitUrl,
  bool? commercialUse,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    VehicleStruct(
      licencePlate: licencePlate,
      keeper: keeper,
      nickName: nickName,
      make: make,
      model: model,
      colour: colour,
      electric: electric,
      private: private,
      leaseed: leaseed,
      rented: rented,
      companyCar: companyCar,
      leasingCompany: leasingCompany,
      rentalCompany: rentalCompany,
      automaticTickets: automaticTickets,
      v5LogbookHeld: v5LogbookHeld,
      blackBox: blackBox,
      trackerInstalled: trackerInstalled,
      dashCam: dashCam,
      platePhotoUrl: platePhotoUrl,
      parkingPermitUrl: parkingPermitUrl,
      commercialUse: commercialUse,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

VehicleStruct? updateVehicleStruct(
  VehicleStruct? vehicle, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    vehicle
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addVehicleStructData(
  Map<String, dynamic> firestoreData,
  VehicleStruct? vehicle,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (vehicle == null) {
    return;
  }
  if (vehicle.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && vehicle.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final vehicleData = getVehicleFirestoreData(vehicle, forFieldValue);
  final nestedData = vehicleData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = vehicle.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getVehicleFirestoreData(
  VehicleStruct? vehicle, [
  bool forFieldValue = false,
]) {
  if (vehicle == null) {
    return {};
  }
  final firestoreData = mapToFirestore(vehicle.toMap());

  // Add any Firestore field values
  vehicle.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getVehicleListFirestoreData(
  List<VehicleStruct>? vehicles,
) =>
    vehicles?.map((e) => getVehicleFirestoreData(e, true)).toList() ?? [];
