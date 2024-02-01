import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/custom_nav_bar_settings_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'select_vehicle2_widget.dart' show SelectVehicle2Widget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SelectVehicle2Model extends FlutterFlowModel<SelectVehicle2Widget> {
  ///  Local state fields for this page.

  int? trigger7 = 0;

  ///  State fields for stateful widgets in this page.

  // Model for customNavBarSettings component.
  late CustomNavBarSettingsModel customNavBarSettingsModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    customNavBarSettingsModel =
        createModel(context, () => CustomNavBarSettingsModel());
  }

  void dispose() {
    customNavBarSettingsModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
