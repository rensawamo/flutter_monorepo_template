import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:melos_template/feature/weature/ui/page/weather.dart';

class WeatherRouteData extends GoRouteData {
  const WeatherRouteData();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const WeatherPage();
  }
}
