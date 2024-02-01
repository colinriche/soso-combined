
import 'package:smooth_compass/utils/src/compass_ui.dart';

import '../../Geofencing/Geofence.dart';
import '/backend/backend.dart';
import '/components/custom_nav_bar_settings_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'driving_model.dart';
export 'driving_model.dart';

class DrivingWidget extends StatefulWidget {
  const DrivingWidget({Key? key,}) : super(key: key);


  @override
  _DrivingWidgetState createState() => _DrivingWidgetState();
}

class _DrivingWidgetState extends State<DrivingWidget> {
  late DrivingModel _model;
  final GeofenceServiceManager geofence= GeofenceServiceManager();
  final scaffoldKey = GlobalKey<ScaffoldState>();



  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DrivingModel());

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

    return StreamBuilder<List<LogsRecord>>(
      stream: queryLogsRecord(
        queryBuilder: (logsRecord) =>
            logsRecord.orderBy('time', descending: true),
        limit: 1,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            body: Center(
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
        List<LogsRecord> drivingLogsRecordList = snapshot.data!;
        return Title(
            title: 'Driving',
            color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
            child: Scaffold(
              key: scaffoldKey,
              backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
              body: Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: MediaQuery.sizeOf(context).height * 0.9,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 20.0, 0.0, 0.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Image.asset(
                                'assets/images/driving-in-dark.png',
                                width: double.infinity,
                                height: 200.0,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            height: 150.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            ),
                            child: Container(
                              width: double.infinity,
                              height: 180.0,
                              child: CarouselSlider(
                                items: [
                                  Align(

                                    child: StreamBuilder<Activity>(
                                      stream:geofence.activityStreamController.stream,
                                      builder: (context, snapshot) {
                                        if (snapshot.hasData) {
                                          double speedInMph = (snapshot.data!.speed * 2.23694);
                                          return Text(
                                            speedInMph.toStringAsFixed(2),
                                            style: const TextStyle(fontSize: 100),
                                          );
                                        } else {
                                          return const CircularProgressIndicator();
                                        }
                                      },
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(0.00, 0.00),
                                    child: SmoothCompass(
                                      height: 200,
                                      width: 200,
                                      compassBuilder: (context, snapshot, child) {
                                        double heading = snapshot?.data?.angle ?? 0.0;
                                        String direction = getCardinalDirection(heading);

                                        return Stack(
                                          children: [
                                            Positioned(
                                              bottom: 16.0,
                                              left: 0,
                                              right: 0,
                                              child: Text(
                                                direction,
                                                textAlign: TextAlign.center,
                                                style: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 60,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                          ],
                                        );
                                      },
                                    )
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(0.00, 0.00),
                                    child: Text(
                                      'Information',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Roboto',
                                            color: Color(0xFFF7C933),
                                            fontSize: 14.0,
                                            fontWeight: FontWeight.w100,
                                          ),
                                    ),
                                  ),
                                ],
                                carouselController:
                                    _model.carouselController ??=
                                        CarouselController(),
                                options: CarouselOptions(
                                  initialPage: 0,
                                  viewportFraction: 0.75,
                                  disableCenter: true,
                                  enlargeCenterPage: true,
                                  enlargeFactor: 0.25,
                                  enableInfiniteScroll: true,
                                  scrollDirection: Axis.horizontal,
                                  autoPlay: false,
                                  onPageChanged: (index, _) =>
                                      _model.carouselCurrentIndex = index,
                                ),
                              ),
                            ),
                          ),
                          Divider(
                            thickness: 0.5,
                            color: Color(0xFFF7C933),
                          ),
                          StreamBuilder<LogsRecord>(
                            stream: LogsRecord.getDocument(drivingLogsRecordList
                                .take(1)
                                .toList()
                                .where((e) => valueOrDefault<bool>(
                                      e != null,
                                      false,
                                    ))
                                .toList()
                                .last
                                .reference)
                              ..listen((listViewLogsRecord) async {
                                if (_model.listViewPreviousSnapshot != null &&
                                    !LogsRecordDocumentEquality().equals(
                                        listViewLogsRecord,
                                        _model.listViewPreviousSnapshot)) {
                                  if (listViewLogsRecord.status == 'EXIT') {
                                    setState(() {
                                      _model.trigger7 = 3;
                                    });
                                  } else if (listViewLogsRecord.status ==
                                      'ENTER') {
                                    await queryPlacesRecordOnce(
                                      singleRecord: true,
                                    ).then((s) => s.firstOrNull);
                                    setState(() {
                                      _model.trigger7 = 1;
                                    });

                                    await listViewLogsRecord.reference
                                        .update(createLogsRecordData(
                                      placeId: listViewLogsRecord.placeId,
                                      name: listViewLogsRecord.name,
                                    ));
                                  } else {
                                    setState(() {
                                      _model.trigger7 = 2;
                                    });
                                  }

                                  setState(() {});
                                }
                                _model.listViewPreviousSnapshot =
                                    listViewLogsRecord;
                              }),
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
                              final listViewLogsRecord = snapshot.data!;
                              return ListView(
                                padding: EdgeInsets.zero,
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                children: [
                                  Container(
                                    width: double.infinity,
                                    height: 400.0,
                                    decoration: BoxDecoration(
                                      color: () {
                                        if (_model.trigger7 == 0) {
                                          return FlutterFlowTheme.of(context)
                                              .secondaryBackground;
                                        } else if (_model.trigger7 == 1) {
                                          return Color(0xFF2A9C16);
                                        } else if (_model.trigger7 == 2) {
                                          return Color(0xFFCFC709);
                                        } else {
                                          return Color(0xFFE11A1A);
                                        }
                                      }(),
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Align(
                                          alignment:
                                              AlignmentDirectional(0.00, -1.00),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 20.0, 0.0, 0.0),
                                            child: Text(
                                              listViewLogsRecord.name,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Readex Pro',
                                                        fontSize: 16.0,
                                                      ),
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment:
                                              AlignmentDirectional(0.00, -1.00),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 15.0, 0.0, 0.0),
                                            child: Text(
                                              listViewLogsRecord.placeId
                                                  .toString(),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Readex Pro',
                                                        fontSize: 16.0,
                                                      ),
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment:
                                              AlignmentDirectional(0.00, -1.00),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 15.0, 0.0, 0.0),
                                            child: Text(
                                              valueOrDefault<String>(
                                                listViewLogsRecord.placeInfo,
                                                'place info?',
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Readex Pro',
                                                        fontSize: 16.0,
                                                      ),
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment:
                                              AlignmentDirectional(0.00, -1.00),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 15.0, 0.0, 0.0),
                                            child: Text(
                                              listViewLogsRecord
                                                  .placesInfo.retailer,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Readex Pro',
                                                        fontSize: 16.0,
                                                      ),
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment:
                                              AlignmentDirectional(0.00, -1.00),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 15.0, 0.0, 0.0),
                                            child: Text(
                                              listViewLogsRecord
                                                  .placesInfo.address,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Readex Pro',
                                                        fontSize: 16.0,
                                                      ),
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment:
                                              AlignmentDirectional(0.00, -1.00),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 15.0, 0.0, 0.0),
                                            child: Text(
                                              listViewLogsRecord
                                                  .placesInfo.postcode,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Readex Pro',
                                                        fontSize: 16.0,
                                                      ),
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment:
                                              AlignmentDirectional(0.00, -1.00),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 15.0, 0.0, 0.0),
                                            child: Text(
                                              listViewLogsRecord
                                                  .placesInfo.parkingCompany,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Readex Pro',
                                                        fontSize: 16.0,
                                                      ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 5.0, 0.0, 20.0),
                                          child: Text(
                                            valueOrDefault<String>(
                                              listViewLogsRecord.time
                                                  ?.toString(),
                                              '???',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Readex Pro',
                                                  fontSize: 16.0,
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                          Container(
                            width: double.infinity,
                            height: 20.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Divider(
                                  thickness: 1.0,
                                  color: Color(0xFFF7C933),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(0.00, 1.00),
                    child: wrapWithModel(
                      model: _model.customNavBarSettingsModel,
                      updateCallback: () => setState(() {}),
                      child: CustomNavBarSettingsWidget(
                        hidden: false,
                      ),
                    ),
                  ),
                ],
              ),
            ));
      },
    );
  }
  String getCardinalDirection(double heading) {
    const List<String> directions = ['N', 'NE', 'E', 'SE', 'S', 'SW', 'W', 'NW'];
    int index = ((heading + 22.5) % 360 / 45).floor();
    return directions[index];
  }
}
