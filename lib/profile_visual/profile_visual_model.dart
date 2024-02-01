import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/delete_account_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'profile_visual_widget.dart' show ProfileVisualWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ProfileVisualModel extends FlutterFlowModel<ProfileVisualWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for deleteAccount component.
  late DeleteAccountModel deleteAccountModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    deleteAccountModel = createModel(context, () => DeleteAccountModel());
  }

  void dispose() {
    deleteAccountModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
