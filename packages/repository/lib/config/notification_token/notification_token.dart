import 'dart:io';

import 'package:core_di_provider/di_provider.dart';
import 'package:core_repository/config/notification_token/model/notification_token.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'notification_token.g.dart';

@riverpod
Future<NotificationTokenModel> notificationToken(
  Ref ref,
) async {
  if (kIsWeb) {
    throw UnimplementedError();
  }
  final messaging = ref.watch(firebaseMessagingProvider);
  String? apnsToken;
  if (!kIsWeb && (Platform.isIOS || Platform.isMacOS)) {
    apnsToken = await messaging.getAPNSToken();
  }
  final fcmToken = await messaging.getToken();

  return NotificationTokenModel(
    apnsToken: apnsToken,
    fcmToken: fcmToken,
  );
}
