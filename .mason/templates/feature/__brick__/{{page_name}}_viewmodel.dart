import 'package:riverpod_annotation/riverpod_annotation.dart';

part '{{page_name}}_viewmodel.g.dart';

@riverpod
class {{page_name.pascalCase()}}Viewmodel extends _${{page_name.pascalCase()}}Viewmodel {

  @override
  {{page_name.pascalCase()}}State build() {
    return {{page_name.pascalCase()}}State(
    );
  }

  Future<AppError?> call() async {
    final {{page_name.camelCase()}}Request = {{page_name.pascalCase()}}Request(
    );
    try {
      state = state.copyWith(isLoading: false);
    } catch (e) {
      state = state.copyWith(isLoading: false);
      if (e is DioException) {
        return AppError.dioException(e);
      } else {
        return AppError.unknownError(e.toString());
      }
    }
    return null;
  }
}