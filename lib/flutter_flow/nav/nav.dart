import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';

import '/auth/base_auth_user_provider.dart';

import '/index.dart';
import '/main.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/lat_lng.dart';
import '/flutter_flow/place.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'serialization_util.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier? _instance;
  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();

  BaseAuthUser? initialUser;
  BaseAuthUser? user;
  bool showSplashImage = true;
  String? _redirectLocation;

  /// Determines whether the app will refresh and build again when a sign
  /// in or sign out happens. This is useful when the app is launched or
  /// on an unexpected logout. However, this must be turned off when we
  /// intend to sign in/out and then navigate or perform any actions after.
  /// Otherwise, this will trigger a refresh and interrupt the action(s).
  bool notifyOnAuthChange = true;

  bool get loading => user == null || showSplashImage;
  bool get loggedIn => user?.loggedIn ?? false;
  bool get initiallyLoggedIn => initialUser?.loggedIn ?? false;
  bool get shouldRedirect => loggedIn && _redirectLocation != null;

  String getRedirectLocation() => _redirectLocation!;
  bool hasRedirect() => _redirectLocation != null;
  void setRedirectLocationIfUnset(String loc) => _redirectLocation ??= loc;
  void clearRedirectLocation() => _redirectLocation = null;

  /// Mark as not needing to notify on a sign in / out when we intend
  /// to perform subsequent actions (such as navigation) afterwards.
  void updateNotifyOnAuthChange(bool notify) => notifyOnAuthChange = notify;

  void update(BaseAuthUser newUser) {
    final shouldUpdate =
        user?.uid == null || newUser.uid == null || user?.uid != newUser.uid;
    initialUser ??= newUser;
    user = newUser;
    // Refresh the app on auth change unless explicitly marked otherwise.
    // No need to update unless the user has changed.
    if (notifyOnAuthChange && shouldUpdate) {
      notifyListeners();
    }
    // Once again mark the notifier as needing to update on auth change
    // (in order to catch sign in / out events).
    updateNotifyOnAuthChange(true);
  }

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      errorBuilder: (context, state) =>
          appStateNotifier.loggedIn ? MenuGridLessWidget() : LoginWidget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) =>
              appStateNotifier.loggedIn ? MenuGridLessWidget() : LoginWidget(),
        ),
        FFRoute(
          name: 'HomePage-basic',
          path: '/homePageBasic',
          builder: (context, params) => HomePageBasicWidget(),
        ),
        FFRoute(
          name: 'Login',
          path: '/login',
          builder: (context, params) => LoginWidget(),
        ),
        FFRoute(
          name: 'NowLoggedOut',
          path: '/nowLoggedOut',
          requireAuth: true,
          builder: (context, params) => NowLoggedOutWidget(),
        ),
        FFRoute(
          name: 'messageOperator',
          path: '/messageOperator',
          requireAuth: true,
          builder: (context, params) => MessageOperatorWidget(),
        ),
        FFRoute(
          name: 'parkingIssue',
          path: '/parkingIssue',
          requireAuth: true,
          builder: (context, params) => ParkingIssueWidget(
            entryPage: params.getParam(
                'entryPage', ParamType.DocumentReference, false, ['messages']),
          ),
        ),
        FFRoute(
          name: 'messageHistory',
          path: '/messageHistory',
          requireAuth: true,
          builder: (context, params) => MessageHistoryWidget(),
        ),
        FFRoute(
          name: 'ignore-map',
          path: '/ignoreMap',
          requireAuth: true,
          builder: (context, params) => IgnoreMapWidget(),
        ),
        FFRoute(
          name: 'ValidateParking',
          path: '/validateParking',
          requireAuth: true,
          builder: (context, params) => ValidateParkingWidget(),
        ),
        FFRoute(
          name: 'LogParking',
          path: '/logParking',
          requireAuth: true,
          builder: (context, params) => LogParkingWidget(),
        ),
        FFRoute(
          name: 'addMembership',
          path: '/addMembership',
          requireAuth: true,
          builder: (context, params) => AddMembershipWidget(),
        ),
        FFRoute(
          name: 'Memberships',
          path: '/memberships',
          requireAuth: true,
          builder: (context, params) => MembershipsWidget(),
        ),
        FFRoute(
          name: 'SignUp',
          path: '/signUp',
          builder: (context, params) => SignUpWidget(),
        ),
        FFRoute(
          name: 'Companion',
          path: '/companion',
          requireAuth: true,
          builder: (context, params) => CompanionWidget(),
        ),
        FFRoute(
          name: 'HomePage',
          path: '/homePage',
          requireAuth: true,
          builder: (context, params) => HomePageWidget(),
        ),
        FFRoute(
          name: 'VisitHistory',
          path: '/visitHistory',
          requireAuth: true,
          builder: (context, params) => VisitHistoryWidget(),
        ),
        FFRoute(
          name: 'sentMessage',
          path: '/sentMessage',
          requireAuth: true,
          builder: (context, params) => SentMessageWidget(
            createdBy: params.getParam('createdBy', ParamType.DateTime),
            recipient: params.getParam('recipient', ParamType.String),
            message: params.getParam('message', ParamType.String),
            myEmail: params.getParam('myEmail', ParamType.String),
            licencePlate: params.getParam('licencePlate', ParamType.String),
            address: params.getParam('address', ParamType.String),
            latlang: params.getParam('latlang', ParamType.LatLng),
            outgoingMessage: params.getParam('outgoingMessage', ParamType.bool),
            withGPS: params.getParam('withGPS', ParamType.bool),
            ata: params.getParam('ata', ParamType.String),
            operator: params.getParam('operator', ParamType.String),
            messageActual: params.getParam('messageActual', ParamType.String),
          ),
        ),
        FFRoute(
          name: 'sentMessageDetail',
          path: '/sentMessageDetail',
          requireAuth: true,
          asyncParams: {
            'myMessage': getDoc(['messages'], MessagesRecord.fromSnapshot),
          },
          builder: (context, params) => SentMessageDetailWidget(
            myMessage: params.getParam('myMessage', ParamType.Document),
          ),
        ),
        FFRoute(
          name: 'ignoreList',
          path: '/ignoreList',
          requireAuth: true,
          builder: (context, params) => IgnoreListWidget(),
        ),
        FFRoute(
          name: 'ignoredList-Map',
          path: '/ignoredListMap',
          requireAuth: true,
          builder: (context, params) => IgnoredListMapWidget(),
        ),
        FFRoute(
          name: 'RecordParking',
          path: '/recordParking',
          requireAuth: true,
          builder: (context, params) => RecordParkingWidget(),
        ),
        FFRoute(
          name: 'VisitSaved',
          path: '/visitSaved',
          requireAuth: true,
          builder: (context, params) => VisitSavedWidget(
            createdBy: params.getParam('createdBy', ParamType.DateTime),
            email: params.getParam('email', ParamType.String),
            licencePlate: params.getParam('licencePlate', ParamType.String),
            address: params.getParam('address', ParamType.String),
            latlang: params.getParam('latlang', ParamType.LatLng),
            withGPS: params.getParam('withGPS', ParamType.bool),
            optionMessage: params.getParam('optionMessage', ParamType.String),
            actionMessage: params.getParam('actionMessage', ParamType.String),
            currentLocation: params.getParam('currentLocation', ParamType.bool),
          ),
        ),
        FFRoute(
          name: 'VisitDetails',
          path: '/visitDetails',
          requireAuth: true,
          asyncParams: {
            'myVisit': getDoc(['visits'], VisitsRecord.fromSnapshot),
          },
          builder: (context, params) => VisitDetailsWidget(
            myVisit: params.getParam('myVisit', ParamType.Document),
          ),
        ),
        FFRoute(
          name: 'MembershipDetails',
          path: '/membershipDetails',
          requireAuth: true,
          asyncParams: {
            'membership':
                getDoc(['memberships'], MembershipsRecord.fromSnapshot),
          },
          builder: (context, params) => MembershipDetailsWidget(
            membership: params.getParam('membership', ParamType.Document),
          ),
        ),
        FFRoute(
          name: 'messageOperator2',
          path: '/messageOperator2',
          requireAuth: true,
          builder: (context, params) => MessageOperator2Widget(
            selectLatlang: params.getParam('selectLatlang', ParamType.LatLng),
            selectOperator: params.getParam('selectOperator', ParamType.String),
            selectMessage: params.getParam('selectMessage', ParamType.String),
            selectOperatorId:
                params.getParam('selectOperatorId', ParamType.int),
            selectMessageId: params.getParam('selectMessageId', ParamType.int),
          ),
        ),
        FFRoute(
          name: 'RecordParking2',
          path: '/recordParking2',
          requireAuth: true,
          builder: (context, params) => RecordParking2Widget(
            selectLatlang: params.getParam('selectLatlang', ParamType.LatLng),
            selectAction: params.getParam('selectAction', ParamType.String),
            selectOption: params.getParam('selectOption', ParamType.String),
            selectActionID: params.getParam('selectActionID', ParamType.int),
            selectOptionID: params.getParam('selectOptionID', ParamType.int),
          ),
        ),
        FFRoute(
          name: 'LoginCopy',
          path: '/loginCopy',
          builder: (context, params) => LoginCopyWidget(),
        ),
        FFRoute(
          name: 'DrivingSpeedo',
          path: '/drivingSpeedo',
          requireAuth: true,
          builder: (context, params) => DrivingSpeedoWidget(),
        ),
        FFRoute(
          name: 'Setup-slide',
          path: '/setupSlide',
          requireAuth: true,
          builder: (context, params) => SetupSlideWidget(),
        ),
        FFRoute(
          name: 'Settings-visual',
          path: '/settingsVisual',
          requireAuth: true,
          builder: (context, params) => SettingsVisualWidget(),
        ),
        FFRoute(
          name: 'Driving',
          path: '/driving',
          requireAuth: true,
          builder: (context, params) => DrivingWidget(),
        ),
        FFRoute(
          name: 'profile-visual',
          path: '/profileVisual',
          requireAuth: true,
          builder: (context, params) => ProfileVisualWidget(),
        ),
        FFRoute(
          name: 'Menu-grid',
          path: '/menuGrid',
          requireAuth: true,
          builder: (context, params) => MenuGridWidget(),
        ),
        FFRoute(
          name: 'Menu-grid-message',
          path: '/menuGridMessage',
          requireAuth: true,
          builder: (context, params) => MenuGridMessageWidget(),
        ),
        FFRoute(
          name: 'Menu-grid-less',
          path: '/menuGridLess',
          requireAuth: true,
          builder: (context, params) => MenuGridLessWidget(),
        ),
        FFRoute(
          name: 'MembershipDetailsCopy',
          path: '/membershipDetailsCopy',
          requireAuth: true,
          asyncParams: {
            'membership':
                getDoc(['memberships'], MembershipsRecord.fromSnapshot),
          },
          builder: (context, params) => MembershipDetailsCopyWidget(
            membership: params.getParam('membership', ParamType.Document),
          ),
        ),
        FFRoute(
          name: 'SelectVehicle2',
          path: '/selectVehicle2',
          requireAuth: true,
          builder: (context, params) => SelectVehicle2Widget(),
        ),
        FFRoute(
          name: 'profile',
          path: '/profile',
          requireAuth: true,
          builder: (context, params) => ProfileWidget(),
        ),
        FFRoute(
          name: 'testList',
          path: '/testList',
          requireAuth: true,
          builder: (context, params) => TestListWidget(),
        ),
        FFRoute(
          name: 'SetupVertical',
          path: '/setupVertical',
          requireAuth: true,
          builder: (context, params) => SetupVerticalWidget(),
        ),
        FFRoute(
          name: 'DrivingCopy',
          path: '/drivingCopy',
          requireAuth: true,
          builder: (context, params) => DrivingCopyWidget(),
        ),
        FFRoute(
          name: 'Setup-Expandable',
          path: '/setupExpandable',
          requireAuth: true,
          builder: (context, params) => SetupExpandableWidget(),
        ),
        FFRoute(
          name: 'profile-nobackbutton',
          path: '/profileNobackbutton',
          requireAuth: true,
          builder: (context, params) => ProfileNobackbuttonWidget(),
        ),
        FFRoute(
          name: 'Setup',
          path: '/setup',
          requireAuth: true,
          builder: (context, params) => SetupWidget(),
        ),
        FFRoute(
          name: 'SetupCopy',
          path: '/setupCopy',
          requireAuth: true,
          builder: (context, params) => SetupCopyWidget(),
        ),
        FFRoute(
          name: 'Setup-profile',
          path: '/setupProfile',
          requireAuth: true,
          builder: (context, params) => SetupProfileWidget(
            v1: params.getParam('v1', ParamType.String),
            v1n: params.getParam('v1n', ParamType.String),
            v2: params.getParam('v2', ParamType.String),
            v2n: params.getParam('v2n', ParamType.String),
          ),
        )
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void goNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : goNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void pushNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : pushNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void safePop() {
    // If there is only one route on the stack, navigate to the initial
    // page instead of popping.
    if (canPop()) {
      pop();
    } else {
      go('/');
    }
  }
}

extension GoRouterExtensions on GoRouter {
  AppStateNotifier get appState => AppStateNotifier.instance;
  void prepareAuthEvent([bool ignoreRedirect = false]) =>
      appState.hasRedirect() && !ignoreRedirect
          ? null
          : appState.updateNotifyOnAuthChange(false);
  bool shouldRedirect(bool ignoreRedirect) =>
      !ignoreRedirect && appState.hasRedirect();
  void clearRedirectLocation() => appState.clearRedirectLocation();
  void setRedirectLocationIfUnset(String location) =>
      appState.updateNotifyOnAuthChange(false);
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(pathParameters)
    ..addAll(queryParameters)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.extraMap.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, [
    bool isList = false,
    List<String>? collectionNamePath,
  ]) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(param, type, isList,
        collectionNamePath: collectionNamePath);
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        redirect: (context, state) {
          if (appStateNotifier.shouldRedirect) {
            final redirectLocation = appStateNotifier.getRedirectLocation();
            appStateNotifier.clearRedirectLocation();
            return redirectLocation;
          }

          if (requireAuth && !appStateNotifier.loggedIn) {
            appStateNotifier.setRedirectLocationIfUnset(state.location);
            return '/login';
          }
          return null;
        },
        pageBuilder: (context, state) {
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = appStateNotifier.loading
              ? Center(
                  child: SizedBox(
                    width: 50.0,
                    height: 50.0,
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                        FlutterFlowTheme.of(context).primary,
                      ),
                    ),
                  ),
                )
              : page;

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder: PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).transitionsBuilder,
                )
              : MaterialPage(key: state.pageKey, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => TransitionInfo(hasTransition: false);
}

class RootPageContext {
  const RootPageContext(this.isRootPage, [this.errorRoute]);
  final bool isRootPage;
  final String? errorRoute;

  static bool isInactiveRootPage(BuildContext context) {
    final rootPageContext = context.read<RootPageContext?>();
    final isRootPage = rootPageContext?.isRootPage ?? false;
    final location = GoRouter.of(context).location;
    return isRootPage &&
        location != '/' &&
        location != rootPageContext?.errorRoute;
  }

  static Widget wrap(Widget child, {String? errorRoute}) => Provider.value(
        value: RootPageContext(true, errorRoute),
        child: child,
      );
}
