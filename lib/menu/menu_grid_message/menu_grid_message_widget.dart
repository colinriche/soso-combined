import '/components/custom_nav_bar_history_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'menu_grid_message_model.dart';
export 'menu_grid_message_model.dart';

class MenuGridMessageWidget extends StatefulWidget {
  const MenuGridMessageWidget({Key? key}) : super(key: key);

  @override
  _MenuGridMessageWidgetState createState() => _MenuGridMessageWidgetState();
}

class _MenuGridMessageWidgetState extends State<MenuGridMessageWidget> {
  late MenuGridMessageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MenuGridMessageModel());

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
        title: 'Menu-grid-message',
        color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          body: Stack(
            children: [
              Container(
                width: double.infinity,
                height: MediaQuery.sizeOf(context).height * 0.9,
                decoration: BoxDecoration(),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                      child: InkWell(
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
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(70.0, 0.0, 0.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 100.0,
                            height: 80.0,
                            decoration: BoxDecoration(),
                            child: Align(
                              alignment: AlignmentDirectional(1.00, 0.00),
                              child: Icon(
                                Icons.email_outlined,
                                color: FlutterFlowTheme.of(context).info,
                                size: 30.0,
                              ),
                            ),
                          ),
                          Container(
                            width: 100.0,
                            height: 80.0,
                            decoration: BoxDecoration(),
                            child: Align(
                              alignment: AlignmentDirectional(0.00, 0.00),
                              child: Text(
                                'Message',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      color: FlutterFlowTheme.of(context).info,
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0.00, 1.00),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          context.pushNamed('messageOperator');
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: 100.0,
                              height: 80.0,
                              decoration: BoxDecoration(),
                              child: Icon(
                                Icons.local_parking,
                                color: FlutterFlowTheme.of(context).warning,
                                size: 35.0,
                              ),
                            ),
                            Container(
                              width: 200.0,
                              height: 80.0,
                              decoration: BoxDecoration(),
                              child: Align(
                                alignment: AlignmentDirectional(-1.00, 0.00),
                                child: Text(
                                  'Parking Operator',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        color: FlutterFlowTheme.of(context)
                                            .warning,
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Opacity(
                      opacity: 0.3,
                      child: Align(
                        alignment: AlignmentDirectional(0.00, 1.00),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                context.pushNamed('Setup-slide');
                              },
                              child: Container(
                                width: 100.0,
                                height: 80.0,
                                decoration: BoxDecoration(),
                                child: Align(
                                  alignment: AlignmentDirectional(0.00, 0.00),
                                  child: FaIcon(
                                    FontAwesomeIcons.store,
                                    color: FlutterFlowTheme.of(context).warning,
                                    size: 25.0,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              width: 100.0,
                              height: 80.0,
                              decoration: BoxDecoration(),
                              child: Align(
                                alignment: AlignmentDirectional(-1.00, 0.00),
                                child: Text(
                                  'Retailer',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        color: FlutterFlowTheme.of(context)
                                            .warning,
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Opacity(
                      opacity: 0.3,
                      child: Align(
                        alignment: AlignmentDirectional(0.00, 1.00),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: 100.0,
                              height: 80.0,
                              decoration: BoxDecoration(),
                              child: Align(
                                alignment: AlignmentDirectional(0.00, 0.00),
                                child: Icon(
                                  Icons.business_sharp,
                                  color: FlutterFlowTheme.of(context).warning,
                                  size: 25.0,
                                ),
                              ),
                            ),
                            Container(
                              width: 150.0,
                              height: 80.0,
                              decoration: BoxDecoration(),
                              child: Align(
                                alignment: AlignmentDirectional(-1.00, 0.00),
                                child: Text(
                                  'Landowner',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        color: FlutterFlowTheme.of(context)
                                            .warning,
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Divider(
                      thickness: 1.0,
                      color: FlutterFlowTheme.of(context).secondaryText,
                    ),
                    Align(
                      alignment: AlignmentDirectional(0.00, 1.00),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          context.pushNamed('RecordParking');
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 100.0,
                              height: 80.0,
                              decoration: BoxDecoration(),
                              child: Align(
                                alignment: AlignmentDirectional(0.00, 0.00),
                                child: FaIcon(
                                  FontAwesomeIcons.pencilAlt,
                                  color: FlutterFlowTheme.of(context).warning,
                                  size: 20.0,
                                ),
                              ),
                            ),
                            Container(
                              width: 200.0,
                              height: 80.0,
                              decoration: BoxDecoration(),
                              child: Align(
                                alignment: AlignmentDirectional(-1.00, 0.00),
                                child: Text(
                                  'Record Event',
                                  textAlign: TextAlign.start,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        color: FlutterFlowTheme.of(context)
                                            .warning,
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0.00, 1.00),
                child: wrapWithModel(
                  model: _model.customNavBarHistoryModel,
                  updateCallback: () => setState(() {}),
                  child: CustomNavBarHistoryWidget(
                    hidden: false,
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
