import '/components/custom_nav_bar_msg_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'sent_message_widget.dart' show SentMessageWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SentMessageModel extends FlutterFlowModel<SentMessageWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for customNavBarMsg component.
  late CustomNavBarMsgModel customNavBarMsgModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    customNavBarMsgModel = createModel(context, () => CustomNavBarMsgModel());
  }

  void dispose() {
    customNavBarMsgModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
