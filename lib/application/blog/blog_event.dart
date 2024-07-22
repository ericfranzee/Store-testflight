part of 'blog_bloc.dart';

@freezed
abstract class BlogEvent with _$BlogEvent {
  const factory BlogEvent.fetchBlog(
      {required BuildContext context,
      bool? isRefresh,
      RefreshController? controller}) = FetchBlog;

  const factory BlogEvent.fetchBlogById(
      {required BuildContext context,
        required int id,
         BlogData? blog}) = FetchBlogById;


}
