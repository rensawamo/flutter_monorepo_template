import 'package:core_utility/utility.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';

enum AppTransitionType {
  push,
  pop,
  replace,
  remove,
  startUserGesture,
  stopUserGesture,
}

class TransitionObserver extends NavigatorObserver {
  static FirebaseAnalytics analytics = FirebaseAnalytics.instance;
  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPush(route, previousRoute);
    _onTransition(route, previousRoute, AppTransitionType.push);
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPop(route, previousRoute);
    _onTransition(route, previousRoute, AppTransitionType.pop);
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
    if (newRoute != null) {
      _onTransition(newRoute, oldRoute, AppTransitionType.replace);
    }
  }

  @override
  void didRemove(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didRemove(route, previousRoute);
    _onTransition(route, previousRoute, AppTransitionType.remove);
  }

  @override
  void didStartUserGesture(
    Route<dynamic> route,
    Route<dynamic>? previousRoute,
  ) {
    super.didStartUserGesture(route, previousRoute);
    _onTransition(route, previousRoute, AppTransitionType.startUserGesture);
  }

  void _onTransition(
    Route<dynamic> route,
    Route<dynamic>? previousRoute,
    AppTransitionType transitionType,
  ) {
    final pageName = route.settings.name ?? 'unknown';
    logger.d('pageName: $pageName, ${transitionType.name}');
    analytics.logEvent(
      name: 'page_transition',
      parameters: {
        'page_name': pageName,
        'transition_type': transitionType.name,
      },
    );
  }
}
