import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'setup_vertical_widget.dart' show SetupVerticalWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SetupVerticalModel extends FlutterFlowModel<SetupVerticalWidget> {
  ///  Local state fields for this page.

  String? plate1 = '';

  String? plate1nick = '';

  String? plate2 = '';

  String? plate2nick = '';

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  // State field(s) for firstName widget.
  FocusNode? firstNameFocusNode;
  TextEditingController? firstNameController;
  String? Function(BuildContext, String?)? firstNameControllerValidator;
  // State field(s) for mobilePhone widget.
  FocusNode? mobilePhoneFocusNode;
  TextEditingController? mobilePhoneController;
  String? Function(BuildContext, String?)? mobilePhoneControllerValidator;
  // State field(s) for Plate1 widget.
  FocusNode? plate1FocusNode;
  TextEditingController? plate1Controller;
  String? Function(BuildContext, String?)? plate1ControllerValidator;
  // State field(s) for nickname1 widget.
  FocusNode? nickname1FocusNode;
  TextEditingController? nickname1Controller;
  String? Function(BuildContext, String?)? nickname1ControllerValidator;
  // State field(s) for PrivateVehicle widget.
  bool? privateVehicleValue;
  // State field(s) for Keeper widget.
  bool? keeperValue;
  // State field(s) for AutoTickets widget.
  bool? autoTicketsValue;
  // State field(s) for Rental widget.
  bool? rentalValue;
  // State field(s) for Commercial widget.
  bool? commercialValue;
  // State field(s) for Plate2 widget.
  FocusNode? plate2FocusNode;
  TextEditingController? plate2Controller;
  String? Function(BuildContext, String?)? plate2ControllerValidator;
  // State field(s) for nickname2 widget.
  FocusNode? nickname2FocusNode;
  TextEditingController? nickname2Controller;
  String? Function(BuildContext, String?)? nickname2ControllerValidator;
  // State field(s) for PrivateVehicle2 widget.
  bool? privateVehicle2Value;
  // State field(s) for Keeper2 widget.
  bool? keeper2Value;
  // State field(s) for AutoTickets2 widget.
  bool? autoTickets2Value;
  // State field(s) for Rental2 widget.
  bool? rental2Value;
  // State field(s) for Commercial2 widget.
  bool? commercial2Value;
  // State field(s) for BlueBadge_id widget.
  FocusNode? blueBadgeIdFocusNode;
  TextEditingController? blueBadgeIdController;
  String? Function(BuildContext, String?)? blueBadgeIdControllerValidator;
  // State field(s) for BlueBadgeDriver widget.
  bool? blueBadgeDriverValue;
  // State field(s) for ParkingSpace widget.
  bool? parkingSpaceValue;
  // State field(s) for ParkingPermit widget.
  bool? parkingPermitValue;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
    firstNameFocusNode?.dispose();
    firstNameController?.dispose();

    mobilePhoneFocusNode?.dispose();
    mobilePhoneController?.dispose();

    plate1FocusNode?.dispose();
    plate1Controller?.dispose();

    nickname1FocusNode?.dispose();
    nickname1Controller?.dispose();

    plate2FocusNode?.dispose();
    plate2Controller?.dispose();

    nickname2FocusNode?.dispose();
    nickname2Controller?.dispose();

    blueBadgeIdFocusNode?.dispose();
    blueBadgeIdController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
