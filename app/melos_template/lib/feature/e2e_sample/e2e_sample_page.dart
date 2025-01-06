import 'package:core_ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:melos_template/core/router/data/app_route_data.dart';
import 'package:melos_template/core/router/data/page/page_route_data.dart';

class E2ESamplePage extends StatelessWidget {
  const E2ESamplePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'E2E Sample',
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 16),
              AppActionButton(
                onPressed: () {
                  const SimulationTextFieldPageData().push<void>(context);
                },
                title: 'Simulation TextField',
              ),
              const SizedBox(height: 16),
              ElevatedButton.icon(
                onPressed: () {
                  const DescendantPageData().push<void>(context);
                },
                icon: const Icon(Icons.pages),
                label: const Text(
                  'Descendant Page',
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
            ],
          ),
        ),
      ),
    );
  }
}
