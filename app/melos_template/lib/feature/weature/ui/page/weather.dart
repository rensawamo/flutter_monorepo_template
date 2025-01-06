import 'package:core_foundation/extension/context_extension.dart';
import 'package:core_ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:melos_template/core/foundation/extension/l10_extension.dart';
import 'package:melos_template/feature/weature/notifier/weather_notifier.dart';
import 'package:melos_template/feature/weature/ui/component/weather_detail.dart';

class WeatherPage extends ConsumerStatefulWidget {
  const WeatherPage({super.key});

  @override
  ConsumerState<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends ConsumerState<WeatherPage> {
  late TextEditingController textController;

  @override
  void initState() {
    super.initState();

    textController = TextEditingController();
    textController.text = 'Tokyo';
  }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final asyncValue = ref.watch(weatherNotifierProvider(textController.text));

    return GestureDetector(
      onTap: () {
        context.hideKeyboard();
      },
      child: Scaffold(
        appBar: CustomAppBar(
          title: context.l10n.weather,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  controller: textController,
                  decoration: InputDecoration(
                    labelText: 'Enter city',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                ElevatedButton.icon(
                  onPressed: () async {
                    ref.invalidate(weatherNotifierProvider);
                  },
                  icon: const Icon(Icons.search, color: Colors.white),
                  label: const Text(
                    'Search',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      vertical: 12,
                      horizontal: 24,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                    elevation: 5,
                  ),
                ),
                const SizedBox(height: 20),
                Builder(
                  builder: (context) {
                    switch (asyncValue) {
                      case AsyncData(:final value):
                        if (value.weatherData == null) {
                          return const Center(
                            child: Text('No data available'),
                          );
                        }
                        return WeatherDetails(state: value);
                      case AsyncError(:final error):
                        return AppErrorInfoWidget(
                          error: error,
                          onRefresh: () =>
                              ref.invalidate(weatherNotifierProvider),
                        );
                      case _:
                        return const Center(
                          child: AppCircleIndicator(),
                        );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
