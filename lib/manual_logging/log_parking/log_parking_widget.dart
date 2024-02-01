import '/components/custom_nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:styled_divider/styled_divider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'log_parking_model.dart';
export 'log_parking_model.dart';

class LogParkingWidget extends StatefulWidget {
  const LogParkingWidget({Key? key}) : super(key: key);

  @override
  _LogParkingWidgetState createState() => _LogParkingWidgetState();
}

class _LogParkingWidgetState extends State<LogParkingWidget> {
  late LogParkingModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LogParkingModel());

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

    return Title(
        title: 'LogParking',
        color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          body: Stack(
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 0.0),
                child: Container(
                  width: double.infinity,
                  height: MediaQuery.sizeOf(context).height * 0.9,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Align(
                          alignment: AlignmentDirectional(0.00, -1.00),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 16.0, 16.0, 16.0),
                            child: Text(
                              'Information',
                              style: FlutterFlowTheme.of(context)
                                  .headlineMedium
                                  .override(
                                    fontFamily: 'Outfit',
                                    color: FlutterFlowTheme.of(context).warning,
                                    fontSize: 26.0,
                                  ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(0.00, -1.00),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 16.0, 16.0, 16.0),
                            child: Text(
                              'Record Parking',
                              style:
                                  FlutterFlowTheme.of(context).headlineMedium,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 16.0, 15.0),
                          child: Text(
                            'Modern day parking is full of technology that is set to trip you up, issuing as many parking tickets as they can whether it is your fault or the fault with the parking system. They are in the business of making money from parking tickets, if a fault makes them more money they will not be in a rush to fix it.\n\nWe suggest you get in the habit of recording every parking event to provide evidence shoud you receive an unfair parking ticket. We make the process simple.\n\nYou don\'t get back the time fighting an unfair ticket, so if where you have parked makes you anxious log the event on this app. \n\nBeware of rules changing where you regularly park and you not noticing.',
                            textAlign: TextAlign.start,
                            style:
                                FlutterFlowTheme.of(context).bodySmall.override(
                                      fontFamily: 'Readex Pro',
                                      color: FlutterFlowTheme.of(context).info,
                                      fontSize: 14.0,
                                    ),
                          ),
                        ),
                        StyledDivider(
                          thickness: 1.0,
                          color: FlutterFlowTheme.of(context).warning,
                          lineStyle: DividerLineStyle.dashed,
                        ),
                        Align(
                          alignment: AlignmentDirectional(0.00, -1.00),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 16.0, 16.0, 16.0),
                            child: Text(
                              'Message Operator',
                              style:
                                  FlutterFlowTheme.of(context).headlineMedium,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 16.0, 15.0),
                          child: Text(
                            'Modern day parking is full of technology that is set to trip you up, issuing as many parking tickets as they can whether it is your fault or the fault with the parking system. They are in the business of making money from parking tickets, if a fault makes them more money they will not be in a rush to fix it.\n\nWe suggest you get in the habit of recording every parking event to provide evidence shoud you receive an unfair parking ticket. We make the process simple.\n\nYou don\'t get back the time fighting an unfair ticket, so if where you have parked makes you anxious log the event on this app. \n\nBeware of rules changing where you regularly park and you not noticing.',
                            textAlign: TextAlign.start,
                            style:
                                FlutterFlowTheme.of(context).bodySmall.override(
                                      fontFamily: 'Readex Pro',
                                      color: FlutterFlowTheme.of(context).info,
                                      fontSize: 14.0,
                                    ),
                          ),
                        ),
                        StyledDivider(
                          thickness: 1.0,
                          color: FlutterFlowTheme.of(context).warning,
                          lineStyle: DividerLineStyle.dashed,
                        ),
                        Align(
                          alignment: AlignmentDirectional(0.00, -1.00),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 16.0, 16.0, 16.0),
                            child: Text(
                              'Info 3',
                              style:
                                  FlutterFlowTheme.of(context).headlineMedium,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 16.0, 15.0),
                          child: Text(
                            'Modern day parking is full of technology that is set to trip you up, issuing as many parking tickets as they can whether it is your fault or the fault with the parking system. They are in the business of making money from parking tickets, if a fault makes them more money they will not be in a rush to fix it.\n\nWe suggest you get in the habit of recording every parking event to provide evidence shoud you receive an unfair parking ticket. We make the process simple.\n\nYou don\'t get back the time fighting an unfair ticket, so if where you have parked makes you anxious log the event on this app. \n\nBeware of rules changing where you regularly park and you not noticing.',
                            textAlign: TextAlign.start,
                            style:
                                FlutterFlowTheme.of(context).bodySmall.override(
                                      fontFamily: 'Readex Pro',
                                      color: FlutterFlowTheme.of(context).info,
                                      fontSize: 14.0,
                                    ),
                          ),
                        ),
                        StyledDivider(
                          thickness: 1.0,
                          color: FlutterFlowTheme.of(context).warning,
                          lineStyle: DividerLineStyle.dashed,
                        ),
                        Align(
                          alignment: AlignmentDirectional(0.00, -1.00),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 16.0, 16.0, 16.0),
                            child: Text(
                              'Info 4',
                              style:
                                  FlutterFlowTheme.of(context).headlineMedium,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 16.0, 15.0),
                          child: Text(
                            'Modern day parking is full of technology that is set to trip you up, issuing as many parking tickets as they can whether it is your fault or the fault with the parking system. They are in the business of making money from parking tickets, if a fault makes them more money they will not be in a rush to fix it.\n\nWe suggest you get in the habit of recording every parking event to provide evidence shoud you receive an unfair parking ticket. We make the process simple.\n\nYou don\'t get back the time fighting an unfair ticket, so if where you have parked makes you anxious log the event on this app. \n\nBeware of rules changing where you regularly park and you not noticing.',
                            textAlign: TextAlign.start,
                            style:
                                FlutterFlowTheme.of(context).bodySmall.override(
                                      fontFamily: 'Readex Pro',
                                      color: FlutterFlowTheme.of(context).info,
                                      fontSize: 14.0,
                                    ),
                          ),
                        ),
                        StyledDivider(
                          thickness: 1.0,
                          color: FlutterFlowTheme.of(context).warning,
                          lineStyle: DividerLineStyle.dashed,
                        ),
                        Align(
                          alignment: AlignmentDirectional(0.00, -1.00),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 16.0, 16.0, 16.0),
                            child: Text(
                              'Info 5',
                              style:
                                  FlutterFlowTheme.of(context).headlineMedium,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 16.0, 15.0),
                          child: Text(
                            'Modern day parking is full of technology that is set to trip you up, issuing as many parking tickets as they can whether it is your fault or the fault with the parking system. They are in the business of making money from parking tickets, if a fault makes them more money they will not be in a rush to fix it.\n\nWe suggest you get in the habit of recording every parking event to provide evidence shoud you receive an unfair parking ticket. We make the process simple.\n\nYou don\'t get back the time fighting an unfair ticket, so if where you have parked makes you anxious log the event on this app. \n\nBeware of rules changing where you regularly park and you not noticing.',
                            textAlign: TextAlign.start,
                            style:
                                FlutterFlowTheme.of(context).bodySmall.override(
                                      fontFamily: 'Readex Pro',
                                      color: FlutterFlowTheme.of(context).info,
                                      fontSize: 14.0,
                                    ),
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          height: 100.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0.00, 1.00),
                child: wrapWithModel(
                  model: _model.customNavBarModel,
                  updateCallback: () => setState(() {}),
                  child: CustomNavBarWidget(
                    hidden: false,
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
