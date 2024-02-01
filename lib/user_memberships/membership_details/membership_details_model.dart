import '/backend/backend.dart';
import '/components/custom_nav_bar_member_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'membership_details_widget.dart' show MembershipDetailsWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MembershipDetailsModel extends FlutterFlowModel<MembershipDetailsWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for customNavBarMember component.
  late CustomNavBarMemberModel customNavBarMemberModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    customNavBarMemberModel =
        createModel(context, () => CustomNavBarMemberModel());
  }

  void dispose() {
    customNavBarMemberModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
