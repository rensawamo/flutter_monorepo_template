import 'dart:async';
import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:rxdart/rxdart.dart';

part 'firebase_messaging_service.g.dart';

@riverpod
FirebaseMessagingService firebaseMessagingService(
  Ref ref,
) {
  final service = FirebaseMessagingService(FirebaseMessaging.instance);
  ref.onDispose(service.dispose);
  return service;
}

class FirebaseMessagingService {
  FirebaseMessagingService(this._firebaseMessaging) {
    _configureListeners();
  }

  final FirebaseMessaging _firebaseMessaging;

  // Subjects to handle streams of messages and token updates
  final _messageController = BehaviorSubject<RemoteMessage>();
  final _openedAppController = BehaviorSubject<RemoteMessage>();
  final _tokenController = BehaviorSubject<String>();

  bool _isConfigured = false;

  // Public streams to expose data
  Stream<RemoteMessage> get messageStream => _messageController.stream;
  Stream<RemoteMessage> get openedAppStream => _openedAppController.stream;
  Stream<String> get tokenStream => _tokenController.stream;

  Future<String?> get token => _firebaseMessaging.getToken();

  void _configureListeners() {
    if (_isConfigured) {
      return;
    }
    _isConfigured = true;

    // Listen to Firebase Messaging events
    FirebaseMessaging.onMessage.listen(_messageController.add);
    FirebaseMessaging.onMessageOpenedApp.listen(_openedAppController.add);
    _firebaseMessaging.onTokenRefresh.listen(_tokenController.add);
  }

  Future<void> requestPermission() async {
    if (Platform.isIOS) {
      await _firebaseMessaging.requestPermission();
    }
  }

  Future<void> subscribeToTopic(String topic) async {
    try {
      await _firebaseMessaging.subscribeToTopic(topic);
    } catch (e) {
      throw Exception('Failed to subscribe to topic: $topic');
    }
  }

  Future<void> unsubscribeFromTopic(String topic) async {
    try {
      await _firebaseMessaging.unsubscribeFromTopic(topic);
    } catch (e) {
      throw Exception('Failed to unsubscribe from topic: $topic');
    }
  }

  Future<void> deleteToken() async {
    try {
      await _firebaseMessaging.deleteToken();
      _tokenController.add('');
    } catch (e) {
      throw Exception('Failed to delete token');
    }
  }

  Future<void> dispose() async {
    // Close all the subjects
    await _messageController.close();
    await _openedAppController.close();
    await _tokenController.close();
  }
}
