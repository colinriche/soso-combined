import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/custom_nav_bar_member_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'memberships_model.dart';
export 'memberships_model.dart';

class MembershipsWidget extends StatefulWidget {
  const MembershipsWidget({Key? key}) : super(key: key);

  @override
  _MembershipsWidgetState createState() => _MembershipsWidgetState();
}

class _MembershipsWidgetState extends State<MembershipsWidget> {
  late MembershipsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MembershipsModel());

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

    return StreamBuilder<List<MembershipsRecord>>(
      stream: queryMembershipsRecord(
        queryBuilder: (membershipsRecord) => membershipsRecord
            .where(
              'user_ref',
              isEqualTo: currentUserReference,
            )
            .where(
              'removed_flag',
              isEqualTo: false,
            ),
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
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
        List<MembershipsRecord> membershipsMembershipsRecordList =
            snapshot.data!;
        return Title(
            title: 'Memberships',
            color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
            child: Scaffold(
              key: scaffoldKey,
              backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
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
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Align(
                              alignment: AlignmentDirectional(0.00, -1.00),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 20.0, 0.0, 0.0),
                                child: Text(
                                  'Memberships',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        fontSize: 22.0,
                                      ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 12.0, 0.0, 0.0),
                              child: Text(
                                'Most Recent',
                                style: FlutterFlowTheme.of(context).labelMedium,
                              ),
                            ),
                            Builder(
                              builder: (context) {
                                final closed = membershipsMembershipsRecordList
                                    .map((e) => e.hasRemovedFlag())
                                    .toList();
                                return ListView.builder(
                                  padding: EdgeInsets.zero,
                                  primary: false,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  itemCount: closed.length,
                                  itemBuilder: (context, closedIndex) {
                                    final closedItem = closed[closedIndex];
                                    return Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 12.0, 0.0, 1.0),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          context.pushNamed(
                                            'MembershipDetailsCopy',
                                            queryParameters: {
                                              'membership': serializeParam(
                                                membershipsMembershipsRecordList
                                                    .where(
                                                        (e) => e.hasUserRef())
                                                    .toList()[closedIndex],
                                                ParamType.Document,
                                              ),
                                            }.withoutNulls,
                                            extra: <String, dynamic>{
                                              'membership':
                                                  membershipsMembershipsRecordList
                                                      .where(
                                                          (e) => e.hasUserRef())
                                                      .toList()[closedIndex],
                                            },
                                          );
                                        },
                                        child: Container(
                                          width: double.infinity,
                                          height: 60.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            boxShadow: [
                                              BoxShadow(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                offset: Offset(0.0, 1.0),
                                              )
                                            ],
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    5.0, 5.0, 0.0, 5.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Flexible(
                                                  child: Container(
                                                    width: 40.0,
                                                    height: 40.0,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                    ),
                                                    child: Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.00, 0.00),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    5.0,
                                                                    0.0),
                                                        child: InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            await membershipsMembershipsRecordList
                                                                .where((e) =>
                                                                    closedItem)
                                                                .toList()[
                                                                    closedIndex]
                                                                .reference
                                                                .update(
                                                                    createMembershipsRecordData(
                                                                  removedFlag:
                                                                      true,
                                                                  dateRemoved:
                                                                      getCurrentTimestamp,
                                                                  removedBy:
                                                                      currentUserEmail,
                                                                ));
                                                            if (FFAppState().memberRepeatCheck.contains(membershipsMembershipsRecordList
                                                                    .where((e) => e
                                                                        .hasOrganiser())
                                                                    .toList()[
                                                                        closedIndex]
                                                                    .organiserId
                                                                    .toString()) ==
                                                                true) {
                                                              setState(() {
                                                                FFAppState().removeFromMemberRepeatCheck(membershipsMembershipsRecordList
                                                                    .where((e) =>
                                                                        e !=
                                                                        null)
                                                                    .toList()[
                                                                        closedIndex]
                                                                    .organiserId
                                                                    .toString());
                                                              });
                                                            }
                                                            ScaffoldMessenger
                                                                    .of(context)
                                                                .showSnackBar(
                                                              SnackBar(
                                                                content: Text(
                                                                  'Removed',
                                                                  style:
                                                                      TextStyle(
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
                                                          },
                                                          child: AutoSizeText(
                                                            'X',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .titleLarge
                                                                .override(
                                                                  fontFamily:
                                                                      'Outfit',
                                                                  color: Color(
                                                                      0xFFE11A1A),
                                                                  fontSize:
                                                                      24.0,
                                                                ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      membershipsMembershipsRecordList
                                                          .where(
                                                              (e) => closedItem)
                                                          .toList()[closedIndex]
                                                          .organiser,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyLarge,
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  5.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Text(
                                                        membershipsMembershipsRecordList
                                                            .where((e) =>
                                                                closedItem)
                                                            .toList()[
                                                                closedIndex]
                                                            .memberNumber,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Text(
                                                  valueOrDefault<String>(
                                                    dateTimeFormat(
                                                        'd/M',
                                                        membershipsMembershipsRecordList
                                                            .where((e) =>
                                                                closedItem)
                                                            .toList()[
                                                                closedIndex]
                                                            .dateAdded),
                                                    '???',
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyLarge
                                                      .override(
                                                        fontFamily:
                                                            'Readex Pro',
                                                        fontSize: 10.0,
                                                      ),
                                                ),
                                                if (closedItem == true)
                                                  Text(
                                                    membershipsMembershipsRecordList
                                                            .where((e) =>
                                                                closedItem)
                                                            .toList()[
                                                                closedIndex]
                                                            .removedFlag
                                                        ? true.toString()
                                                        : 'No',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyLarge
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          fontSize: 10.0,
                                                        ),
                                                  ),
                                              ],
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
                      model: _model.customNavBarMemberModel,
                      updateCallback: () => setState(() {}),
                      child: CustomNavBarMemberWidget(
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
