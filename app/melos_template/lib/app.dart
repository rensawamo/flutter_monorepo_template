import 'package:core_repository/repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:melos_template/core/designsystem/theme_data/theme_dark.dart';
import 'package:melos_template/core/designsystem/theme_data/theme_light.dart';
import 'package:melos_template/core/router/app_router.dart';
import 'package:melos_template/l10n/l10n.dart';

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeColorRepositoryProvider);
    final router = ref.watch(routerProvider);

    return MaterialApp.router(
      title: 'melos template',
      theme: themeLight(),
      darkTheme: themeDark(),
      localizationsDelegates: L10n.localizationsDelegates,
      supportedLocales: L10n.supportedLocales,
      themeMode: themeMode,
      routeInformationProvider: router.routeInformationProvider,
      routeInformationParser: router.routeInformationParser,
      routerDelegate: router.routerDelegate,
    );
  }
}
