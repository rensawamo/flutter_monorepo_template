import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'flavor_provider.g.dart';

@riverpod
Flavor flavor(Ref ref) {
  throw UnimplementedError();
}

enum Flavor {
  dev,
  stg,
  prod,
}
