import 'package:app_settings/app_settings.dart';
import 'package:core_di_provider/firebase/firebase_messaging_provider.dart';
import 'package:core_state/permission/model/permission_state.dart';
import 'package:core_utility/provider/life_cycle/app_lifecycle_state.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'permission.g.dart';

@Riverpod(keepAlive: true)
class PermissionNotifier extends _$PermissionNotifier {
  @override
  PermissionState build() {
    // ライフサイクルを監視
    // 設定アプリを開いて、戻ってきたときに状態を更新する
    ref.listen(appLifeCycleStateProvider, (_, next) {
      if (next == AppLifecycleState.resumed) {
        initState();
      }
    });

    return const PermissionState();
  }

  // 最初の画面で実行して、keep aliveで残しておく
  Future<void> initState() async {
    final notificationPermission =
        await ref.read(firebaseMessagingProvider).getNotificationSettings();

    state = PermissionState(
      notification: switch (notificationPermission.authorizationStatus) {
        AuthorizationStatus.authorized ||
        AuthorizationStatus.provisional =>
          true,
        _ => false,
      },
      camera: await Permission.camera.status == PermissionStatus.granted,
    );
  }

  // 通知
  Future<void> requestNotificationPermission() async {
    final result =
        await ref.read(firebaseMessagingProvider).requestPermission();
    if (result.authorizationStatus == AuthorizationStatus.denied) {
      await AppSettings.openAppSettings(type: AppSettingsType.notification);
    }
    ref.invalidateSelf();
  }

  // カメラ
  Future<void> requestCameraPermission() async {
    await AppSettings.openAppSettings();
    ref.invalidateSelf();
  }
}
