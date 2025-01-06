import 'package:flutter/widgets.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_lifecycle_state.g.dart';

@Riverpod(keepAlive: true)
class AppLifeCycleState extends _$AppLifeCycleState {
  @override
  AppLifecycleState build() {
    final appLifecycleListener = AppLifecycleListener(
      onStateChange: (appLifecycleState) {
        state = appLifecycleState;
      },
    );
    ref.onDispose(appLifecycleListener.dispose);
    return AppLifecycleState.resumed;
  }
}
