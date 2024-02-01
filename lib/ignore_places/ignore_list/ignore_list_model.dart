import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/custom_nav_bar_map2_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'ignore_list_widget.dart' show IgnoreListWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class IgnoreListModel extends FlutterFlowModel<IgnoreListWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for customNavBarMap2 component.
  late CustomNavBarMap2Model customNavBarMap2Model;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    customNavBarMap2Model = createModel(context, () => CustomNavBarMap2Model());
  }

  void dispose() {
    customNavBarMap2Model.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
