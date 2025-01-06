import 'package:flutter/material.dart';

class AppActionButton extends StatelessWidget {
  const AppActionButton({
    required this.onPressed,
    required this.title,
    this.padding = const EdgeInsets.symmetric(vertical: 16),
    this.accentColor,
    this.pressedColor,
    this.textColor,
    this.maxWidth = 250,
    super.key,
  });

  final void Function() onPressed;
  final String title;
  final EdgeInsets padding;
  final Color? accentColor;
  final Color? pressedColor;
  final Color? textColor;
  final double maxWidth;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      constraints: BoxConstraints(maxWidth: maxWidth),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 4,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Material(
          color: accentColor ?? theme.colorScheme.surfaceContainer,
          child: InkWell(
            onTap: onPressed,
            splashColor:
                pressedColor ?? theme.colorScheme.secondary.withOpacity(0.2),
            highlightColor: pressedColor?.withOpacity(0.4) ??
                theme.colorScheme.primary.withOpacity(0.1),
            child: Padding(
              padding: padding,
              child: Center(
                child: Text(
                  title,
                  style: TextStyle(
                    color: textColor ?? theme.colorScheme.primary,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
