import 'dart:async';

import 'package:core_di_provider/di_provider.dart';
import 'package:core_service/service.dart';
import 'package:core_utility/utility.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:melos_template/app.dart';
import 'package:melos_template/core/fcm/group_channels.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  // notification
  NotificationService.createInstance(
    FirebaseMessaging.instance,
    notificationChannelGroups: notificationChannelGroups,
    notificationChannels: notificationChannels,
  );
  await NotificationService.instance.initialize();

  if (!kIsWeb) {
    unawaited(
      FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(!kDebugMode),
    );
  }

  await dotenv.load();

  PlatformDispatcher.instance.onError = (error, stack) {
    FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    return true;
  };

  /// for di_provider
  final sharedPreferences = await SharedPreferences.getInstance();
  final packageInfo = await PackageInfo.fromPlatform();
  final flavor = Flavor.values.byName(const String.fromEnvironment('flavor'));
  logger.d('flavor: ${flavor.name}');

  runApp(
    ProviderScope(
      overrides: [
        flavorProvider.overrideWithValue(flavor),
        packageInfoProvider.overrideWithValue(packageInfo),
        sharedPreferencesProvider.overrideWithValue(sharedPreferences),
        firebaseMessagingProvider.overrideWithValue(FirebaseMessaging.instance),
        firebaseCrashlyticsProvider
            .overrideWithValue(FirebaseCrashlytics.instance),
      ],
      observers: const [ProviderLogger()],
      child: const App(),
    ),
  );
}
