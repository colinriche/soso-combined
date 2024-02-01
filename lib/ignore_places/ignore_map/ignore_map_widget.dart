import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/custom_nav_bar_map2_widget.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'ignore_map_model.dart';
export 'ignore_map_model.dart';

class IgnoreMapWidget extends StatefulWidget {
  const IgnoreMapWidget({Key? key}) : super(key: key);

  @override
  _IgnoreMapWidgetState createState() => _IgnoreMapWidgetState();
}

class _IgnoreMapWidgetState extends State<IgnoreMapWidget> {
  late IgnoreMapModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  LatLng? currentUserLocationValue;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => IgnoreMapModel());

    getCurrentUserLocation(defaultLocation: LatLng(0.0, 0.0), cached: true)
        .then((loc) => setState(() => currentUserLocationValue = loc));
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    context.watch<FFAppState>();
    if (currentUserLocationValue == null) {
      return Container(
        color: FlutterFlowTheme.of(context).primaryBackground,
        child: Center(
          child: SizedBox(
            width: 50.0,
            height: 50.0,
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(
                FlutterFlowTheme.of(context).primary,
              ),
            ),
          ),
        ),
      );
    }

    return Title(
        title: 'ignore-map',
        color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
        child: Scaffold(
          key: scaffoldKey,
          resizeToAvoidBottomInset: false,
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          body: Stack(
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                child: Container(
                  height: MediaQuery.sizeOf(context).height * 0.9,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        'Ignore Places',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Readex Pro',
                              fontSize: 18.0,
                            ),
                      ),
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              10.0, 10.0, 10.0, 10.0),
                          child: Text(
                            'Click red pin to ignore location',
                            textAlign: TextAlign.center,
                            style: FlutterFlowTheme.of(context).bodyMedium,
                          ),
                        ),
                      ),
                      Expanded(
                        child: FutureBuilder<List<PlacesRecord>>(
                          future: queryPlacesRecordOnce(
                            limit: 50,
                          ),
                          builder: (context, snapshot) {
                            // Customize what your widget looks like when it's loading.
                            if (!snapshot.hasData) {
                              return Center(
                                child: SizedBox(
                                  width: 50.0,
                                  height: 50.0,
                                  child: CircularProgressIndicator(
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      FlutterFlowTheme.of(context).primary,
                                    ),
                                  ),
                                ),
                              );
                            }
                            List<PlacesRecord> googleMapPlacesRecordList =
                                snapshot.data!;
                            return FlutterFlowGoogleMap(
                              controller: _model.googleMapsController,
                              onCameraIdle: (latLng) => setState(
                                  () => _model.googleMapsCenter = latLng),
                              initialLocation: _model.googleMapsCenter ??=
                                  currentUserLocationValue!,
                              markers: googleMapPlacesRecordList
                                  .map(
                                    (googleMapPlacesRecord) =>
                                        FlutterFlowMarker(
                                      googleMapPlacesRecord.reference.path,
                                      googleMapPlacesRecord.latlang!,
                                      () async {
                                        await IgnoreListRecord.collection
                                            .doc()
                                            .set(createIgnoreListRecordData(
                                              userRef: currentUserReference,
                                              placeName:
                                                  googleMapPlacesRecord.name,
                                              userEmail: currentUserEmail,
                                              placeId: valueOrDefault<int>(
                                                googleMapPlacesRecord.placeId,
                                                0,
                                              ),
                                              latlang:
                                                  googleMapPlacesRecord.latlang,
                                            ));

                                        context.pushNamed('ignoreList');
                                      },
                                    ),
                                  )
                                  .toList(),
                              markerColor: GoogleMarkerColor.red,
                              mapType: MapType.normal,
                              style: GoogleMapStyle.standard,
                              initialZoom: 14.0,
                              allowInteraction: true,
                              allowZoom: true,
                              showZoomControls: true,
                              showLocation: true,
                              showCompass: true,
                              showMapToolbar: true,
                              showTraffic: false,
                              centerMapOnMarkerTap: true,
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0.00, 1.00),
                child: wrapWithModel(
                  model: _model.customNavBarMap2Model,
                  updateCallback: () => setState(() {}),
                  child: CustomNavBarMap2Widget(
                    hidden: false,
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
