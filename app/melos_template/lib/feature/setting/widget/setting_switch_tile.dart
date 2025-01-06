import 'package:core_foundation/extension/context_extension.dart';
import 'package:core_state/theme_color/theme_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:melos_template/core/foundation/extension/l10_extension.dart';

class SettingsSwitchTile extends ConsumerStatefulWidget {
  const SettingsSwitchTile({
    required this.icon,
    super.key,
  });
  final IconData icon;
  @override
  SettingsSwitchTileState createState() => SettingsSwitchTileState();
}

class SettingsSwitchTileState extends ConsumerState<SettingsSwitchTile> {
  @override
  Widget build(BuildContext context) {
    final themeColorNotifier = ref.read(themeColorNotifierProvider.notifier);

    return ListTile(
      contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      leading: Icon(widget.icon),
      title: Text(context.l10n.darkmode),
      trailing: Switch(
        autofocus: true,
        activeColor: Colors.green,
        value: context.isDark,
        onChanged: (bool newValue) {
          themeColorNotifier.setTheme(
            newValue ? ThemeMode.dark : ThemeMode.light,
          );
        },
      ),
    );
  }
}
