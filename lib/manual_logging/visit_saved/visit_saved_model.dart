import '/components/custom_nav_bar_visit_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'visit_saved_widget.dart' show VisitSavedWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class VisitSavedModel extends FlutterFlowModel<VisitSavedWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for customNavBarVisit component.
  late CustomNavBarVisitModel customNavBarVisitModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    customNavBarVisitModel =
        createModel(context, () => CustomNavBarVisitModel());
  }

  void dispose() {
    customNavBarVisitModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
