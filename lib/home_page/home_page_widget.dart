import '/auth/base_auth_user_provider.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'home_page_model.dart';
export 'home_page_model.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({Key? key}) : super(key: key);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  late HomePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  LatLng? currentUserLocationValue;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageModel());

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

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
        title: 'HomePage',
        color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          appBar: AppBar(
            backgroundColor: FlutterFlowTheme.of(context).primary,
            automaticallyImplyLeading: false,
            leading: FlutterFlowIconButton(
              borderColor: Colors.transparent,
              borderRadius: 30.0,
              borderWidth: 1.0,
              buttonSize: 60.0,
              icon: Icon(
                Icons.arrow_back_rounded,
                color: Colors.white,
                size: 30.0,
              ),
              onPressed: () async {
                context.pop();
              },
            ),
            title: Text(
              'Motoring Companion',
              style: FlutterFlowTheme.of(context).headlineMedium.override(
                    fontFamily: 'Outfit',
                    color: Colors.white,
                    fontSize: 22.0,
                  ),
            ),
            actions: [
              Align(
                alignment: AlignmentDirectional(-1.00, 0.00),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 15.0, 0.0),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      context.pushNamed('Menu-grid-less');
                    },
                    child: Text(
                      'Menu',
                      textAlign: TextAlign.center,
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Readex Pro',
                            color: Colors.white,
                            fontSize: 22.0,
                          ),
                    ),
                  ),
                ),
              ),
            ],
            centerTitle: false,
            elevation: 2.0,
          ),
          body: Container(
            width: double.infinity,
            height: 1100.0,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          30.0, 30.0, 30.0, 30.0),
                      child: Text(
                        'A companion\ncreated with Flutterflow',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Readex Pro',
                              fontSize: 22.0,
                            ),
                      ),
                    ),
                  ],
                ),
                Container(
                  width: MediaQuery.sizeOf(context).width * 0.5,
                  height: 40.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  child: StreamBuilder<List<LogsRecord>>(
                    stream: queryLogsRecord(
                      limit: 1,
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
                      List<LogsRecord> rowLogsRecordList = snapshot.data!;
                      return Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children:
                            List.generate(rowLogsRecordList.length, (rowIndex) {
                          final rowLogsRecord = rowLogsRecordList[rowIndex];
                          return Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                50.0, 0.0, 0.0, 0.0),
                            child: FFButtonWidget(
                              onPressed: () async {
                                await rowLogsRecord.reference.delete();
                              },
                              text: 'Delete doc',
                              options: FFButtonOptions(
                                height: 40.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10.0, 0.0, 10.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context).primary,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      color: Colors.white,
                                    ),
                                elevation: 3.0,
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          );
                        }),
                      );
                    },
                  ),
                ),
                if (!loggedIn)
                  InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      context.pushNamed('SignUp');
                    },
                    child: Text(
                      'Click here for SignUp page',
                      style: FlutterFlowTheme.of(context).bodyMedium,
                    ),
                  ),
                if (!loggedIn)
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 50.0, 0.0, 0.0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        context.pushNamed('Login');
                      },
                      text: 'Login',
                      options: FFButtonOptions(
                        height: 40.0,
                        padding: EdgeInsetsDirectional.fromSTEB(
                            24.0, 0.0, 24.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).primary,
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
                                  fontFamily: 'Readex Pro',
                                  color: Colors.white,
                                ),
                        elevation: 3.0,
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                if (loggedIn)
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 50.0, 0.0, 0.0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        GoRouter.of(context).prepareAuthEvent();
                        await authManager.signOut();
                        GoRouter.of(context).clearRedirectLocation();

                        context.pushNamedAuth('NowLoggedOut', context.mounted);
                      },
                      text: 'Logout',
                      options: FFButtonOptions(
                        height: 40.0,
                        padding: EdgeInsetsDirectional.fromSTEB(
                            24.0, 0.0, 24.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).primary,
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
                                  fontFamily: 'Readex Pro',
                                  color: Colors.white,
                                ),
                        elevation: 3.0,
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                if (loggedIn)
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 50.0, 0.0, 0.0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        currentUserLocationValue = await getCurrentUserLocation(
                            defaultLocation: LatLng(0.0, 0.0));
                        setState(() {
                          _model.rndStatus = valueOrDefault<int>(
                            random_data.randomInteger(0, 3),
                            0,
                          );
                          _model.rngName = valueOrDefault<String>(
                            random_data.randomName(true, true),
                            '???',
                          );
                        });
                        if (_model.rndStatus == 1) {
                          setState(() {
                            _model.rngStatus = 'ENTER';
                          });
                        } else if (_model.rndStatus == 2) {
                          setState(() {
                            _model.rngStatus = 'DWELL';
                          });
                        } else {
                          setState(() {
                            _model.rngStatus = 'EXIT';
                          });
                        }

                        _model.lookupPlace = await queryPlacesRecordOnce(
                          queryBuilder: (placesRecord) => placesRecord.where(
                            'place_id',
                            isEqualTo: random_data.randomInteger(1, 33),
                          ),
                          singleRecord: true,
                        ).then((s) => s.firstOrNull);

                        var logsRecordReference = LogsRecord.collection.doc();
                        await logsRecordReference.set({
                          ...createLogsRecordData(
                            name: _model.rngName,
                            status: _model.rngStatus,
                            userEmail: 'test@manual.entry',
                            latlang: currentUserLocationValue,
                            userRef: currentUserReference,
                            placeInfo: _model.lookupPlace?.name,
                            licencePlate: valueOrDefault(
                                currentUserDocument?.licencePlate, ''),
                            placeId: _model.lookupPlace?.placeId,
                            placesInfo: updateVenueInfoStruct(
                              _model.lookupPlace?.placesInfo,
                              clearUnsetFields: false,
                              create: true,
                            ),
                          ),
                          ...mapToFirestore(
                            {
                              'time': FieldValue.serverTimestamp(),
                            },
                          ),
                        });
                        _model.alertMe = LogsRecord.getDocumentFromData({
                          ...createLogsRecordData(
                            name: _model.rngName,
                            status: _model.rngStatus,
                            userEmail: 'test@manual.entry',
                            latlang: currentUserLocationValue,
                            userRef: currentUserReference,
                            placeInfo: _model.lookupPlace?.name,
                            licencePlate: valueOrDefault(
                                currentUserDocument?.licencePlate, ''),
                            placeId: _model.lookupPlace?.placeId,
                            placesInfo: updateVenueInfoStruct(
                              _model.lookupPlace?.placesInfo,
                              clearUnsetFields: false,
                              create: true,
                            ),
                          ),
                          ...mapToFirestore(
                            {
                              'time': DateTime.now(),
                            },
                          ),
                        }, logsRecordReference);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              _model.alertMe!.name,
                              style: TextStyle(
                                color: FlutterFlowTheme.of(context).primaryText,
                              ),
                            ),
                            duration: Duration(milliseconds: 10000),
                            backgroundColor:
                                FlutterFlowTheme.of(context).secondary,
                          ),
                        );

                        setState(() {});
                      },
                      text: 'Test Geopoint Log',
                      options: FFButtonOptions(
                        height: 40.0,
                        padding: EdgeInsetsDirectional.fromSTEB(
                            24.0, 0.0, 24.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).primary,
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
                                  fontFamily: 'Readex Pro',
                                  color: Colors.white,
                                ),
                        elevation: 3.0,
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(5.0, 15.0, 0.0, 0.0),
                      child: Text(
                        valueOrDefault<String>(
                          _model.rngStatus,
                          '???',
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium,
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(5.0, 15.0, 0.0, 0.0),
                      child: Text(
                        valueOrDefault<String>(
                          _model.rngName,
                          '???',
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium,
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(5.0, 15.0, 0.0, 0.0),
                      child: Text(
                        valueOrDefault<String>(
                          _model.rndStatus?.toString(),
                          '???',
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 0.0),
                  child: Container(
                    width: MediaQuery.sizeOf(context).width * 0.75,
                    height: 110.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              8.0, 0.0, 8.0, 0.0),
                          child: TextFormField(
                            controller: _model.textController,
                            focusNode: _model.textFieldFocusNode,
                            autofocus: true,
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: 'Optional Geopoint Name...',
                              labelStyle:
                                  FlutterFlowTheme.of(context).labelMedium,
                              hintStyle:
                                  FlutterFlowTheme.of(context).labelMedium,
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x75262D34),
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).primary,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              errorBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              focusedErrorBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                            style: FlutterFlowTheme.of(context).bodyMedium,
                            validator: _model.textControllerValidator
                                .asValidator(context),
                          ),
                        ),
                        if (loggedIn)
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 15.0, 0.0, 0.0),
                            child: Semantics(
                              button: true,
                              onTapHint: 'RATE EXCEEDED ERROR',
                              child: FFButtonWidget(
                                onPressed: () async {
                                  currentUserLocationValue =
                                      await getCurrentUserLocation(
                                          defaultLocation: LatLng(0.0, 0.0));
                                  setState(() {
                                    _model.rndStatus = valueOrDefault<int>(
                                      random_data.randomInteger(0, 3),
                                      0,
                                    );
                                    _model.rngName = valueOrDefault<String>(
                                      random_data.randomName(true, true),
                                      'George',
                                    );
                                  });
                                  if (_model.textController.text == null ||
                                      _model.textController.text == '') {
                                    setState(() {
                                      _model.rngName = valueOrDefault<String>(
                                        random_data.randomName(true, true),
                                        'George',
                                      );
                                    });
                                  } else {
                                    setState(() {
                                      _model.rngName = valueOrDefault<String>(
                                        _model.textController.text,
                                        '???',
                                      );
                                    });
                                  }

                                  var placesRecordReference =
                                      PlacesRecord.collection.doc();
                                  await placesRecordReference
                                      .set(createPlacesRecordData(
                                    radius: 10,
                                    dateAdded: getCurrentTimestamp,
                                    addedBy: currentUserReference,
                                    addedByName: currentUserUid,
                                    name: _model.rngName,
                                    addedByEmail: currentUserEmail,
                                    latlang: currentUserLocationValue,
                                    placeId: random_data.randomInteger(0, 1000),
                                    placeInfo: 'tba',
                                  ));
                                  _model.pointAdded =
                                      PlacesRecord.getDocumentFromData(
                                          createPlacesRecordData(
                                            radius: 10,
                                            dateAdded: getCurrentTimestamp,
                                            addedBy: currentUserReference,
                                            addedByName: currentUserUid,
                                            name: _model.rngName,
                                            addedByEmail: currentUserEmail,
                                            latlang: currentUserLocationValue,
                                            placeId: random_data.randomInteger(
                                                0, 1000),
                                            placeInfo: 'tba',
                                          ),
                                          placesRecordReference);
                                  setState(() {
                                    _model.newGeoName = _model.pointAdded?.name;
                                  });
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        _model.pointAdded!.name,
                                        style: GoogleFonts.getFont(
                                          'Open Sans',
                                          color: Color(0x75262D34),
                                          fontWeight: FontWeight.w800,
                                          fontSize: 26.0,
                                        ),
                                      ),
                                      duration: Duration(milliseconds: 10000),
                                      backgroundColor: Color(0x8139D2C0),
                                    ),
                                  );

                                  context.pushNamed('Menu-grid-less');

                                  setState(() {});
                                },
                                text: 'Add Geopoint',
                                options: FFButtonOptions(
                                  height: 40.0,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      24.0, 0.0, 24.0, 0.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: FlutterFlowTheme.of(context).primary,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        color: Colors.white,
                                      ),
                                  elevation: 3.0,
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
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
        ));
  }
}
