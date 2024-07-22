
// ignore_for_file: depend_on_referenced_packages

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:bloc/bloc.dart';

part 'main_event.dart';

part 'main_state.dart';

part 'main_bloc.freezed.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  MainBloc() : super(const MainState()) {
    on<ChangeIndex>((event, emit) async {
      emit(state.copyWith(selectIndex: event.index));
    });

    on<ChangeForYou>((event, emit) async {
      emit(state.copyWith(selectForYou: event.value));
    });

    on<ShowSearch>((event, emit) async {
      emit(state.copyWith(isShowSearch: event.value));
    });
  }
}
