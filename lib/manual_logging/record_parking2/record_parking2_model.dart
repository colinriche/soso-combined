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
import 'record_parking2_widget.dart' show RecordParking2Widget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class RecordParking2Model extends FlutterFlowModel<RecordParking2Widget> {
  ///  Local state fields for this page.

  String? locationCheck = 'location?';

  ///  State fields for stateful widgets in this page.

  // State field(s) for DropDown widget.
  int? dropDownValue1;
  FormFieldController<int>? dropDownValueController1;
  // State field(s) for DropDown widget.
  int? dropDownValue2;
  FormFieldController<int>? dropDownValueController2;
  // Stores action output result for [Backend Call - API (GeoCoding)] action in Button widget.
  ApiCallResponse? lookupAddress;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  ActionListRecord? lookupAction;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  OptionListRecord? lookupOption;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  VisitsRecord? saveVisit;
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
