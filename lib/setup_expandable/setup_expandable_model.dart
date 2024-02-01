import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/custom_nav_bar_menu_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import 'setup_expandable_widget.dart' show SetupExpandableWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SetupExpandableModel extends FlutterFlowModel<SetupExpandableWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for Expandable widget.
  late ExpandableController expandableController1;

  // State field(s) for firstName widget.
  FocusNode? firstNameFocusNode;
  TextEditingController? firstNameController;
  String? Function(BuildContext, String?)? firstNameControllerValidator;
  // State field(s) for mobilePhone widget.
  FocusNode? mobilePhoneFocusNode;
  TextEditingController? mobilePhoneController;
  String? Function(BuildContext, String?)? mobilePhoneControllerValidator;
  // State field(s) for Expandable widget.
  late ExpandableController expandableController2;

  // State field(s) for Plate1-input widget.
  FocusNode? plate1InputFocusNode;
  TextEditingController? plate1InputController;
  String? Function(BuildContext, String?)? plate1InputControllerValidator;
  // State field(s) for nickname1-input widget.
  FocusNode? nickname1InputFocusNode;
  TextEditingController? nickname1InputController;
  String? Function(BuildContext, String?)? nickname1InputControllerValidator;
  // State field(s) for PrivateVehicle widget.
  bool? privateVehicleValue1;
  // State field(s) for Keeper widget.
  bool? keeperValue1;
  // State field(s) for AutoTickets widget.
  bool? autoTicketsValue1;
  // State field(s) for Rental widget.
  bool? rentalValue1;
  // State field(s) for Commercial widget.
  bool? commercialValue1;
  // State field(s) for Expandable widget.
  late ExpandableController expandableController3;

  // State field(s) for Plate2-input widget.
  FocusNode? plate2InputFocusNode;
  TextEditingController? plate2InputController;
  String? Function(BuildContext, String?)? plate2InputControllerValidator;
  // State field(s) for nickname2-input widget.
  FocusNode? nickname2InputFocusNode;
  TextEditingController? nickname2InputController;
  String? Function(BuildContext, String?)? nickname2InputControllerValidator;
  // State field(s) for PrivateVehicle widget.
  bool? privateVehicleValue2;
  // State field(s) for Keeper widget.
  bool? keeperValue2;
  // State field(s) for AutoTickets widget.
  bool? autoTicketsValue2;
  // State field(s) for Rental widget.
  bool? rentalValue2;
  // State field(s) for Commercial widget.
  bool? commercialValue2;
  // State field(s) for Expandable widget.
  late ExpandableController expandableController4;

  // State field(s) for BlueBadge_id widget.
  FocusNode? blueBadgeIdFocusNode;
  TextEditingController? blueBadgeIdController;
  String? Function(BuildContext, String?)? blueBadgeIdControllerValidator;
  // State field(s) for Expandable widget.
  late ExpandableController expandableController5;

  // State field(s) for BlueBadgeDriver widget.
  bool? blueBadgeDriverValue;
  // State field(s) for Expandable widget.
  late ExpandableController expandableController6;

  // State field(s) for ParkingSpace widget.
  bool? parkingSpaceValue;
  // State field(s) for Expandable widget.
  late ExpandableController expandableController7;

  // State field(s) for ParkingPermit widget.
  bool? parkingPermitValue;
  // Model for customNavBarMenu component.
  late CustomNavBarMenuModel customNavBarMenuModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    customNavBarMenuModel = createModel(context, () => CustomNavBarMenuModel());
  }

  void dispose() {
    unfocusNode.dispose();
    expandableController1.dispose();
    firstNameFocusNode?.dispose();
    firstNameController?.dispose();

    mobilePhoneFocusNode?.dispose();
    mobilePhoneController?.dispose();

    expandableController2.dispose();
    plate1InputFocusNode?.dispose();
    plate1InputController?.dispose();

    nickname1InputFocusNode?.dispose();
    nickname1InputController?.dispose();

    expandableController3.dispose();
    plate2InputFocusNode?.dispose();
    plate2InputController?.dispose();

    nickname2InputFocusNode?.dispose();
    nickname2InputController?.dispose();

    expandableController4.dispose();
    blueBadgeIdFocusNode?.dispose();
    blueBadgeIdController?.dispose();

    expandableController5.dispose();
    expandableController6.dispose();
    expandableController7.dispose();
    customNavBarMenuModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
