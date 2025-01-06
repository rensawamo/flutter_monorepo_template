import 'package:freezed_annotation/freezed_annotation.dart';

part 'notification_token.freezed.dart';
part 'notification_token.g.dart';

@freezed
class NotificationTokenModel with _$NotificationTokenModel {
  const factory NotificationTokenModel({
    required String? fcmToken,
    required String? apnsToken,
  }) = _NotificationTokenModel;

  factory NotificationTokenModel.fromJson(Map<String, dynamic> json) =>
      _$NotificationTokenModelFromJson(json);
}
