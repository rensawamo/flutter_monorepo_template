import 'package:core_di_provider/di_provider.dart';
import 'package:core_foundation/extension/context_extension.dart';
import 'package:core_ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:melos_template/core/foundation/extension/l10_extension.dart';
import 'package:melos_template/feature/setting/widget/setting_switch_tile.dart';

class SettingPage extends ConsumerWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final flavor = ref.read(flavorProvider);

    return Scaffold(
      appBar: CustomAppBar(
        title: context.l10n.setting,
      ),
      body: ListView(
        children: [
          // ヘッダー部分
          Container(
            padding: const EdgeInsets.all(10),
            height: context.mediaQueryHeight * .25,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: context.mediaQueryHeight * .015),
                Container(
                  padding: const EdgeInsets.all(10),
                  width: context.mediaQueryHeight * .15,
                  decoration: const BoxDecoration(),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha:0.15),
                          spreadRadius: 2,
                          blurRadius: 2,
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(
                        context.isDark
                            ? 'assets/images/icons/${flavor.name}_dark.png'
                            : 'assets/images/icons/${flavor.name}.png',
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'melos_template',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          const SettingsSwitchTile(
            icon: Icons.brightness_6,
          ),
        ],
      ),
    );
  }
}
