import 'package:core_utility/utility.dart';
import 'package:flutter/material.dart';

class AppErrorInfoWidget extends StatelessWidget {
  const AppErrorInfoWidget({
    required this.error,
    this.onRefresh,
    super.key,
    this.label = 'Retry',
    this.icon = Icons.refresh,
    this.iconColor = Colors.grey,
    this.labelColor = Colors.grey,
  });

  final Object error;
  final void Function()? onRefresh;
  final String label;
  final IconData icon;
  final Color iconColor;
  final Color labelColor;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: () async {
            logger.d('AppErrorInfoWidget: onTap');
            if (onRefresh != null) {
              onRefresh?.call();
            }
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.transparent,
              border: Border.all(color: iconColor, width: 1.5),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  icon,
                  color: iconColor,
                ),
                Text(
                  label,
                  style: TextStyle(
                    color: labelColor,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
