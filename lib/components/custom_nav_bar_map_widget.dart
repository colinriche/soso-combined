import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'custom_nav_bar_map_model.dart';
export 'custom_nav_bar_map_model.dart';

class CustomNavBarMapWidget extends StatefulWidget {
  const CustomNavBarMapWidget({
    Key? key,
    bool? hidden,
    int? selectedPageIndex,
  })  : this.hidden = hidden ?? false,
        this.selectedPageIndex = selectedPageIndex ?? 1,
        super(key: key);

  final bool hidden;
  final int selectedPageIndex;

  @override
  _CustomNavBarMapWidgetState createState() => _CustomNavBarMapWidgetState();
}

class _CustomNavBarMapWidgetState extends State<CustomNavBarMapWidget> {
  late CustomNavBarMapModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CustomNavBarMapModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      width: 350.0,
      height: 70.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).info,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Align(
            alignment: AlignmentDirectional(0.00, 0.00),
            child: InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                context.pushNamed('Menu-grid-less');
              },
              child: Container(
                width: 100.0,
                height: 100.0,
                decoration: BoxDecoration(),
                child: Align(
                  alignment: AlignmentDirectional(0.00, 0.00),
                  child: FaIcon(
                    FontAwesomeIcons.bars,
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    size: 35.0,
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: AlignmentDirectional(0.00, 0.00),
            child: InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                context.pushNamed('profile-visual');
              },
              child: Container(
                width: 100.0,
                height: 100.0,
                decoration: BoxDecoration(),
                child: Icon(
                  Icons.person_sharp,
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  size: 40.0,
                ),
              ),
            ),
          ),
          Align(
            alignment: AlignmentDirectional(0.00, 0.00),
            child: InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                context.pushNamed(
                  'ignore-map',
                  extra: <String, dynamic>{
                    kTransitionInfoKey: TransitionInfo(
                      hasTransition: true,
                      transitionType: PageTransitionType.fade,
                      duration: Duration(milliseconds: 0),
                    ),
                  },
                );
              },
              child: Container(
                width: 100.0,
                height: 100.0,
                decoration: BoxDecoration(),
                child: Icon(
                  Icons.add_box_sharp,
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  size: 40.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
