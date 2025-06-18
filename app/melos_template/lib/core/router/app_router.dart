import 'package:core_di_provider/di_provider.dart';
import 'package:core_foundation/foundation.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:melos_template/core/router/data/app_route_data.dart';
import 'package:melos_template/core/router/routes.dart';

final Provider<GoRouter> routerProvider = Provider((ref) {
  final shardPreferences = ref.read(sharedPreferencesWithCacheProvider);
  const key = AppSharedPreferenceKey.appIsIntroDoneKey;

  return GoRouter(
    navigatorKey: rootNavigatorKey,
    initialLocation: shardPreferences.getBool(key.name) == null
        ? Routes.introduction
        : Routes.home,
    debugLogDiagnostics: kDebugMode,
    routes: $appRoutes,
    errorPageBuilder: (context, state) => MaterialPage(
      key: state.pageKey,
      child: ErrorWidget(
        Exception('Route not found'),
      ),
    ),
    redirect: (context, state) {
      return null;
    },
  );
});
