import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/custom_nav_bar_map2_widget.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'ignored_list_map_widget.dart' show IgnoredListMapWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class IgnoredListMapModel extends FlutterFlowModel<IgnoredListMapWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for GoogleMap widget.
  LatLng? googleMapsCenter;
  final googleMapsController = Completer<GoogleMapController>();
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
