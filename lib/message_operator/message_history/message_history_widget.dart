import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/custom_nav_bar_msg_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'message_history_model.dart';
export 'message_history_model.dart';

class MessageHistoryWidget extends StatefulWidget {
  const MessageHistoryWidget({Key? key}) : super(key: key);

  @override
  _MessageHistoryWidgetState createState() => _MessageHistoryWidgetState();
}

class _MessageHistoryWidgetState extends State<MessageHistoryWidget> {
  late MessageHistoryModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MessageHistoryModel());

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

    return StreamBuilder<List<MessagesRecord>>(
      stream: queryMessagesRecord(
        queryBuilder: (messagesRecord) => messagesRecord
            .where(
              'user_ref',
              isEqualTo: currentUserReference,
            )
            .orderBy('created_by', descending: true),
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
        List<MessagesRecord> messageHistoryMessagesRecordList = snapshot.data!;
        return Title(
            title: 'messageHistory',
            color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
            child: Scaffold(
              key: scaffoldKey,
              backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
              body: Stack(
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 0.0),
                    child: Container(
                      width: double.infinity,
                      height: MediaQuery.sizeOf(context).height * 0.87,
                      decoration: BoxDecoration(),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Align(
                              alignment: AlignmentDirectional(0.00, -1.00),
                              child: Text(
                                'Message History',
                                textAlign: TextAlign.center,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      fontSize: 22.0,
                                    ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  16.0, 12.0, 0.0, 0.0),
                              child: Text(
                                'Most Recent',
                                style: FlutterFlowTheme.of(context).labelMedium,
                              ),
                            ),
                            Builder(
                              builder: (context) {
                                final myMessages =
                                    messageHistoryMessagesRecordList.toList();
                                return ListView.builder(
                                  padding: EdgeInsets.zero,
                                  primary: false,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  itemCount: myMessages.length,
                                  itemBuilder: (context, myMessagesIndex) {
                                    final myMessagesItem =
                                        myMessages[myMessagesIndex];
                                    return Opacity(
                                      opacity: 0.5,
                                      child: Padding(
                                        padding:
                                            const EdgeInsetsDirectional.fromSTEB(
                                                0.0, 12.0, 0.0, 1.0),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            context.pushNamed(
                                              'sentMessageDetail',
                                              queryParameters: {
                                                'myMessage': serializeParam(
                                                  myMessagesItem,
                                                  ParamType.Document,
                                                ),
                                              }.withoutNulls,
                                              extra: <String, dynamic>{
                                                'myMessage': myMessagesItem,
                                              },
                                            );
                                          },
                                          child: Container(
                                            width: double.infinity,
                                            height: 60.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              boxShadow: [
                                                BoxShadow(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  offset: Offset(0.0, 1.0),
                                                )
                                              ],
                                            ),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      5.0, 5.0, 0.0, 5.0),
                                              child: Row(
                                                mainAxisSize:
                                                    MainAxisSize.min,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  if (!valueOrDefault<bool>(
                                                    myMessagesItem
                                                        .currentLocation,
                                                    false,
                                                  ))
                                                    FaIcon(
                                                      FontAwesomeIcons
                                                          .locationArrow,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                      size: 24.0,
                                                    ),
                                                  if (valueOrDefault<bool>(
                                                    myMessagesItem
                                                        .currentLocation,
                                                    false,
                                                  ))
                                                    Icon(
                                                      Icons.my_location_sharp,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                      size: 24.0,
                                                    ),
                                                  Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    5.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Text(
                                                          valueOrDefault<
                                                              String>(
                                                            myMessagesItem
                                                                .operator,
                                                            '???',
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyLarge,
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    5.0,
                                                                    5.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Text(
                                                          valueOrDefault<
                                                              String>(
                                                            dateTimeFormat(
                                                                'dd/MM/yy hh:mm a',
                                                                myMessagesItem
                                                                    .createdBy),
                                                            '???',
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .labelMedium,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Flexible(
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  5.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: AutoSizeText(
                                                        valueOrDefault<
                                                            String>(
                                                          myMessagesItem
                                                              .messageActual,
                                                          '???',
                                                        ),
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .titleLarge
                                                            .override(
                                                              fontFamily:
                                                                  'Outfit',
                                                              fontSize: 18.0,
                                                            ),
                                                      ),
                                                    ),
                                                  ),
                                                  if (valueOrDefault<bool>(
                                                    myMessagesItem
                                                            .outgoingMessage ==
                                                        true,
                                                    true,
                                                  ))
                                                    Icon(
                                                      Icons.arrow_forward_ios,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                      size: 24.0,
                                                    ),
                                                  if (valueOrDefault<bool>(
                                                    myMessagesItem
                                                            .outgoingMessage !=
                                                        true,
                                                    false,
                                                  ))
                                                    Icon(
                                                      Icons.arrow_back_ios,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                      size: 24.0,
                                                    ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(0.00, 1.00),
                    child: wrapWithModel(
                      model: _model.customNavBarMsgModel,
                      updateCallback: () => setState(() {}),
                      child: CustomNavBarMsgWidget(
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
