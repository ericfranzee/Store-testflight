// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:bloc/bloc.dart';
import 'package:ibeauty/domain/interface/shop.dart';
import 'package:ibeauty/domain/model/model/story_model.dart';
import 'package:ibeauty/domain/service/helper.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

part 'story_event.dart';

part 'story_state.dart';

part 'story_bloc.freezed.dart';

class StoryBloc extends Bloc<StoryEvent, StoryState> {
  final ShopsInterface _shopsInterface;

  StoryBloc(this._shopsInterface) : super(const StoryState()) {
    int page = 0;

    on<FetchStory>((event, emit) async {
      if (event.isRefresh ?? false) {
        event.controller?.resetNoData();
        page = 0;
        emit(state.copyWith(story: [], isLoading: true));
      }
      final res = await _shopsInterface.getStory(++page);
      res.fold((l) {
        List<List<StoryModel?>?> list = List.from(state.story);
        list.addAll(l);
        emit(state.copyWith(isLoading: false, story: list));
        if (event.isRefresh ?? false) {
          event.controller?.refreshCompleted();
          return;
        } else if (l.isEmpty) {
          event.controller?.loadNoData();
          return;
        }
        event.controller?.loadComplete();
        return;
      }, (r) {
        emit(state.copyWith(isLoading: false));
        if (event.isRefresh ?? false) {
          event.controller?.refreshFailed();
        }
        event.controller?.loadFailed();
        AppHelper.errorSnackBar(context: event.context, message: r);
      });
    });
  }
}
