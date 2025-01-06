import 'package:flutter/material.dart';

class AppDataNotAvailableWidget extends StatelessWidget {
  const AppDataNotAvailableWidget({
    super.key,
    this.message = 'Data not available',
  });
  final String message;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Text(
          message,
          style: const TextStyle(
            fontSize: 18,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
