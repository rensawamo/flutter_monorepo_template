import 'package:flutter/material.dart';

ThemeData themeLight() {
  const primary = Color.fromARGB(255, 56, 106, 31);
  const backendColor = Colors.white;

  final base = ThemeData(
    fontFamily: 'Murecho',
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: primary,
      primary: primary,
    ),
    textTheme: const TextTheme(
      bodyMedium: TextStyle(fontSize: 18),
      headlineMedium: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
    ),
    scaffoldBackgroundColor: backendColor,
  );

  return base.copyWith(
    scaffoldBackgroundColor: Colors.white,
    
   
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: {
        TargetPlatform.android: CupertinoPageTransitionsBuilder(),
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
        TargetPlatform.linux: FadeUpwardsPageTransitionsBuilder(),
        TargetPlatform.macOS: CupertinoPageTransitionsBuilder(),
        TargetPlatform.windows: FadeUpwardsPageTransitionsBuilder(),
      },
    ),
  );
}
