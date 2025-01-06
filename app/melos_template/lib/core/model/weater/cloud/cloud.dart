import 'package:freezed_annotation/freezed_annotation.dart';

part 'cloud.freezed.dart';
part 'cloud.g.dart';

@freezed
class Cloud with _$Cloud {
  const factory Cloud({
    required int all,
  }) = _Cloud;

  factory Cloud.fromJson(Map<String, dynamic> json) => _$CloudFromJson(json);
}
