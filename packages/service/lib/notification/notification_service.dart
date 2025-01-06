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

    // Request permission
    await _requestPermission();

    // Setup message handlers
    await _setupMessageHandlers();

    // Register notification channel
    await _registerNotificationChannel();

    // Get FCM token
    final token = await firebaseMessaging.getToken();
    logger.d('FCM Token: $token');
  }

  Future<void> _requestPermission() async {
    final settings = await firebaseMessaging.requestPermission();
    logger.d('Permission status: ${settings.authorizationStatus}');
  }

  Future<void> setupFlutterNotifications() async {
    if (_isFlutterLocalNotificationsInitialized) {
      return;
    }

    // Android setup
    const channel = AndroidNotificationChannel(
      'high_importance_channel',
      'High Importance Notifications',
      description: 'This channel is used for important notifications.',
      importance: Importance.high,
    );

    await _localNotifications
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);

    const initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    // iOS setup
    final initializationSettingsDarwin = DarwinInitializationSettings(
      onDidReceiveLocalNotification: (id, title, body, payload) async {
        // Handle iOS foreground notification
      },
    );

    final initializationSettings = InitializationSettings(
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

  Future<void> showNotification(RemoteMessage message) async {
    final notification = message.notification;
    final android = message.notification?.android;
    if (notification != null && android != null) {
      await _localNotifications.show(
        notification.hashCode,
        notification.title,
        notification.body,
        const NotificationDetails(
          android: AndroidNotificationDetails(
            'high_importance_channel',
            'High Importance Notifications',
            channelDescription:
                'This channel is used for important notifications.',
            importance: Importance.high,
            priority: Priority.high,
            icon: '@mipmap/ic_launcher',
          ),
          iOS: DarwinNotificationDetails(
            presentAlert: true,
            presentBadge: true,
            presentSound: true,
          ),
        ),
        payload: message.data.toString(),
      );
    }
  }

  Future<void> _setupMessageHandlers() async {
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
    if (message.data['type'] == 'chat') {
      // open chat screen
    } else {
      // Handle other message
    }
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
    for (final channel in notificationChannels) {
      await androidNotificationPlugin.createNotificationChannel(channel);
    }
  }
}
