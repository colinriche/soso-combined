import '../../message_operator/message_operator/message_operator_widget.dart';
import '../../picker/widgets/place_picker.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/custom_nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'record_parking_model.dart';
export 'record_parking_model.dart';

class RecordParkingWidget extends StatefulWidget {
  const RecordParkingWidget({Key? key}) : super(key: key);

  @override
  _RecordParkingWidgetState createState() => _RecordParkingWidgetState();
}

class _RecordParkingWidgetState extends State<RecordParkingWidget> {
  late RecordParkingModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  LatLng? currentUserLocationValue;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RecordParkingModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        FFAppState().locationSelect = true;
      });
    });

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
        title: 'RecordParking',
        color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          body: Stack(
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                child: Container(
                  width: double.infinity,
                  height: MediaQuery.sizeOf(context).height * 0.9,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: AlignmentDirectional(0.00, -1.00),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 16.0, 16.0, 16.0),
                          child: Text(
                            'Record Parking Event',
                            style: FlutterFlowTheme.of(context).headlineMedium,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 0.0, 16.0, 0.0),
                        child: Text(
                          'For added protection from unfair fines get in the habit of recording events',
                          style: FlutterFlowTheme.of(context)
                              .bodySmall
                              .override(
                                fontFamily: 'Readex Pro',
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                fontSize: 16.0,
                              ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            15.0, 32.0, 15.0, 0.0),
                        child: Container(
                          width: MediaQuery.sizeOf(context).width * 0.95,
                          height: 60.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                12.0, 12.0, 12.0, 12.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                StreamBuilder<List<ActionListRecord>>(
                                  stream: queryActionListRecord(),
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return Center(
                                        child: SizedBox(
                                          width: 50.0,
                                          height: 50.0,
                                          child: CircularProgressIndicator(
                                            valueColor:
                                                AlwaysStoppedAnimation<Color>(
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                            ),
                                          ),
                                        ),
                                      );
                                    }
                                    List<ActionListRecord>
                                        dropDownActionListRecordList =
                                        snapshot.data!;
                                    return FlutterFlowDropDown<int>(
                                      controller:
                                          _model.dropDownValueController1 ??=
                                              FormFieldController<int>(null),
                                      options: List<int>.from(
                                          dropDownActionListRecordList
                                              .map((e) => e.actionId)
                                              .toList()),
                                      optionLabels: dropDownActionListRecordList
                                          .map((e) => e.actionMessage)
                                          .toList(),
                                      onChanged: (val) => setState(
                                          () => _model.dropDownValue1 = val),
                                      width: 300.0,
                                      height: 50.0,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium,
                                      hintText: 'Select Action...',
                                      icon: Icon(
                                        Icons.keyboard_arrow_down_rounded,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        size: 24.0,
                                      ),
                                      fillColor: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      elevation: 2.0,
                                      borderColor: FlutterFlowTheme.of(context)
                                          .alternate,
                                      borderWidth: 2.0,
                                      borderRadius: 8.0,
                                      margin: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 4.0, 16.0, 4.0),
                                      hidesUnderline: true,
                                      isSearchable: false,
                                      isMultiSelect: false,
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            15.0, 32.0, 15.0, 50.0),
                        child: Container(
                          width: MediaQuery.sizeOf(context).width * 0.95,
                          height: 60.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                12.0, 12.0, 12.0, 12.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                StreamBuilder<List<OptionListRecord>>(
                                  stream: queryOptionListRecord(),
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return Center(
                                        child: SizedBox(
                                          width: 50.0,
                                          height: 50.0,
                                          child: CircularProgressIndicator(
                                            valueColor:
                                                AlwaysStoppedAnimation<Color>(
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                            ),
                                          ),
                                        ),
                                      );
                                    }
                                    List<OptionListRecord>
                                        dropDownOptionListRecordList =
                                        snapshot.data!;
                                    return FlutterFlowDropDown<int>(
                                      controller:
                                          _model.dropDownValueController2 ??=
                                              FormFieldController<int>(null),
                                      options: List<int>.from(
                                          dropDownOptionListRecordList
                                              .map((e) => e.optionId)
                                              .toList()),
                                      optionLabels: dropDownOptionListRecordList
                                          .map((e) => e.optionMessage)
                                          .toList(),
                                      onChanged: (val) => setState(
                                          () => _model.dropDownValue2 = val),
                                      width: 300.0,
                                      height: 50.0,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium,
                                      hintText: 'Select Option...',
                                      icon: Icon(
                                        Icons.keyboard_arrow_down_rounded,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        size: 24.0,
                                      ),
                                      fillColor: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      elevation: 2.0,
                                      borderColor: FlutterFlowTheme.of(context)
                                          .alternate,
                                      borderWidth: 2.0,
                                      borderRadius: 8.0,
                                      margin: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 4.0, 16.0, 4.0),
                                      hidesUnderline: true,
                                      isSearchable: false,
                                      isMultiSelect: false,
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            0.0, 30.0, 45.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  20.0, 0.0, 0.0, 0.0),
                              child: Theme(
                                data: ThemeData(
                                  checkboxTheme: CheckboxThemeData(
                                    visualDensity: VisualDensity.compact,
                                    materialTapTargetSize:
                                        MaterialTapTargetSize.shrinkWrap,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(4.0),
                                    ),
                                  ),
                                  unselectedWidgetColor:
                                      FlutterFlowTheme.of(context)
                                          .secondaryText,
                                ),
                                child: Checkbox(
                                  value: _model.checkboxValue ??= true,
                                  onChanged: (newValue) async {
                                    setState(
                                        () => _model.checkboxValue = newValue!);
                                    if (newValue!) {
                                      setState(() {
                                        FFAppState().locationSelect = true;
                                      });
                                    } else {
                                      setState(() {
                                        FFAppState().locationSelect = false;
                                      });
                                    }
                                  },
                                  activeColor:
                                      FlutterFlowTheme.of(context).primary,
                                  checkColor: FlutterFlowTheme.of(context).info,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  2.0, 0.0, 0.0, 0.0),
                              child: Text(
                                'Include my current location',
                                textAlign: TextAlign.end,
                                style: FlutterFlowTheme.of(context).bodyMedium,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Flexible(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              30.0, 0.0, 30.0, 0.0),
                          child: Container(
                            width: MediaQuery.sizeOf(context).width * 1.0,
                            height: 250.0,
                            decoration: BoxDecoration(),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                if (_model.checkboxValue ?? true)
                                  Opacity(
                                    opacity: 0.7,
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 20.0, 0.0, 0.0),
                                      child: FFButtonWidget(
                                        onPressed: !((_model.dropDownValue1 !=
                                                    null) &&
                                                (_model.dropDownValue2 != null))
                                            ? null
                                            : () async {
                                                currentUserLocationValue =
                                                    await getCurrentUserLocation(
                                                        defaultLocation:
                                                            LatLng(0.0, 0.0));
                                                var _shouldSetState = false;
                                                if (valueOrDefault(
                                                            currentUserDocument
                                                                ?.licencePlate,
                                                            '') ==
                                                        null ||
                                                    valueOrDefault(
                                                            currentUserDocument
                                                                ?.licencePlate,
                                                            '') ==
                                                        '') {
                                                  await showDialog(
                                                    context: context,
                                                    builder:
                                                        (alertDialogContext) {
                                                      return AlertDialog(
                                                        title: Text('Error'),
                                                        content: Text(
                                                            'Licence Plate Not Set'),
                                                        actions: [
                                                          TextButton(
                                                            onPressed: () =>
                                                                Navigator.pop(
                                                                    alertDialogContext),
                                                            child: Text('Ok'),
                                                          ),
                                                        ],
                                                      );
                                                    },
                                                  );

                                                  context
                                                      .pushNamed('Setup-slide');

                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(
                                                    SnackBar(
                                                      content: Text(
                                                        'Complete Your Profile or the app will not function',
                                                        style: TextStyle(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                        ),
                                                      ),
                                                      duration: Duration(
                                                          milliseconds: 4000),
                                                      backgroundColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondary,
                                                    ),
                                                  );
                                                  if (_shouldSetState)
                                                    setState(() {});
                                                  return;
                                                } else {
                                                  setState(() {
                                                    _model.locationCheck =
                                                        functions.latlangToString(
                                                            currentUserLocationValue!);
                                                  });
                                                  if (_model.locationCheck !=
                                                      '0.0,0.0') {
                                                    setState(() {
                                                      _model.locationCheck =
                                                          currentUserLocationValue
                                                              ?.toString();
                                                    });
                                                  } else {
                                                    await showDialog(
                                                      context: context,
                                                      builder:
                                                          (alertDialogContext) {
                                                        return AlertDialog(
                                                          title: Text('Error'),
                                                          content: Text(
                                                              'Location permission required'),
                                                          actions: [
                                                            TextButton(
                                                              onPressed: () =>
                                                                  Navigator.pop(
                                                                      alertDialogContext),
                                                              child: Text('Ok'),
                                                            ),
                                                          ],
                                                        );
                                                      },
                                                    );
                                                    setState(() {
                                                      _model.locationCheck =
                                                          'location?';
                                                    });
                                                    if (_shouldSetState)
                                                      setState(() {});
                                                    return;
                                                  }

                                                  _model.lookupAddress =
                                                      await GeoCodingCall.call(
                                                    latlang: functions
                                                        .latlangToString(
                                                            currentUserLocationValue!),
                                                  );
                                                  _shouldSetState = true;
                                                  if ((_model.lookupAddress
                                                          ?.succeeded ??
                                                      true)) {
                                                    _model.lookupAction =
                                                        await queryActionListRecordOnce(
                                                      queryBuilder:
                                                          (actionListRecord) =>
                                                              actionListRecord
                                                                  .where(
                                                        'action_id',
                                                        isEqualTo: _model
                                                            .dropDownValue1,
                                                      ),
                                                      singleRecord: true,
                                                    ).then((s) =>
                                                            s.firstOrNull);
                                                    _shouldSetState = true;
                                                    _model.lookupOption =
                                                        await queryOptionListRecordOnce(
                                                      queryBuilder:
                                                          (optionListRecord) =>
                                                              optionListRecord
                                                                  .where(
                                                        'option_id',
                                                        isEqualTo: _model
                                                            .dropDownValue2,
                                                      ),
                                                      singleRecord: true,
                                                    ).then((s) =>
                                                            s.firstOrNull);
                                                    _shouldSetState = true;

                                                    var visitsRecordReference =
                                                        VisitsRecord.collection
                                                            .doc();
                                                    await visitsRecordReference
                                                        .set(
                                                            createVisitsRecordData(
                                                      createdAt:
                                                          getCurrentTimestamp,
                                                      latlang:
                                                          currentUserLocationValue,
                                                      locationInfo:
                                                          getJsonField(
                                                        (_model.lookupAddress
                                                                ?.jsonBody ??
                                                            ''),
                                                        r'''$.results[0].formatted_address''',
                                                      ).toString(),
                                                      entryExit: 'dunno',
                                                      userRef:
                                                          currentUserReference,
                                                      email: currentUserEmail,
                                                      licencePlate:
                                                          valueOrDefault(
                                                              currentUserDocument
                                                                  ?.licencePlate,
                                                              ''),
                                                      actionId: _model
                                                          .lookupAction
                                                          ?.actionId,
                                                      actionMessage: _model
                                                          .lookupAction
                                                          ?.actionMessage,
                                                      optionId: _model
                                                          .lookupOption
                                                          ?.optionId,
                                                      optionMessage: _model
                                                          .lookupOption
                                                          ?.optionMessage,
                                                      currentLocation: true,
                                                    ));
                                                    _model.saveVisitGps = VisitsRecord
                                                        .getDocumentFromData(
                                                            createVisitsRecordData(
                                                              createdAt:
                                                                  getCurrentTimestamp,
                                                              latlang:
                                                                  currentUserLocationValue,
                                                              locationInfo:
                                                                  getJsonField(
                                                                (_model.lookupAddress
                                                                        ?.jsonBody ??
                                                                    ''),
                                                                r'''$.results[0].formatted_address''',
                                                              ).toString(),
                                                              entryExit:
                                                                  'dunno',
                                                              userRef:
                                                                  currentUserReference,
                                                              email:
                                                                  currentUserEmail,
                                                              licencePlate:
                                                                  valueOrDefault(
                                                                      currentUserDocument
                                                                          ?.licencePlate,
                                                                      ''),
                                                              actionId: _model
                                                                  .lookupAction
                                                                  ?.actionId,
                                                              actionMessage: _model
                                                                  .lookupAction
                                                                  ?.actionMessage,
                                                              optionId: _model
                                                                  .lookupOption
                                                                  ?.optionId,
                                                              optionMessage: _model
                                                                  .lookupOption
                                                                  ?.optionMessage,
                                                              currentLocation:
                                                                  true,
                                                            ),
                                                            visitsRecordReference);
                                                    _shouldSetState = true;
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(
                                                      SnackBar(
                                                        content: Text(
                                                          'Done',
                                                          style: TextStyle(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryText,
                                                          ),
                                                        ),
                                                        duration: Duration(
                                                            milliseconds: 4000),
                                                        backgroundColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondary,
                                                      ),
                                                    );

                                                    context.pushNamed(
                                                      'VisitSaved',
                                                      queryParameters: {
                                                        'createdBy':
                                                            serializeParam(
                                                          getCurrentTimestamp,
                                                          ParamType.DateTime,
                                                        ),
                                                        'address':
                                                            serializeParam(
                                                          getJsonField(
                                                            (_model.lookupAddress
                                                                    ?.jsonBody ??
                                                                ''),
                                                            r'''$.results[0].formatted_address''',
                                                          ).toString(),
                                                          ParamType.String,
                                                        ),
                                                        'latlang':
                                                            serializeParam(
                                                          currentUserLocationValue,
                                                          ParamType.LatLng,
                                                        ),
                                                        'withGPS':
                                                            serializeParam(
                                                          true,
                                                          ParamType.bool,
                                                        ),
                                                        'licencePlate':
                                                            serializeParam(
                                                          valueOrDefault(
                                                              currentUserDocument
                                                                  ?.licencePlate,
                                                              ''),
                                                          ParamType.String,
                                                        ),
                                                        'email': serializeParam(
                                                          currentUserEmail,
                                                          ParamType.String,
                                                        ),
                                                        'actionMessage':
                                                            serializeParam(
                                                          _model.lookupAction
                                                              ?.actionMessage,
                                                          ParamType.String,
                                                        ),
                                                        'optionMessage':
                                                            serializeParam(
                                                          _model.lookupOption
                                                              ?.optionMessage,
                                                          ParamType.String,
                                                        ),
                                                        'currentLocation':
                                                            serializeParam(
                                                          true,
                                                          ParamType.bool,
                                                        ),
                                                      }.withoutNulls,
                                                    );
                                                  } else {
                                                    await showDialog(
                                                      context: context,
                                                      builder:
                                                          (alertDialogContext) {
                                                        return AlertDialog(
                                                          title: Text('Fail'),
                                                          content: Text('Fail'),
                                                          actions: [
                                                            TextButton(
                                                              onPressed: () =>
                                                                  Navigator.pop(
                                                                      alertDialogContext),
                                                              child: Text('Ok'),
                                                            ),
                                                          ],
                                                        );
                                                      },
                                                    );
                                                    if (_shouldSetState)
                                                      setState(() {});
                                                    return;
                                                  }
                                                }

                                                if (_shouldSetState)
                                                  setState(() {});
                                              },
                                        text: 'SAVE',
                                        options: FFButtonOptions(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  50.0, 5.0, 50.0, 5.0),
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          textStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmall
                                                  .override(
                                                    fontFamily: 'Readex Pro',
                                                    color: Colors.white,
                                                    fontSize: 28.0,
                                                    fontWeight: FontWeight.w300,
                                                  ),
                                          elevation: 3.0,
                                          borderSide: BorderSide(
                                            color: Colors.transparent,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          disabledColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                          disabledTextColor: Color(0x5195A1AC),
                                        ),
                                      ),
                                    ),
                                  ),
                                if (!_model.checkboxValue!)
                                  Opacity(
                                    opacity: 0.7,
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 20.0, 0.0, 0.0),
                                      child: FFButtonWidget(
                                        onPressed: !((_model.dropDownValue1 !=
                                                    null) &&
                                                (_model.dropDownValue2 != null))
                                            ? null
                                            : () async {
                                                final currentUserLocationValue =
                                                    parseLatLngFromString(
                                                        await Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        PlacePicker(
                                                            "AIzaSyCyGcsnPrn-SPlyL16vAt1V3sgGAZxvZuE"),
                                                  ),
                                                ));
                                                if (valueOrDefault(
                                                            currentUserLocationValue,
                                                            '') ==
                                                        null ||
                                                    valueOrDefault(
                                                            currentUserLocationValue,
                                                            '') ==
                                                        const LatLng(0, 0)) {
                                                  await showDialog(
                                                    context: context,
                                                    builder:
                                                        (alertDialogContext) {
                                                      return AlertDialog(
                                                        title: Text('Error'),
                                                        content: Text(
                                                            'please choose your location'),
                                                        actions: [
                                                          TextButton(
                                                            onPressed: () =>
                                                                Navigator.pop(
                                                                    alertDialogContext),
                                                            child: Text('Ok'),
                                                          ),
                                                        ],
                                                      );
                                                    },
                                                  );
                                                  return;
                                                }
                                                var _shouldSetState = false;
                                                if (valueOrDefault(
                                                            currentUserDocument
                                                                ?.licencePlate,
                                                            '') ==
                                                        null ||
                                                    valueOrDefault(
                                                            currentUserDocument
                                                                ?.licencePlate,
                                                            '') ==
                                                        '') {
                                                  await showDialog(
                                                    context: context,
                                                    builder:
                                                        (alertDialogContext) {
                                                      return AlertDialog(
                                                        title: Text('Error'),
                                                        content: Text(
                                                            'Licence Plate Not Set'),
                                                        actions: [
                                                          TextButton(
                                                            onPressed: () =>
                                                                Navigator.pop(
                                                                    alertDialogContext),
                                                            child: Text('Ok'),
                                                          ),
                                                        ],
                                                      );
                                                    },
                                                  );

                                                  context
                                                      .pushNamed('Setup-slide');

                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(
                                                    SnackBar(
                                                      content: Text(
                                                        'Complete Your Profile or the app will not function',
                                                        style: TextStyle(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                        ),
                                                      ),
                                                      duration: Duration(
                                                          milliseconds: 4000),
                                                      backgroundColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondary,
                                                    ),
                                                  );
                                                  if (_shouldSetState)
                                                    setState(() {});
                                                  return;
                                                } else {
                                                  setState(() {
                                                    _model.locationCheck =
                                                        functions.latlangToString(
                                                            currentUserLocationValue!);
                                                  });
                                                  if (_model.locationCheck !=
                                                      '0.0,0.0') {
                                                    setState(() {
                                                      _model.locationCheck =
                                                          currentUserLocationValue
                                                              ?.toString();
                                                    });
                                                  } else {
                                                    await showDialog(
                                                      context: context,
                                                      builder:
                                                          (alertDialogContext) {
                                                        return AlertDialog(
                                                          title: Text('Error'),
                                                          content: Text(
                                                              'Location permission required'),
                                                          actions: [
                                                            TextButton(
                                                              onPressed: () =>
                                                                  Navigator.pop(
                                                                      alertDialogContext),
                                                              child: Text('Ok'),
                                                            ),
                                                          ],
                                                        );
                                                      },
                                                    );
                                                    setState(() {
                                                      _model.locationCheck =
                                                          'location?';
                                                    });
                                                    if (_shouldSetState)
                                                      setState(() {});
                                                    return;
                                                  }

                                                  _model.lookupAddress =
                                                      await GeoCodingCall.call(
                                                    latlang: functions
                                                        .latlangToString(
                                                            currentUserLocationValue!),
                                                  );
                                                  _shouldSetState = true;
                                                  if ((_model.lookupAddress
                                                          ?.succeeded ??
                                                      true)) {
                                                    _model.lookupAction =
                                                        await queryActionListRecordOnce(
                                                      queryBuilder:
                                                          (actionListRecord) =>
                                                              actionListRecord
                                                                  .where(
                                                        'action_id',
                                                        isEqualTo: _model
                                                            .dropDownValue1,
                                                      ),
                                                      singleRecord: true,
                                                    ).then((s) =>
                                                            s.firstOrNull);
                                                    _shouldSetState = true;
                                                    _model.lookupOption =
                                                        await queryOptionListRecordOnce(
                                                      queryBuilder:
                                                          (optionListRecord) =>
                                                              optionListRecord
                                                                  .where(
                                                        'option_id',
                                                        isEqualTo: _model
                                                            .dropDownValue2,
                                                      ),
                                                      singleRecord: true,
                                                    ).then((s) =>
                                                            s.firstOrNull);
                                                    _shouldSetState = true;

                                                    var visitsRecordReference =
                                                        VisitsRecord.collection
                                                            .doc();
                                                    await visitsRecordReference
                                                        .set(
                                                            createVisitsRecordData(
                                                      createdAt:
                                                          getCurrentTimestamp,
                                                      latlang:
                                                          currentUserLocationValue,
                                                      locationInfo:
                                                          getJsonField(
                                                        (_model.lookupAddress
                                                                ?.jsonBody ??
                                                            ''),
                                                        r'''$.results[0].formatted_address''',
                                                      ).toString(),
                                                      entryExit: 'dunno',
                                                      userRef:
                                                          currentUserReference,
                                                      email: currentUserEmail,
                                                      licencePlate:
                                                          valueOrDefault(
                                                              currentUserDocument
                                                                  ?.licencePlate,
                                                              ''),
                                                      actionId: _model
                                                          .lookupAction
                                                          ?.actionId,
                                                      actionMessage: _model
                                                          .lookupAction
                                                          ?.actionMessage,
                                                      optionId: _model
                                                          .lookupOption
                                                          ?.optionId,
                                                      optionMessage: _model
                                                          .lookupOption
                                                          ?.optionMessage,
                                                      currentLocation: true,
                                                    ));
                                                    _model.saveVisitGps = VisitsRecord
                                                        .getDocumentFromData(
                                                            createVisitsRecordData(
                                                              createdAt:
                                                                  getCurrentTimestamp,
                                                              latlang:
                                                                  currentUserLocationValue,
                                                              locationInfo:
                                                                  getJsonField(
                                                                (_model.lookupAddress
                                                                        ?.jsonBody ??
                                                                    ''),
                                                                r'''$.results[0].formatted_address''',
                                                              ).toString(),
                                                              entryExit:
                                                                  'dunno',
                                                              userRef:
                                                                  currentUserReference,
                                                              email:
                                                                  currentUserEmail,
                                                              licencePlate:
                                                                  valueOrDefault(
                                                                      currentUserDocument
                                                                          ?.licencePlate,
                                                                      ''),
                                                              actionId: _model
                                                                  .lookupAction
                                                                  ?.actionId,
                                                              actionMessage: _model
                                                                  .lookupAction
                                                                  ?.actionMessage,
                                                              optionId: _model
                                                                  .lookupOption
                                                                  ?.optionId,
                                                              optionMessage: _model
                                                                  .lookupOption
                                                                  ?.optionMessage,
                                                              currentLocation:
                                                                  true,
                                                            ),
                                                            visitsRecordReference);
                                                    _shouldSetState = true;
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(
                                                      SnackBar(
                                                        content: Text(
                                                          'Done',
                                                          style: TextStyle(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryText,
                                                          ),
                                                        ),
                                                        duration: Duration(
                                                            milliseconds: 4000),
                                                        backgroundColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondary,
                                                      ),
                                                    );

                                                    context.pushNamed(
                                                      'VisitSaved',
                                                      queryParameters: {
                                                        'createdBy':
                                                            serializeParam(
                                                          getCurrentTimestamp,
                                                          ParamType.DateTime,
                                                        ),
                                                        'address':
                                                            serializeParam(
                                                          getJsonField(
                                                            (_model.lookupAddress
                                                                    ?.jsonBody ??
                                                                ''),
                                                            r'''$.results[0].formatted_address''',
                                                          ).toString(),
                                                          ParamType.String,
                                                        ),
                                                        'latlang':
                                                            serializeParam(
                                                          currentUserLocationValue,
                                                          ParamType.LatLng,
                                                        ),
                                                        'withGPS':
                                                            serializeParam(
                                                          true,
                                                          ParamType.bool,
                                                        ),
                                                        'licencePlate':
                                                            serializeParam(
                                                          valueOrDefault(
                                                              currentUserDocument
                                                                  ?.licencePlate,
                                                              ''),
                                                          ParamType.String,
                                                        ),
                                                        'email': serializeParam(
                                                          currentUserEmail,
                                                          ParamType.String,
                                                        ),
                                                        'actionMessage':
                                                            serializeParam(
                                                          _model.lookupAction
                                                              ?.actionMessage,
                                                          ParamType.String,
                                                        ),
                                                        'optionMessage':
                                                            serializeParam(
                                                          _model.lookupOption
                                                              ?.optionMessage,
                                                          ParamType.String,
                                                        ),
                                                        'currentLocation':
                                                            serializeParam(
                                                          true,
                                                          ParamType.bool,
                                                        ),
                                                      }.withoutNulls,
                                                    );
                                                  } else {
                                                    await showDialog(
                                                      context: context,
                                                      builder:
                                                          (alertDialogContext) {
                                                        return AlertDialog(
                                                          title: Text('Fail'),
                                                          content: Text('Fail'),
                                                          actions: [
                                                            TextButton(
                                                              onPressed: () =>
                                                                  Navigator.pop(
                                                                      alertDialogContext),
                                                              child: Text('Ok'),
                                                            ),
                                                          ],
                                                        );
                                                      },
                                                    );
                                                    if (_shouldSetState)
                                                      setState(() {});
                                                    return;
                                                  }
                                                }

                                                if (_shouldSetState)
                                                  setState(() {});
                                              },
                                        text: 'NEXT',
                                        options: FFButtonOptions(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  50.0, 5.0, 50.0, 5.0),
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          textStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmall
                                                  .override(
                                                    fontFamily: 'Readex Pro',
                                                    color: Colors.white,
                                                    fontSize: 28.0,
                                                    fontWeight: FontWeight.w300,
                                                  ),
                                          elevation: 3.0,
                                          borderSide: const BorderSide(
                                            color: Colors.transparent,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          disabledColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                          disabledTextColor: Color(0x5195A1AC),
                                        ),
                                      ),
                                    ),
                                  ),
                                if (!_model.checkboxValue!)
                                  Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 15.0, 0.0, 0.0),
                                    child: Text(
                                      'Select location on next screen',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium,
                                    ),
                                  ),
                                Container(
                                  width: MediaQuery.sizeOf(context).width * 1.0,
                                  decoration: BoxDecoration(),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 50.0, 0.0, 0.0),
                                    child: Text(
                                      'This will save a record of the parking event as you saw it.',
                                      textAlign: TextAlign.center,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            color: FlutterFlowTheme.of(context)
                                                .info,
                                            fontWeight: FontWeight.normal,
                                          ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
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
