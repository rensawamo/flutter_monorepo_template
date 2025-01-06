import 'package:flutter/material.dart';

class DetailList extends StatelessWidget {
  const DetailList({
    required this.humidity,
    required this.pressure,
    super.key,
  });
  final int humidity;
  final int pressure;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: const Icon(Icons.opacity),
          title: Text('Humidity: $humidity%'),
        ),
        ListTile(
          leading: const Icon(Icons.compress),
          title: Text('Pressure: $pressure hPa'),
        ),
      ],
    );
  }
}
