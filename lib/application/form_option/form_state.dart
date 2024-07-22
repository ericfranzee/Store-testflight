part of 'form_bloc.dart';


@freezed
class FormOptionsState with _$FormOptionsState {
  const factory FormOptionsState({
    @Default([]) List<FormOptionsData> formOptionList,
    @Default(null) FormOptionsData? formOptions,
    @Default(true) bool isLoading,
  }) = _FormOptionsState;
}
