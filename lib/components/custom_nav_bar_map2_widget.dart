import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'custom_nav_bar_map2_model.dart';
export 'custom_nav_bar_map2_model.dart';

class CustomNavBarMap2Widget extends StatefulWidget {
  const CustomNavBarMap2Widget({
    Key? key,
    bool? hidden,
    int? selectedPageIndex,
  })  : this.hidden = hidden ?? false,
        this.selectedPageIndex = selectedPageIndex ?? 1,
        super(key: key);

  final bool hidden;
  final int selectedPageIndex;

  @override
  _CustomNavBarMap2WidgetState createState() => _CustomNavBarMap2WidgetState();
}

class _CustomNavBarMap2WidgetState extends State<CustomNavBarMap2Widget> {
  late CustomNavBarMap2Model _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CustomNavBarMap2Model());

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
                    color: FlutterFlowTheme.of(context).info,
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
                context.pushNamed('ignoredList-Map');
              },
              child: Container(
                width: 100.0,
                height: 100.0,
                decoration: BoxDecoration(),
                child: Align(
                  alignment: AlignmentDirectional(0.00, 0.00),
                  child: Icon(
                    Icons.wrong_location_sharp,
                    color: Color(0xFFFF0000),
                    size: 40.0,
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
                  Icons.add_location_alt,
                  color: FlutterFlowTheme.of(context).warning,
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
