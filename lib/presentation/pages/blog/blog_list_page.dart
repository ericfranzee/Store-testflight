import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ibeauty/application/blog/blog_bloc.dart';
import 'package:ibeauty/domain/service/helper.dart';
import 'package:ibeauty/domain/service/tr_keys.dart';
import 'package:ibeauty/presentation/components/blog_item.dart';
import 'package:ibeauty/presentation/components/button/pop_button.dart';
import 'package:ibeauty/presentation/components/custom_scaffold.dart';
import 'package:ibeauty/presentation/components/loading.dart';
import 'package:ibeauty/presentation/style/style.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class BlogListPage extends StatefulWidget {
  const BlogListPage({super.key});

  @override
  State<BlogListPage> createState() => _BlogListPageState();
}

class _BlogListPageState extends State<BlogListPage> {
  late RefreshController blogRefresh;

  @override
  void initState() {
    blogRefresh = RefreshController();
    super.initState();
  }

  @override
  void dispose() {
    blogRefresh.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: (colors) => SafeArea(
        bottom: false,
        child: Column(
          children: [
            Text(
              AppHelper.getTrn(TrKeys.blog),
              style: CustomStyle.interNoSemi(color: colors.textBlack, size: 18),
            ),
            24.verticalSpace,
            BlocBuilder<BlogBloc, BlogState>(
              builder: (context, state) {
                return Expanded(
                  child: state.isLoadingBlog
                      ? const Loading()
                      : SmartRefresher(
                          controller: blogRefresh,
                          enablePullUp: true,
                          onRefresh: () {
                            context.read<BlogBloc>().add(BlogEvent.fetchBlog(
                                context: context,
                                isRefresh: true,
                                controller: blogRefresh));
                            blogRefresh.resetNoData();
                          },
                          onLoading: () {
                            context.read<BlogBloc>().add(BlogEvent.fetchBlog(
                                context: context, controller: blogRefresh));
                          },
                          child: ListView.builder(
                              padding: EdgeInsets.symmetric(horizontal: 16.r),
                              shrinkWrap: true,
                              itemCount: state.blogs.length,
                              itemBuilder: (context, index) {
                                return BlogItem(
                                  isHomePage: false,
                                  blog: state.blogs[index],
                                );
                              }),
                        ),
                );
              },
            )
          ],
        ),
      ),
      floatingButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingButton: (colors) => PopButton(colors: colors),
    );
  }
}
