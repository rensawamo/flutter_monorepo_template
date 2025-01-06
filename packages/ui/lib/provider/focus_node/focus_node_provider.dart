import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'focus_node_provider.g.dart';

@riverpod
class FocusNodeController extends _$FocusNodeController {
  @override
  FocusNode build() {
    final controller = FocusNode();
    ref.onDispose(controller.dispose);
    return controller;
  }
}
