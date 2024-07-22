// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:bloc/bloc.dart';
import 'package:ibeauty/domain/interface/blog.dart';
import 'package:ibeauty/domain/model/model/blog_model.dart';
import 'package:ibeauty/domain/service/helper.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

part 'blog_event.dart';

part 'blog_state.dart';

part 'blog_bloc.freezed.dart';

class BlogBloc extends Bloc<BlogEvent, BlogState> {
  final BlogInterface _blogRepo;

  BlogBloc(this._blogRepo) : super(const BlogState()) {
    int page = 0;

    on<FetchBlog>((event, emit) async {
      if (event.isRefresh ?? false) {
        event.controller?.resetNoData();
        page = 0;
        emit(state.copyWith(blogs: [], isLoadingBlog: true));
      }
      final res = await _blogRepo.getBlogs(++page, "blog");
      res.fold((l) {
        List<BlogData> list = List.from(state.blogs);
        list.addAll(l.data ?? []);
        emit(state.copyWith(isLoadingBlog: false, blogs: list));
        if (event.isRefresh ?? false) {
          event.controller?.refreshCompleted();
          return;
        } else if (l.data?.isEmpty ?? true) {
          event.controller?.loadNoData();
          return;
        }
        event.controller?.loadComplete();
        return;
      }, (r) {
        emit(state.copyWith(isLoadingBlog: false));
        if (event.isRefresh ?? false) {
          event.controller?.refreshFailed();

        }
        event.controller?.loadFailed();

        AppHelper.errorSnackBar(context: event.context, message: r);
      });
    });

    on<FetchBlogById>((event, emit) async {
      emit(state.copyWith(blog: event.blog, isLoading: true));
      final res = await _blogRepo.getBlogDetails(event.id);
      res.fold((l) {
        emit(state.copyWith(isLoading: false, blog: l.data));
      }, (r) {
        emit(state.copyWith(isLoadingBlog: false));
        AppHelper.errorSnackBar(context: event.context, message: r);
      });
    });
  }
}
