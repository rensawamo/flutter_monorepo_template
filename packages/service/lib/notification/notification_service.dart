import 'dart:async';

import 'package:core_utility/utility.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await NotificationService.instance.setupFlutterNotifications();
  await NotificationService.instance.showNotification(message);
}

class NotificationService {
  NotificationService._({
    required this.firebaseMessaging,
    this.notificationChannelGroups = const [],
    this.notificationChannels = const [],
  });

  final FirebaseMessaging firebaseMessaging;
  final List<AndroidNotificationChannelGroup> notificationChannelGroups;
  final List<AndroidNotificationChannel> notificationChannels;

  static late NotificationService instance;

  final _localNotifications = FlutterLocalNotificationsPlugin();
  var _isFlutterLocalNotificationsInitialized = false;

  static void createInstance(
    FirebaseMessaging messaging, {
    List<AndroidNotificationChannelGroup> notificationChannelGroups = const [],
    List<AndroidNotificationChannel> notificationChannels = const [],
  }) {
    instance = NotificationService._(
      firebaseMessaging: messaging,
      notificationChannelGroups: notificationChannelGroups,
      notificationChannels: notificationChannels,
    );
  }

  Future<void> initialize() async {
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
    await _requestPermission();
    await _setupMessageHandlers();
    await _registerNotificationChannel();

    // Get FCM token
    final token = await firebaseMessaging.getToken();

    logger.d('FCM Token: $token');
  }

  Future<void> _requestPermission() async {
    final settings = await firebaseMessaging.requestPermission();
    await firebaseMessaging.setForegroundNotificationPresentationOptions(
      alert: true,
      sound: true,
      badge: true,
    );
    logger.d('Permission status: ${settings.authorizationStatus}');
  }

  Future<void> setupFlutterNotifications() async {
    if (_isFlutterLocalNotificationsInitialized) {
      return;
    }

    const initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    // iOS setup
    const initializationSettingsDarwin = DarwinInitializationSettings(
      requestAlertPermission: false,
      requestSoundPermission: false,
      requestBadgePermission: false,
    );

    const initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsDarwin,
    );

    // Flutter notification setup
    await _localNotifications.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (details) {},
    );

    _isFlutterLocalNotificationsInitialized = true;
  }

  NotificationDetails _getNotificationDetails({
    required String? channelId,
    required String? channelName,
    String? channelDescription,
  }) {
    return NotificationDetails(
      android: AndroidNotificationDetails(
        channelId ?? 'default_channel',
        channelName ?? 'default_notification',
        channelDescription: channelDescription ?? 'Default channel description',
        icon: '@mipmap/ic_launcher',
      ),
      iOS: const DarwinNotificationDetails(
        presentAlert: true,
        presentBadge: true,
        presentSound: true,
      ),
    );
  }

  // remoto Message is the message received from FCM
  Future<void> showNotification(
    RemoteMessage message, {
    String? channelId,
    String? channelName,
    String? channelDescription,
  }) async {
    final notification = message.notification;
    if (message.data['channel_id'] is String) {
      channelId = message.data['channel_id'] as String;
    }
    if (message.data['channel_name'] is String) {
      channelName = message.data['channel_name'] as String;
    }
    if (notification != null) {
      await _localNotifications.show(
        notification.hashCode,
        notification.title,
        notification.body,
        _getNotificationDetails(
          channelId: channelId,
          channelName: channelName,
        ),
        payload: message.data.toString(),
      );
    }
  }

  // Local notification
  Future<void> showLocalNotification({
    int id = 0,
    String? title,
    String? body,
    String? payload,
    String? channelId,
    String? channelName,
  }) async {
    await _localNotifications.show(
      id,
      title,
      body,
      _getNotificationDetails(
        channelId: channelId,
        channelName: channelName,
      ),
      payload: payload,
    );
  }

  Future<void> _setupMessageHandlers() async {
    // FCM Token Refresh
    FirebaseMessaging.instance.onTokenRefresh.listen((token) {
      logger.w('fcmToken Refresh: $token');
    }).onError((dynamic error) {
      logger.e('onError: $error');
    });
    // Foreground message
    FirebaseMessaging.onMessage.listen(showNotification);

    // Background message
    FirebaseMessaging.onMessageOpenedApp.listen(_handleBackgroundMessage);

    // Opened app
    final initialMessage = await firebaseMessaging.getInitialMessage();
    if (initialMessage != null) {
      _handleBackgroundMessage(initialMessage);
    }
  }

  void _handleBackgroundMessage(RemoteMessage message) {
    logger.d('Handling background message: $message');
  }

  Future<void> _registerNotificationChannel() async {
    final androidNotificationPlugin =
        _localNotifications.resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>();
    if (androidNotificationPlugin == null) {
      return;
    }
    for (final group in notificationChannelGroups) {
      await androidNotificationPlugin.createNotificationChannelGroup(group);
    }
    const channel = AndroidNotificationChannel(
      'default_channel',
      'default_notification',
    );
    await androidNotificationPlugin.createNotificationChannel(channel);
    for (final channel in notificationChannels) {
      await androidNotificationPlugin.createNotificationChannel(channel);
    }
  }
}
