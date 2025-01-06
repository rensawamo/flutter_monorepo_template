import 'package:freezed_annotation/freezed_annotation.dart';

part 'permission_state.freezed.dart';
part 'permission_state.g.dart';

@freezed
class PermissionState with _$PermissionState {
  const factory PermissionState({
    @Default(false) bool notification,
    @Default(false) bool camera,
  }) = _PermissionState;

  factory PermissionState.fromJson(Map<String, dynamic> json) =>
      _$PermissionStateFromJson(json);
}
