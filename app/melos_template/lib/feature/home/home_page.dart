import 'package:core_ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:melos_template/core/router/data/app_route_data.dart';
import 'package:melos_template/core/router/data/e2e_sample/e2e_sample_route_data.dart';
import 'package:melos_template/core/router/data/setting/setting_route_data.dart';
import 'package:melos_template/core/router/data/weature/weature_route_data.dart';

/// ホームページウィジェット
class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Home',
        hasBackButton: false,
        rightWidget: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              const SettingPageData().push<void>(context);
            },
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Welcome to the App!',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton.icon(
                onPressed: () {
                  const E2ESamplePageData().push<void>(context);
                },
                icon: const Icon(
                  Icons.star,
                  color: Colors.yellow,
                  size: 24,
                ),
                label: const Text(
                  'E2E Sample',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    vertical: 14,
                    horizontal: 20,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton.icon(
                onPressed: () {
                  const WeatherRouteData().push<void>(context);
                },
                icon: const Icon(
                  Icons.wb_sunny,
                  color: Colors.orange,
                  size: 24,
                ),
                label: const Text(
                  'Get Weather Info (REST API)',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    vertical: 14,
                    horizontal: 20,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
