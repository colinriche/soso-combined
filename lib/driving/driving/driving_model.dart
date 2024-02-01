import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/custom_nav_bar_settings_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'driving_widget.dart' show DrivingWidget;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DrivingModel extends FlutterFlowModel<DrivingWidget> {
  ///  Local state fields for this page.

  int? trigger7 = 0;

  ///  State fields for stateful widgets in this page.

  // State field(s) for Carousel widget.
  CarouselController? carouselController;

  int carouselCurrentIndex = 0;

  LogsRecord? listViewPreviousSnapshot;
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
