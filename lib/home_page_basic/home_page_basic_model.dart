import '/auth/base_auth_user_provider.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/components/custom_nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'home_page_basic_widget.dart' show HomePageBasicWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomePageBasicModel extends FlutterFlowModel<HomePageBasicWidget> {
  ///  Local state fields for this page.

  int? rndStatus = 0;

  String? rngStatus = '???';

  String? rngName = '???';

  String? newGeoName = '???';

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
