import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:melos_template/feature/e2e_sample/pages/descendant_page.dart';
import 'package:melos_template/feature/e2e_sample/pages/simulation_text_field_page.dart';

class DescendantPageData extends GoRouteData {
  const DescendantPageData();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const DescendantPage();
  }
}

class SimulationTextFieldPageData extends GoRouteData {
  const SimulationTextFieldPageData();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const SimulationTextFieldPage();
  }
}
