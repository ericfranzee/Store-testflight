// ignore_for_file: depend_on_referenced_packages

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:bloc/bloc.dart';

part 'new_ui_event.dart';

part 'new_ui_state.dart';

part 'new_ui_bloc.freezed.dart';

class NewUiBloc extends Bloc<NewUiEvent, NewUiState> {
  NewUiBloc() : super(const NewUiState()) {
    on<UpdateCart>((event, emit) {
      emit(state.copyWith(top: event.top,left: event.left));
    });
  }
}


