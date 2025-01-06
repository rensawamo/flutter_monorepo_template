import 'dart:io';

import 'package:core_di_provider/firebase/firebase_messaging_provider.dart';
import 'package:core_state/notification_token/model/notification_token.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'notification_token.g.dart';

@riverpod
Future<NotificationToken> notificationToken(
  Ref ref,
) async {
  final messaging = ref.read(firebaseMessagingProvider);
  String? apnsToken;
  if (Platform.isIOS || Platform.isMacOS) {
    apnsToken = await messaging.getAPNSToken();
  }
  final fcmToken = await messaging.getToken();

  return NotificationToken(
    apnsToken: apnsToken,
    fcmToken: fcmToken,
  );
}
