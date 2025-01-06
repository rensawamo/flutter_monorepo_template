import 'package:freezed_annotation/freezed_annotation.dart';

part '{{page_name}}_state.freezed.dart';

@freezed
class {{page_name.pascalCase()}}State with _${{page_name.pascalCase()}}State {
  const factory {{page_name.pascalCase()}}State({
    @Default(true) bool isLoading,
  }) = _{{page_name.pascalCase()}}State;
}