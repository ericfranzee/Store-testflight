part of 'form_bloc.dart';

@freezed
abstract class FormEvent with _$FormEvent {
  const factory FormEvent.fetchForms(
      {required BuildContext context,
      required List<int>? serviceMasterIds}) = FetchForms;

  const factory FormEvent.fetchSingleForms(
      {required BuildContext context,
      required int? id,
      FormOptionsData? form}) = FetchSingleForms;

  const factory FormEvent.setFormOption(
      {required BuildContext context,
      required FormOptionsData? formOptions}) = SetFormOption;
}
