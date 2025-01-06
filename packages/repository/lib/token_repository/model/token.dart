import 'package:freezed_annotation/freezed_annotation.dart';

part 'token.freezed.dart';

@freezed
class Token with _$Token {
  const factory Token({
    @Default('') String accessToken,
    // Add more fields if needed
  }) = _Token;
}
