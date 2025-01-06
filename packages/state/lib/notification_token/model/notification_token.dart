import 'package:freezed_annotation/freezed_annotation.dart';

part 'notification_token.freezed.dart';
part 'notification_token.g.dart';

@freezed
class NotificationToken with _$NotificationToken {
  const factory NotificationToken({
    required String? fcmToken,
    required String? apnsToken,
  }) = _NotificationToken;

  factory NotificationToken.fromJson(Map<String, dynamic> json) =>
      _$NotificationTokenFromJson(json);
}
