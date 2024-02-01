import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';

import '../../picker/pick.dart';
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
import 'message_operator_model.dart';
export 'message_operator_model.dart';
import 'package:http/http.dart' as http;

class MessageOperatorWidget extends StatefulWidget {
  const MessageOperatorWidget({Key? key}) : super(key: key);

  @override
  _MessageOperatorWidgetState createState() => _MessageOperatorWidgetState();
}

class _MessageOperatorWidgetState extends State<MessageOperatorWidget> {
  late MessageOperatorModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  LatLng currentUserLocationValue=LatLng(0, 0);

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MessageOperatorModel());

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

    return FutureBuilder<List<OperatorsRecord>>(
      future: queryOperatorsRecordOnce(
        singleRecord: true,
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
        List<OperatorsRecord> messageOperatorOperatorsRecordList =
            snapshot.data!;
        final messageOperatorOperatorsRecord =
            messageOperatorOperatorsRecordList.isNotEmpty
                ? messageOperatorOperatorsRecordList.first
                : null;
        return Title(
            title: 'messageOperator',
            color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
            child: Scaffold(
              key: scaffoldKey,
              backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
              body: Stack(
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
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
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 16.0, 16.0, 16.0),
                            child: Text(
                              'Message Parking Operator',
                              style:
                                  FlutterFlowTheme.of(context).headlineMedium,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 0.0, 16.0, 0.0),
                            child: Text(
                              'Select the recipient and message from the dropdowns below.',
                              style: FlutterFlowTheme.of(context)
                                  .bodySmall
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    fontSize: 16.0,
                                  ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                15.0, 32.0, 15.0, 0.0),
                            child: Container(
                              width: double.infinity,
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
                                    FutureBuilder<List<OperatorsRecord>>(
                                      future: queryOperatorsRecordOnce(),
                                      builder: (context, snapshot) {
                                        // Customize what your widget looks like when it's loading.
                                        if (!snapshot.hasData) {
                                          return Center(
                                            child: SizedBox(
                                              width: 50.0,
                                              height: 50.0,
                                              child: CircularProgressIndicator(
                                                valueColor:
                                                    AlwaysStoppedAnimation<
                                                        Color>(
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                                ),
                                              ),
                                            ),
                                          );
                                        }
                                        List<OperatorsRecord>
                                            dropDownOperatorsRecordList =
                                            snapshot.data!;
                                        return FlutterFlowDropDown<int>(
                                          controller: _model
                                                  .dropDownValueController1 ??=
                                              FormFieldController<int>(null),
                                          options: List<int>.from(
                                              dropDownOperatorsRecordList
                                                  .map((e) => e.operatorId)
                                                  .toList()),
                                          optionLabels:
                                              dropDownOperatorsRecordList
                                                  .map((e) => e.operator)
                                                  .toList(),
                                          onChanged: (val) => setState(() =>
                                              _model.dropDownValue1 = val),
                                          width: 288.0,
                                          height: 50.0,
                                          searchHintTextStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium,
                                          textStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Readex Pro',
                                                    fontSize: 14.0,
                                                  ),
                                          hintText: 'Select Operator...',
                                          searchHintText:
                                              'Search for an item...',
                                          icon: Icon(
                                            Icons.keyboard_arrow_down_rounded,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            size: 24.0,
                                          ),
                                          fillColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                          elevation: 2.0,
                                          borderColor:
                                              FlutterFlowTheme.of(context)
                                                  .alternate,
                                          borderWidth: 2.0,
                                          borderRadius: 8.0,
                                          margin:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 4.0, 10.0, 4.0),
                                          hidesUnderline: true,
                                          isSearchable: true,
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
                              width: double.infinity,
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
                                    StreamBuilder<List<MessageListRecord>>(
                                      stream: queryMessageListRecord(),
                                      builder: (context, snapshot) {
                                        // Customize what your widget looks like when it's loading.
                                        if (!snapshot.hasData) {
                                          return Center(
                                            child: SizedBox(
                                              width: 50.0,
                                              height: 50.0,
                                              child: CircularProgressIndicator(
                                                valueColor:
                                                    AlwaysStoppedAnimation<
                                                        Color>(
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                                ),
                                              ),
                                            ),
                                          );
                                        }
                                        List<MessageListRecord>
                                            dropDownMessageListRecordList =
                                            snapshot.data!;
                                        return FlutterFlowDropDown<int>(
                                          controller: _model
                                                  .dropDownValueController2 ??=
                                              FormFieldController<int>(null),
                                          options: List<int>.from(
                                              dropDownMessageListRecordList
                                                  .map((e) => e.selectMsgId)
                                                  .toList()),
                                          optionLabels:
                                              dropDownMessageListRecordList
                                                  .map((e) => e.selectedMessage)
                                                  .toList(),
                                          onChanged: (val) => setState(() =>
                                              _model.dropDownValue2 = val),
                                          width: 288.0,
                                          height: 50.0,
                                          textStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Readex Pro',
                                                    fontSize: 14.0,
                                                  ),
                                          hintText: 'Select Message...',
                                          icon: Icon(
                                            Icons.keyboard_arrow_down_rounded,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            size: 24.0,
                                          ),
                                          fillColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                          elevation: 2.0,
                                          borderColor:
                                              FlutterFlowTheme.of(context)
                                                  .alternate,
                                          borderWidth: 2.0,
                                          borderRadius: 8.0,
                                          margin:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  10.0, 4.0, 10.0, 4.0),
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
                                          borderRadius:
                                              BorderRadius.circular(4.0),
                                        ),
                                      ),
                                      unselectedWidgetColor:
                                          FlutterFlowTheme.of(context)
                                              .secondaryText,
                                    ),
                                    child: Checkbox(
                                      value: _model.checkboxValue ??= true,
                                      onChanged: (newValue) async {
                                        setState(() =>
                                            _model.checkboxValue = newValue!);
                                        if (newValue!) {
                                          FFAppState().locationSelect = true;
                                        } else {
                                          FFAppState().update(() {
                                            FFAppState().locationSelect = false;
                                          });
                                        }
                                      },
                                      activeColor:
                                          FlutterFlowTheme.of(context).primary,
                                      checkColor:
                                          FlutterFlowTheme.of(context).info,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      2.0, 0.0, 0.0, 0.0),
                                  child: Text(
                                    'Include my current location',
                                    textAlign: TextAlign.end,
                                    style:
                                        FlutterFlowTheme.of(context).bodyMedium,
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
                                height: 300.0,
                                decoration: BoxDecoration(),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    if (_model.checkboxValue ?? true)
                                      Opacity(
                                        opacity: 0.8,
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 20.0, 0.0, 0.0),
                                          child: FFButtonWidget(
                                            onPressed: !((_model
                                                            .dropDownValue1 !=
                                                        null) &&
                                                    (_model.dropDownValue2 !=
                                                        null))
                                                ? null
                                                : () async {
                                                    currentUserLocationValue =
                                                        await getCurrentUserLocation(
                                                            defaultLocation:
                                                                LatLng(
                                                                    0.0, 0.0));
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
                                                            title:
                                                                Text('Error'),
                                                            content: Text(
                                                                'Licence Plate Not Set'),
                                                            actions: [
                                                              TextButton(
                                                                onPressed: () =>
                                                                    Navigator.pop(
                                                                        alertDialogContext),
                                                                child:
                                                                    Text('Ok'),
                                                              ),
                                                            ],
                                                          );
                                                        },
                                                      );

                                                      context.pushNamed(
                                                          'CreateProfile');

                                                      ScaffoldMessenger.of(
                                                              context)
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
                                                              milliseconds:
                                                                  4000),
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
                                                      _model.addressLookup =
                                                          await GeoCodingCall
                                                              .call(
                                                        latlang: functions
                                                            .latlangToString(
                                                                currentUserLocationValue!),
                                                      );
                                                      _shouldSetState = true;
                                                      if ((_model.addressLookup
                                                              ?.succeeded ??
                                                          true)) {
                                                        _model.operatorLookup =
                                                            await queryOperatorsRecordOnce(
                                                          queryBuilder:
                                                              (operatorsRecord) =>
                                                                  operatorsRecord
                                                                      .where(
                                                            'operator_id',
                                                            isEqualTo: _model
                                                                .dropDownValue1,
                                                          ),
                                                          singleRecord: true,
                                                        ).then((s) =>
                                                                s.firstOrNull);
                                                        _shouldSetState = true;
                                                        _model.messageLookup =
                                                            await queryMessageListRecordOnce(
                                                          queryBuilder:
                                                              (messageListRecord) =>
                                                                  messageListRecord
                                                                      .where(
                                                            'select_msg_id',
                                                            isEqualTo: _model
                                                                .dropDownValue2,
                                                          ),
                                                          singleRecord: true,
                                                        ).then((s) =>
                                                                s.firstOrNull);
                                                        _shouldSetState = true;

                                                        var messagesRecordReference =
                                                            MessagesRecord
                                                                .collection
                                                                .doc();
                                                        await messagesRecordReference
                                                            .set(
                                                                createMessagesRecordData(
                                                          recipient: _model
                                                              .dropDownValue1
                                                              ?.toString(),
                                                          latlang:
                                                              currentUserLocationValue,
                                                          message: _model
                                                              .dropDownValue2
                                                              ?.toString(),
                                                          withGps: FFAppState()
                                                              .locationSelect,
                                                          address: getJsonField(
                                                            (_model.addressLookup
                                                                    ?.jsonBody ??
                                                                ''),
                                                            r'''$.results[0].formatted_address''',
                                                          ).toString(),
                                                          outgoingMessage: true,
                                                          createdBy:
                                                              getCurrentTimestamp,
                                                          userRef:
                                                              currentUserReference,
                                                          myEmail:
                                                              currentUserEmail,
                                                          licencePlate: valueOrDefault(
                                                              currentUserDocument
                                                                  ?.licencePlate,
                                                              ''),
                                                          ata: valueOrDefault<
                                                              String>(
                                                            _model
                                                                .operatorLookup
                                                                ?.ata,
                                                            'ata?',
                                                          ),
                                                          operator:
                                                              valueOrDefault<
                                                                  String>(
                                                            _model
                                                                .operatorLookup
                                                                ?.operator,
                                                            '?? op lookup',
                                                          ),
                                                          messageActual: _model
                                                              .messageLookup
                                                              ?.selectedMessage,
                                                        ));
                                                        _model.sendMessageGps =
                                                            MessagesRecord
                                                                .getDocumentFromData(
                                                                    createMessagesRecordData(
                                                                      recipient: _model
                                                                          .dropDownValue1
                                                                          ?.toString(),
                                                                      latlang:
                                                                          currentUserLocationValue,
                                                                      message: _model
                                                                          .dropDownValue2
                                                                          ?.toString(),
                                                                      withGps:
                                                                          FFAppState()
                                                                              .locationSelect,
                                                                      address:
                                                                          getJsonField(
                                                                        (_model.addressLookup?.jsonBody ??
                                                                            ''),
                                                                        r'''$.results[0].formatted_address''',
                                                                      ).toString(),
                                                                      outgoingMessage:
                                                                          true,
                                                                      createdBy:
                                                                          getCurrentTimestamp,
                                                                      userRef:
                                                                          currentUserReference,
                                                                      myEmail:
                                                                          currentUserEmail,
                                                                      licencePlate: valueOrDefault(
                                                                          currentUserDocument
                                                                              ?.licencePlate,
                                                                          ''),
                                                                      ata: valueOrDefault<
                                                                          String>(
                                                                        _model
                                                                            .operatorLookup
                                                                            ?.ata,
                                                                        'ata?',
                                                                      ),
                                                                      operator:
                                                                          valueOrDefault<
                                                                              String>(
                                                                        _model
                                                                            .operatorLookup
                                                                            ?.operator,
                                                                        '?? op lookup',
                                                                      ),
                                                                      messageActual: _model
                                                                          .messageLookup
                                                                          ?.selectedMessage,
                                                                    ),
                                                                    messagesRecordReference);
                                                        _shouldSetState = true;
                                                        ScaffoldMessenger.of(
                                                                context)
                                                            .showSnackBar(
                                                          SnackBar(
                                                            content: Text(
                                                              'Done',
                                                              style: TextStyle(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                              ),
                                                            ),
                                                            duration: Duration(
                                                                milliseconds:
                                                                    4000),
                                                            backgroundColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondary,
                                                          ),
                                                        );

                                                        context.pushNamed(
                                                          'sentMessage',
                                                          queryParameters: {
                                                            'createdBy':
                                                                serializeParam(
                                                              getCurrentTimestamp,
                                                              ParamType
                                                                  .DateTime,
                                                            ),
                                                            'recipient':
                                                                serializeParam(
                                                              _model
                                                                  .dropDownValue1
                                                                  ?.toString(),
                                                              ParamType.String,
                                                            ),
                                                            'message':
                                                                serializeParam(
                                                              _model
                                                                  .dropDownValue2
                                                                  ?.toString(),
                                                              ParamType.String,
                                                            ),
                                                            'myEmail':
                                                                serializeParam(
                                                              currentUserEmail,
                                                              ParamType.String,
                                                            ),
                                                            'licencePlate':
                                                                serializeParam(
                                                              valueOrDefault(
                                                                  currentUserDocument
                                                                      ?.licencePlate,
                                                                  ''),
                                                              ParamType.String,
                                                            ),
                                                            'address':
                                                                serializeParam(
                                                              getJsonField(
                                                                (_model.addressLookup
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
                                                            'outgoingMessage':
                                                                serializeParam(
                                                              true,
                                                              ParamType.bool,
                                                            ),
                                                            'withGPS':
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
                                                              title:
                                                                  Text('Fail'),
                                                              content:
                                                                  Text('Fail'),
                                                              actions: [
                                                                TextButton(
                                                                  onPressed: () =>
                                                                      Navigator.pop(
                                                                          alertDialogContext),
                                                                  child: Text(
                                                                      'Ok'),
                                                                ),
                                                              ],
                                                            );
                                                          },
                                                        );
                                                        if (_shouldSetState) {
                                                          setState(() {});
                                                        }
                                                        return;
                                                      }
                                                    }

                                                    if (_shouldSetState) {
                                                      setState(() {});
                                                    }
                                                    if (_model.operatorLookup
                                                            ?.ata ==
                                                        'BPA') {
                                                      final QuerySnapshot<
                                                              Map<String,
                                                                  dynamic>>
                                                          querySnapshot =
                                                          await FirebaseFirestore
                                                              .instance
                                                              .collection(
                                                                  'operators') // Replace with your actual collection name
                                                              .where(
                                                                  'operator_id',
                                                                  isEqualTo: _model
                                                                      .dropDownValue1)
                                                              .get();

                                                      if (querySnapshot
                                                          .docs.isNotEmpty) {
                                                        final operatorData =
                                                            querySnapshot
                                                                .docs.first
                                                                .data();
                                                        final operatorEmail =
                                                            operatorData[
                                                                    'operator_email']
                                                                as String?;
                                                        sendEmailBPA(
                                                            _model.messageLookup
                                                                ?.selectedMessage,
                                                            currentUserDocument
                                                                ?.licencePlate,
                                                            operatorEmail,
                                                            currentUserLocationValue!,
                                                            serializeParam(
                                                              getJsonField(
                                                                (_model.addressLookup
                                                                        ?.jsonBody ??
                                                                    ''),
                                                                r'''$.results[0].formatted_address''',
                                                              ).toString(),
                                                              ParamType.String,
                                                            ));
                                                      }

                                                      // Call the sendEmailBPA function
                                                    } else if (_model
                                                            .operatorLookup
                                                            ?.ata ==
                                                        'IPC') {
                                                      final QuerySnapshot<
                                                              Map<String,
                                                                  dynamic>>
                                                          querySnapshot =
                                                          await FirebaseFirestore
                                                              .instance
                                                              .collection(
                                                                  'operators') // Replace with your actual collection name
                                                              .where(
                                                                  'operator_id',
                                                                  isEqualTo: _model
                                                                      .dropDownValue1)
                                                              .get();

                                                      if (querySnapshot
                                                          .docs.isNotEmpty) {
                                                        final operatorData =
                                                            querySnapshot
                                                                .docs.first
                                                                .data();
                                                        final operatorEmail =
                                                            operatorData[
                                                                    'operator_email']
                                                                as String?;
                                                        sendEmailIPC(
                                                            _model.messageLookup
                                                                ?.selectedMessage,
                                                            currentUserDocument
                                                                ?.licencePlate,
                                                            operatorEmail,
                                                            currentUserLocationValue!,
                                                            serializeParam(
                                                              getJsonField(
                                                                (_model.addressLookup
                                                                        ?.jsonBody ??
                                                                    ''),
                                                                r'''$.results[0].formatted_address''',
                                                              ).toString(),
                                                              ParamType.String,
                                                            )); // Call the sendEmailIPC function
                                                      }
                                                    }
                                                  },
                                            text: 'SEND',
                                            options: FFButtonOptions(
                                              padding:
                                                  const EdgeInsetsDirectional
                                                          .fromSTEB(
                                                      50.0, 5.0, 50.0, 5.0),
                                              iconPadding:
                                                  const EdgeInsetsDirectional
                                                          .fromSTEB(
                                                      0.0, 0.0, 0.0, 0.0),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              textStyle: FlutterFlowTheme.of(
                                                      context)
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
                                              disabledTextColor:
                                                  Color(0x5195A1AC),
                                            ),
                                          ),
                                        ),
                                      ),
                                    if (!_model.checkboxValue!)
                                      Opacity(
                                        opacity: 0.8,
                                        child: Padding(
                                          padding: const EdgeInsetsDirectional
                                              .fromSTEB(0.0, 20.0, 0.0, 0.0),
                                          child: FFButtonWidget(
                                            onPressed: !((_model
                                                            .dropDownValue1 !=
                                                        null) &&
                                                    (_model.dropDownValue2 !=
                                                        null))
                                                ? null
                                                : () async {
                                              final currentUserLocationValue =parseLatLngFromString (await Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) => PlacePicker("AIzaSyCyGcsnPrn-SPlyL16vAt1V3sgGAZxvZuE"), // Replace 'Picker' with the actual class
                                                ),
                                              ));
                                              var _shouldSetState = false;
                                              if (valueOrDefault(
                                                  currentUserLocationValue,
                                                  '') ==
                                                  null ||
                                                  valueOrDefault(
                                                      currentUserLocationValue,
                                                      '') ==
                                                      const LatLng(0, 0))
                                              {
                                                await showDialog(
                                                  context: context,
                                                  builder:
                                                      (alertDialogContext) {
                                                    return AlertDialog(
                                                      title:
                                                      Text('Error'),
                                                      content: Text(
                                                          'please choose your location'),
                                                      actions: [
                                                        TextButton(
                                                          onPressed: () =>
                                                              Navigator.pop(
                                                                  alertDialogContext),
                                                          child:
                                                          Text('Ok'),
                                                        ),
                                                      ],
                                                    );
                                                  },
                                                );

                                                return;
                                              }
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
                                                      title:
                                                      Text('Error'),
                                                      content: Text(
                                                          'Licence Plate Not Set'),
                                                      actions: [
                                                        TextButton(
                                                          onPressed: () =>
                                                              Navigator.pop(
                                                                  alertDialogContext),
                                                          child:
                                                          Text('Ok'),
                                                        ),
                                                      ],
                                                    );
                                                  },
                                                );

                                                context.pushNamed(
                                                    'CreateProfile');

                                                ScaffoldMessenger.of(
                                                    context)
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
                                                    duration: const Duration(
                                                        milliseconds:
                                                        4000),
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
                                                _model.addressLookup =
                                                await GeoCodingCall
                                                    .call(
                                                  latlang: functions
                                                      .latlangToString(
                                                      currentUserLocationValue!),
                                                );
                                                _shouldSetState = true;
                                                if ((_model.addressLookup
                                                    ?.succeeded ??
                                                    true)) {
                                                  _model.operatorLookup =
                                                  await queryOperatorsRecordOnce(
                                                    queryBuilder:
                                                        (operatorsRecord) =>
                                                        operatorsRecord
                                                            .where(
                                                          'operator_id',
                                                          isEqualTo: _model
                                                              .dropDownValue1,
                                                        ),
                                                    singleRecord: true,
                                                  ).then((s) =>
                                                  s.firstOrNull);
                                                  _shouldSetState = true;
                                                  _model.messageLookup =
                                                  await queryMessageListRecordOnce(
                                                    queryBuilder:
                                                        (messageListRecord) =>
                                                        messageListRecord
                                                            .where(
                                                          'select_msg_id',
                                                          isEqualTo: _model
                                                              .dropDownValue2,
                                                        ),
                                                    singleRecord: true,
                                                  ).then((s) =>
                                                  s.firstOrNull);
                                                  _shouldSetState = true;

                                                  var messagesRecordReference =
                                                  MessagesRecord
                                                      .collection
                                                      .doc();
                                                  await messagesRecordReference
                                                      .set(
                                                      createMessagesRecordData(
                                                        recipient: _model
                                                            .dropDownValue1
                                                            ?.toString(),
                                                        latlang:
                                                        currentUserLocationValue,
                                                        message: _model
                                                            .dropDownValue2
                                                            ?.toString(),
                                                        withGps: FFAppState()
                                                            .locationSelect,
                                                        address: getJsonField(
                                                          (_model.addressLookup
                                                              ?.jsonBody ??
                                                              ''),
                                                          r'''$.results[0].formatted_address''',
                                                        ).toString(),
                                                        outgoingMessage: true,
                                                        createdBy:
                                                        getCurrentTimestamp,
                                                        userRef:
                                                        currentUserReference,
                                                        myEmail:
                                                        currentUserEmail,
                                                        licencePlate: valueOrDefault(
                                                            currentUserDocument
                                                                ?.licencePlate,
                                                            ''),
                                                        ata: valueOrDefault<
                                                            String>(
                                                          _model
                                                              .operatorLookup
                                                              ?.ata,
                                                          'ata?',
                                                        ),
                                                        operator:
                                                        valueOrDefault<
                                                            String>(
                                                          _model
                                                              .operatorLookup
                                                              ?.operator,
                                                          '?? op lookup',
                                                        ),
                                                        messageActual: _model
                                                            .messageLookup
                                                            ?.selectedMessage,
                                                      ));
                                                  _model.sendMessageGps =
                                                      MessagesRecord
                                                          .getDocumentFromData(
                                                          createMessagesRecordData(
                                                            recipient: _model
                                                                .dropDownValue1
                                                                ?.toString(),
                                                            latlang:
                                                            currentUserLocationValue,
                                                            message: _model
                                                                .dropDownValue2
                                                                ?.toString(),
                                                            withGps:
                                                            FFAppState()
                                                                .locationSelect,
                                                            address:
                                                            getJsonField(
                                                              (_model.addressLookup?.jsonBody ??
                                                                  ''),
                                                              r'''$.results[0].formatted_address''',
                                                            ).toString(),
                                                            outgoingMessage:
                                                            true,
                                                            createdBy:
                                                            getCurrentTimestamp,
                                                            userRef:
                                                            currentUserReference,
                                                            myEmail:
                                                            currentUserEmail,
                                                            licencePlate: valueOrDefault(
                                                                currentUserDocument
                                                                    ?.licencePlate,
                                                                ''),
                                                            ata: valueOrDefault<
                                                                String>(
                                                              _model
                                                                  .operatorLookup
                                                                  ?.ata,
                                                              'ata?',
                                                            ),
                                                            operator:
                                                            valueOrDefault<
                                                                String>(
                                                              _model
                                                                  .operatorLookup
                                                                  ?.operator,
                                                              '?? op lookup',
                                                            ),
                                                            messageActual: _model
                                                                .messageLookup
                                                                ?.selectedMessage,
                                                          ),
                                                          messagesRecordReference);
                                                  _shouldSetState = true;
                                                  ScaffoldMessenger.of(
                                                      context)
                                                      .showSnackBar(
                                                    SnackBar(
                                                      content: Text(
                                                        'Done',
                                                        style: TextStyle(
                                                          color: FlutterFlowTheme.of(
                                                              context)
                                                              .primaryText,
                                                        ),
                                                      ),
                                                      duration: const Duration(
                                                          milliseconds:
                                                          4000),
                                                      backgroundColor:
                                                      FlutterFlowTheme.of(
                                                          context)
                                                          .secondary,
                                                    ),
                                                  );

                                                  context.pushNamed(
                                                    'sentMessage',
                                                    queryParameters: {
                                                      'createdBy':
                                                      serializeParam(
                                                        getCurrentTimestamp,
                                                        ParamType
                                                            .DateTime,
                                                      ),
                                                      'recipient':
                                                      serializeParam(
                                                        _model
                                                            .dropDownValue1
                                                            ?.toString(),
                                                        ParamType.String,
                                                      ),
                                                      'message':
                                                      serializeParam(
                                                        _model
                                                            .dropDownValue2
                                                            ?.toString(),
                                                        ParamType.String,
                                                      ),
                                                      'myEmail':
                                                      serializeParam(
                                                        currentUserEmail,
                                                        ParamType.String,
                                                      ),
                                                      'licencePlate':
                                                      serializeParam(
                                                        valueOrDefault(
                                                            currentUserDocument
                                                                ?.licencePlate,
                                                            ''),
                                                        ParamType.String,
                                                      ),
                                                      'address':
                                                      serializeParam(
                                                        getJsonField(
                                                          (_model.addressLookup
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
                                                      'outgoingMessage':
                                                      serializeParam(
                                                        true,
                                                        ParamType.bool,
                                                      ),
                                                      'withGPS':
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
                                                        title:
                                                        Text('Fail'),
                                                        content:
                                                        Text('Fail'),
                                                        actions: [
                                                          TextButton(
                                                            onPressed: () =>
                                                                Navigator.pop(
                                                                    alertDialogContext),
                                                            child: const Text(
                                                                'Ok'),
                                                          ),
                                                        ],
                                                      );
                                                    },
                                                  );
                                                  if (_shouldSetState) {
                                                    setState(() {});
                                                  }
                                                  return;
                                                }
                                              }

                                              if (_shouldSetState) {
                                                setState(() {});
                                              }
                                              if (_model.operatorLookup
                                                  ?.ata ==
                                                  'BPA') {
                                                final QuerySnapshot<
                                                    Map<String,
                                                        dynamic>>
                                                querySnapshot =
                                                await FirebaseFirestore
                                                    .instance
                                                    .collection(
                                                    'operators') // Replace with your actual collection name
                                                    .where(
                                                    'operator_id',
                                                    isEqualTo: _model
                                                        .dropDownValue1)
                                                    .get();

                                                if (querySnapshot
                                                    .docs.isNotEmpty) {
                                                  final operatorData =
                                                  querySnapshot
                                                      .docs.first
                                                      .data();
                                                  final operatorEmail =
                                                  operatorData[
                                                  'operator_email']
                                                  as String?;
                                                  sendEmailBPA(
                                                      _model.messageLookup
                                                          ?.selectedMessage,
                                                      currentUserDocument
                                                          ?.licencePlate,
                                                      operatorEmail,
                                                      currentUserLocationValue!,
                                                      serializeParam(
                                                        getJsonField(
                                                          (_model.addressLookup
                                                              ?.jsonBody ??
                                                              ''),
                                                          r'''$.results[0].formatted_address''',
                                                        ).toString(),
                                                        ParamType.String,
                                                      ));
                                                }

                                                // Call the sendEmailBPA function
                                              } else if (_model
                                                  .operatorLookup
                                                  ?.ata ==
                                                  'IPC') {
                                                final QuerySnapshot<
                                                    Map<String,
                                                        dynamic>>
                                                querySnapshot =
                                                await FirebaseFirestore
                                                    .instance
                                                    .collection(
                                                    'operators') // Replace with your actual collection name
                                                    .where(
                                                    'operator_id',
                                                    isEqualTo: _model
                                                        .dropDownValue1)
                                                    .get();

                                                if (querySnapshot
                                                    .docs.isNotEmpty) {
                                                  final operatorData =
                                                  querySnapshot
                                                      .docs.first
                                                      .data();
                                                  final operatorEmail =
                                                  operatorData[
                                                  'operator_email']
                                                  as String?;
                                                  sendEmailIPC(
                                                      _model.messageLookup
                                                          ?.selectedMessage,
                                                      currentUserDocument
                                                          ?.licencePlate,
                                                      operatorEmail,
                                                      currentUserLocationValue!,
                                                      serializeParam(
                                                        getJsonField(
                                                          (_model.addressLookup
                                                              ?.jsonBody ??
                                                              ''),
                                                          r'''$.results[0].formatted_address''',
                                                        ).toString(),
                                                        ParamType.String,
                                                      )); // Call the sendEmailIPC function
                                                }
                                              }
                                            },
                                            text: 'NEXT',
                                            options: FFButtonOptions(
                                              padding:
                                                  const EdgeInsetsDirectional
                                                          .fromSTEB(
                                                      50.0, 5.0, 50.0, 5.0),
                                              iconPadding:
                                                  const EdgeInsetsDirectional
                                                          .fromSTEB(
                                                      0.0, 0.0, 0.0, 0.0),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              textStyle: FlutterFlowTheme.of(
                                                      context)
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
                                              disabledTextColor:
                                                  Color(0x5195A1AC),
                                            ),
                                          ),
                                        ),
                                      ),
                                    if (!_model.checkboxValue!)
                                      Padding(
                                        padding: const EdgeInsetsDirectional
                                            .fromSTEB(0.0, 15.0, 0.0, 0.0),
                                        child: Text(
                                          'Select location on next screen',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium,
                                        ),
                                      ),
                                    Container(
                                      width: MediaQuery.sizeOf(context).width *
                                          1.0,
                                      decoration: BoxDecoration(),
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional
                                            .fromSTEB(0.0, 50.0, 0.0, 0.0),
                                        child: Text(
                                          'This will send your message to the parking operator along with your car reg, time, date and GPS coordinates.',
                                          textAlign: TextAlign.center,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Readex Pro',
                                                color:
                                                    FlutterFlowTheme.of(context)
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
                      child: const CustomNavBarWidget(
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
}

Future sendEmailBPA(
    String? selectedMessage,
    String? licencePlate,
    String? operatorEmail,
    LatLng currentUserLocationValue,
    String? serializeParam) async {
  const service = "service_ewvhn4r";
  const template = "bpa";
  const user = "4h5QEAL0WQoRD1Mkb";
  final url = Uri.parse("https://api.emailjs.com/api/v1.0/email/send");
  User? userEmail = FirebaseAuth.instance.currentUser;
  String? userEmailString = userEmail?.email;
  final response = await http.post(
    url,
    headers: {'Content-Type': 'application/json'},
    body: json.encode({
      "service_id": service,
      "template_id": template,
      "user_id": user,
      "accessToken": "-yDoWr5J28el7pA_uNCAL",
      "template_params": {
        "licence_plate": licencePlate,
        "operator_email": operatorEmail,
        "message": selectedMessage,
        "address": serializeParam,
        "latlng": currentUserLocationValue.latitude.toString() +
            ',' +
            currentUserLocationValue.longitude.toString(),
        "user_email": userEmailString
      }
    }),
  );
  print(response.body);
}

Future sendEmailIPC(
    String? selectedMessage,
    String? licencePlate,
    String? operatorEmail,
    LatLng currentUserLocationValue,
    String? serializeParam) async {
  const service = "service_ewvhn4r";
  const template = "ipc";
  const user = "4h5QEAL0WQoRD1Mkb";
  final url = Uri.parse("https://api.emailjs.com/api/v1.0/email/send");
  User? userEmail = FirebaseAuth.instance.currentUser;
  String? userEmailString = userEmail?.email;
  final response = await http.post(
    url,
    headers: {'Content-Type': 'application/json'},
    body: json.encode({
      "service_id": service,
      "template_id": template,
      "user_id": user,
      "accessToken": "-yDoWr5J28el7pA_uNCAL",
      "template_params": {
        "licence_plate": licencePlate,
        "operator_email": operatorEmail,
        "message": selectedMessage,
        "address": serializeParam,
        "latlng": currentUserLocationValue.latitude.toString() +
            ',' +
            currentUserLocationValue.longitude.toString(),
        "user_email": userEmailString
      }
    }),
  );
  print(response.body);

}


LatLng parseLatLngFromString(String latLngString) {
  try {
    // Extracting the numeric values using regular expression
    RegExp regex = RegExp(r'LatLng\((-?\d+\.\d+), (-?\d+\.\d+)\)');
    Match? match = regex.firstMatch(latLngString) as Match;

    if (match != null) {
      double latitude = double.parse(match.group(1)!);
      double longitude = double.parse(match.group(2)!);

      // Update the existing LatLng variable
      return LatLng(latitude, longitude);
    } else {
      // Handle the case when the input string doesn't match the expected format
      print('Error: Invalid format for LatLng string');
      return LatLng(0, 0); // Default to (0, 0) if parsing fails
    }
  } catch (e) {
    // Handle other parsing errors
    print('Error parsing LatLng: $e');
    return LatLng(0, 0); // Default to (0, 0) if parsing fails
  }
}
