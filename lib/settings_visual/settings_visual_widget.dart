import '/components/custom_nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'settings_visual_model.dart';
export 'settings_visual_model.dart';

class SettingsVisualWidget extends StatefulWidget {
  const SettingsVisualWidget({Key? key}) : super(key: key);

  @override
  _SettingsVisualWidgetState createState() => _SettingsVisualWidgetState();
}

class _SettingsVisualWidgetState extends State<SettingsVisualWidget> {
  late SettingsVisualModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SettingsVisualModel());

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
        title: 'Settings-visual',
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
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            context.pushNamed('DrivingSpeedo');
                          },
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
                        SwitchListTile.adaptive(
                          value: _model.switchListTileValue1 ??=
                              FFAppState().darkMode,
                          onChanged: (newValue) async {
                            setState(
                                () => _model.switchListTileValue1 = newValue!);
                            if (newValue!) {
                              setState(() {
                                FFAppState().darkMode = true;
                              });
                              setDarkModeSetting(context, ThemeMode.dark);
                            } else {
                              setState(() {
                                FFAppState().darkMode = false;
                              });
                              setDarkModeSetting(context, ThemeMode.light);
                            }
                          },
                          title: Text(
                            'Dark Mode',
                            style:
                                FlutterFlowTheme.of(context).bodyLarge.override(
                                      fontFamily: 'Readex Pro',
                                      lineHeight: 2.0,
                                    ),
                          ),
                          tileColor:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          activeColor: FlutterFlowTheme.of(context).primary,
                          activeTrackColor:
                              FlutterFlowTheme.of(context).accent1,
                          dense: false,
                          controlAffinity: ListTileControlAffinity.trailing,
                          contentPadding: EdgeInsetsDirectional.fromSTEB(
                              24.0, 12.0, 24.0, 12.0),
                        ),
                        SwitchListTile.adaptive(
                          value: _model.switchListTileValue2 ??=
                              FFAppState().speedoEnabled,
                          onChanged: (newValue) async {
                            setState(
                                () => _model.switchListTileValue2 = newValue!);
                            if (newValue!) {
                              setState(() {
                                FFAppState().speedoEnabled = true;
                              });
                            } else {
                              setState(() {
                                FFAppState().speedoEnabled = false;
                              });
                            }
                          },
                          title: Text(
                            'Speedometer',
                            style:
                                FlutterFlowTheme.of(context).bodyLarge.override(
                                      fontFamily: 'Readex Pro',
                                      lineHeight: 2.0,
                                    ),
                          ),
                          subtitle: Text(
                            'Allows you to display a speedo calculated by GPS.',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Readex Pro',
                                  color: Color(0xFF8B97A2),
                                ),
                          ),
                          tileColor:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          activeColor: FlutterFlowTheme.of(context).primary,
                          activeTrackColor:
                              FlutterFlowTheme.of(context).accent1,
                          dense: false,
                          controlAffinity: ListTileControlAffinity.trailing,
                          contentPadding: EdgeInsetsDirectional.fromSTEB(
                              24.0, 12.0, 24.0, 12.0),
                        ),
                        SwitchListTile.adaptive(
                          value: _model.switchListTileValue3 ??=
                              FFAppState().locationTracking,
                          onChanged: (newValue) async {
                            setState(
                                () => _model.switchListTileValue3 = newValue!);
                          },
                          title: Text(
                            'Location Services',
                            style:
                                FlutterFlowTheme.of(context).bodyLarge.override(
                                      fontFamily: 'Readex Pro',
                                      lineHeight: 2.0,
                                    ),
                          ),
                          subtitle: Text(
                            'Receive location specific information. Turning off will sleep for 24 hours.',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Readex Pro',
                                  color: Color(0xFF8B97A2),
                                ),
                          ),
                          tileColor:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          activeColor: FlutterFlowTheme.of(context).primary,
                          activeTrackColor:
                              FlutterFlowTheme.of(context).accent1,
                          dense: false,
                          controlAffinity: ListTileControlAffinity.trailing,
                          contentPadding: EdgeInsetsDirectional.fromSTEB(
                              24.0, 12.0, 24.0, 12.0),
                        ),
                        SwitchListTile.adaptive(
                          value: _model.switchListTileValue4 ??=
                              FFAppState().blindCopyEmail,
                          onChanged: (newValue) async {
                            setState(
                                () => _model.switchListTileValue4 = newValue!);
                            if (newValue!) {
                              setState(() {
                                FFAppState().blindCopyEmail = true;
                              });
                            } else {
                              setState(() {
                                FFAppState().blindCopyEmail = false;
                              });
                            }
                          },
                          title: Text(
                            'Email Notifications',
                            style:
                                FlutterFlowTheme.of(context).bodyLarge.override(
                                      fontFamily: 'Readex Pro',
                                      lineHeight: 2.0,
                                    ),
                          ),
                          subtitle: Text(
                            'Receive a blind copy email of the messages you send from this app.',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Readex Pro',
                                  color: Color(0xFF8B97A2),
                                ),
                          ),
                          tileColor:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          activeColor: FlutterFlowTheme.of(context).primary,
                          activeTrackColor:
                              FlutterFlowTheme.of(context).accent1,
                          dense: false,
                          controlAffinity: ListTileControlAffinity.trailing,
                          contentPadding: EdgeInsetsDirectional.fromSTEB(
                              24.0, 12.0, 24.0, 12.0),
                        ),
                        SwitchListTile.adaptive(
                          value: _model.switchListTileValue5 ??=
                              !FFAppState().pushNotify,
                          onChanged: (newValue) async {
                            setState(
                                () => _model.switchListTileValue5 = newValue!);
                            if (newValue!) {
                              setState(() {
                                FFAppState().pushNotify = true;
                              });
                            } else {
                              setState(() {
                                FFAppState().pushNotify = false;
                              });
                            }
                          },
                          title: Text(
                            'Push Notifications',
                            style:
                                FlutterFlowTheme.of(context).bodyLarge.override(
                                      fontFamily: 'Readex Pro',
                                      lineHeight: 2.0,
                                    ),
                          ),
                          subtitle: Text(
                            'Receive Push Notifications about your location as you drive.',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Readex Pro',
                                  color: Color(0xFF8B97A2),
                                ),
                          ),
                          tileColor:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          activeColor: FlutterFlowTheme.of(context).primary,
                          activeTrackColor:
                              FlutterFlowTheme.of(context).accent1,
                          dense: false,
                          controlAffinity: ListTileControlAffinity.trailing,
                          contentPadding: EdgeInsetsDirectional.fromSTEB(
                              24.0, 12.0, 24.0, 12.0),
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
