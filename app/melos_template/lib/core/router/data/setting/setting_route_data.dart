import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:melos_template/feature/setting/setting_page.dart';

class SettingPageData extends GoRouteData {
  const SettingPageData();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const SettingPage();
  }
}
