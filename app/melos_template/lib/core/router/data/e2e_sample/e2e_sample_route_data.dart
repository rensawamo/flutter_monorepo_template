import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:melos_template/feature/e2e_sample/e2e_sample_page.dart';

class E2ESamplePageData extends GoRouteData {
  const E2ESamplePageData();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const E2ESamplePage();
  }
}
