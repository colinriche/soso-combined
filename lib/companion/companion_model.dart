import '/components/custom_nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'companion_widget.dart' show CompanionWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CompanionModel extends FlutterFlowModel<CompanionWidget> {
  ///  State fields for stateful widgets in this page.

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
