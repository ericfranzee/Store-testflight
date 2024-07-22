
part of 'blog_bloc.dart';

@freezed
class BlogState with _$BlogState {
  const factory BlogState({
    @Default([]) List<BlogData> blogs,
    @Default(null) BlogData? blog,
    @Default(true) bool isLoadingBlog,
    @Default(true) bool isLoading,
  }) = _BlogState;
}
