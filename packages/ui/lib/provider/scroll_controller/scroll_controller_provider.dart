import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'scroll_controller_provider.g.dart';

@riverpod
class ScrollBarController extends _$ScrollBarController {
  @override
  ScrollController build() {
    final controller = ScrollController();
    ref.onDispose(controller.dispose);
    return controller;
  }
}
