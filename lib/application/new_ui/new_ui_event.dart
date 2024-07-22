part of 'new_ui_bloc.dart';

@freezed
abstract class NewUiEvent with _$NewUiEvent {
  const factory NewUiEvent.updateCart(
      {required double top, required double left}) = UpdateCart;
}
