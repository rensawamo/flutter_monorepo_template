import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'connectivity_provider.g.dart';

@riverpod
Connectivity connectivity(Ref ref) {
  return Connectivity();
}

// @Riverpod(keepAlive: true)
// class ConnectivityProvider extends _$ConnectivityProvider {
//   @override
//   Stream<bool> build() {
//     final connectivity = Connectivity();
//     // Listen to connectivity changes and map the results to a boolean
//     return connectivity.onConnectivityChanged.map((result) {
//       return result.contains(ConnectivityResult.none);
//     });
//   }
// }
