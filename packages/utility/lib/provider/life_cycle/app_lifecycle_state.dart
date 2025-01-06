import 'package:flutter/widgets.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_lifecycle_state.g.dart';

@Riverpod(keepAlive: true)
// ignore: deprecated_member_use_from_same_package
AppLifecycleState appLifecycleState(AppLifecycleStateRef ref) {
  final observer = _AppLifecycleObserver((value) => ref.state = value);

  final binding = WidgetsBinding.instance..addObserver(observer);
  ref.onDispose(() => binding.removeObserver(observer));

  return AppLifecycleState.resumed;
}

class _AppLifecycleObserver extends WidgetsBindingObserver {
  _AppLifecycleObserver(this._didChangeState);

  final ValueChanged<AppLifecycleState> _didChangeState;

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    _didChangeState(state);
    super.didChangeAppLifecycleState(state);
  }
}
