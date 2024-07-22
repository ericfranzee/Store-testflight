// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:bloc/bloc.dart';
import 'package:ibeauty/domain/di/dependency_manager.dart';
import 'package:ibeauty/domain/model/response/form_options_response.dart';
import 'package:ibeauty/domain/service/helper.dart';

part 'form_event.dart';

part 'form_state.dart';

part 'form_bloc.freezed.dart';

class FormBloc extends Bloc<FormEvent, FormOptionsState> {
  FormBloc() : super(const FormOptionsState()) {
    on<FetchForms>((event, emit) async {
      emit(state.copyWith(isLoading: true));
      final res = await formRepository.getAllForms(
          serviceMasterIds: event.serviceMasterIds);

      res.fold((l) {
        emit(state.copyWith(
          isLoading: false,
          formOptionList: l.data ?? [],
        ));
      }, (r) {
        emit(state.copyWith(isLoading: false));

        AppHelper.errorSnackBar(context: event.context, message: r);
      });
    });

    on<FetchSingleForms>((event, emit) async {
      if(event.form != null) {
        emit(state.copyWith(formOptions: event.form));
        return;
      }
      emit(state.copyWith(isLoading: true));
      final res = await formRepository.getSingleForm(event.id);

      res.fold((l) {
        emit(state.copyWith(
          isLoading: false,
          formOptions: l,
        ));
      }, (r) {
        emit(state.copyWith(isLoading: false));

        AppHelper.errorSnackBar(context: event.context, message: r);
      });
    });

    on<SetFormOption>((event, emit) {
      emit(state.copyWith(formOptions: event.formOptions));
    });
  }
}
