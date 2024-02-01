import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/custom_nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'message_operator_widget.dart' show MessageOperatorWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MessageOperatorModel extends FlutterFlowModel<MessageOperatorWidget> {
  ///  Local state fields for this page.

  LatLng? checkLocation;

  String? locationCheck = '';

  ///  State fields for stateful widgets in this page.

  // State field(s) for DropDown widget.
  int? dropDownValue1;
  FormFieldController<int>? dropDownValueController1;
  // State field(s) for DropDown widget.
  int? dropDownValue2;
  FormFieldController<int>? dropDownValueController2;
  // State field(s) for Checkbox widget.
  bool? checkboxValue;
  // Stores action output result for [Backend Call - API (GeoCoding)] action in Button widget.
  ApiCallResponse? addressLookup;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  OperatorsRecord? operatorLookup;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  MessageListRecord? messageLookup;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  MessagesRecord? sendMessageGps;
  // Model for customNavBar component.
  late CustomNavBarModel customNavBarModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    customNavBarModel = createModel(context, () => CustomNavBarModel());
  }

  void dispose() {
    customNavBarModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
