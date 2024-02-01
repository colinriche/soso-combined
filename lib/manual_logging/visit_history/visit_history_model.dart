import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/custom_nav_bar_visit_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'visit_history_widget.dart' show VisitHistoryWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class VisitHistoryModel extends FlutterFlowModel<VisitHistoryWidget> {
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
