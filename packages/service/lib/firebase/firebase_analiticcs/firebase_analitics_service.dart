import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'firebase_analitics_service.g.dart';

@riverpod
FirebaseAnalyticsService firebaseAnalyticsService(
  Ref ref,
) {
  return FirebaseAnalyticsService(FirebaseAnalytics.instance);
}

class FirebaseAnalyticsService {
  FirebaseAnalyticsService(this._firebaseAnalytics);
  final FirebaseAnalytics _firebaseAnalytics;

  Future<void> logEvent({
    required String name,
    Map<String, Object>? parameters,
  }) async {
    await _firebaseAnalytics.logEvent(
      name: name,
      parameters: parameters,
    );
  }

  Future<void> logKeyEvent({
    required String name,
    Map<String, Object>? parameters,
  }) async {
    await _firebaseAnalytics.logEvent(
      name: name,
      parameters: parameters,
    );
  }

  Future<void> setUserId(String userId) async {
    await _firebaseAnalytics.setUserId(id: userId);
  }

  Future<void> setUserProperty({
    required String name,
    required String value,
  }) async {
    await _firebaseAnalytics.setUserProperty(
      name: name,
      value: value,
    );
  }
}
