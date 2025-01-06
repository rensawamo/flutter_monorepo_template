import 'dart:developer';

import 'package:app_settings/app_settings.dart';
import 'package:core_di_provider/di_provider.dart';
import 'package:core_repository/config/permission/model/permission_state.dart';
import 'package:core_utility/provider/life_cycle/app_lifecycle_state.dart';
import 'package:core_utility/utility.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'permission_notifier.g.dart';

@riverpod
class PermissionNotifier extends _$PermissionNotifier {
  @override
  PermissionStateModel build() {
    ref.listen(appLifecycleStateProvider, (_, next) {
      if (next == AppLifecycleState.resumed) {
        initialize();
      }
    });
    return const PermissionStateModel();
  }

  Future<void> initialize() async {
    final notificationPermission =
        await ref.read(firebaseMessagingProvider).getNotificationSettings();
    await ref
        .read(firebaseMessagingProvider)
        .setForegroundNotificationPresentationOptions(
          alert: true,
          badge: true,
        );
    state = PermissionStateModel(
      notification: switch (notificationPermission.authorizationStatus) {
        AuthorizationStatus.authorized ||
        AuthorizationStatus.provisional =>
          true,
        _ => false,
      },
    );
  }

  Future<bool> notificationPermission() async {
    final status = await Permission.notification.status;
    return status == PermissionStatus.granted;
  }

  Future<void> requestNotificationPermission() async {
    final result = await ref.read(firebaseMessagingProvider).requestPermission(
          announcement: true,
          criticalAlert: true,
          carPlay: true,
        );
    if (result.authorizationStatus == AuthorizationStatus.denied) {
      await AppSettings.openAppSettings(type: AppSettingsType.notification);
    }
    await initialize();
  }

  Future<void> requestLocationWhenInUsePermission() async {
    final status = await Permission.locationWhenInUse.request();
    logger.d(
      'Permission requested: locationWhenInUse, status: $status',
    );
    if (status == PermissionStatus.permanentlyDenied) {
      await AppSettings.openAppSettings(type: AppSettingsType.location);
    }
    ref.invalidateSelf();
  }

  Future<void> requestLocationAlwaysPermission() async {
    final status = await Permission.locationAlways.request();
    log(
      'Permission requested: locationAlways, status: $status',
      name: 'PermissionNotifier',
    );
    if (status == PermissionStatus.permanentlyDenied) {
      await AppSettings.openAppSettings(type: AppSettingsType.location);
    }

    ref.invalidateSelf();
  }
}
