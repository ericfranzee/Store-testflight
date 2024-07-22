import 'package:ibeauty/application/story/story_bloc.dart';
import 'package:ibeauty/presentation/pages/category/widgets/story_item.dart';
import 'package:ibeauty/presentation/route/app_route_shop.dart';
import 'package:ibeauty/presentation/style/style.dart';
import 'package:ibeauty/presentation/style/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class StoryList extends StatelessWidget {
  final RefreshController storyRefresh;
  final CustomColorSet colors;

  const StoryList(
      {super.key, required this.storyRefresh, required this.colors});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StoryBloc, StoryState>(
      builder: (context, state) {
        return state.story.isNotEmpty
            ? SizedBox(
          height: 180.r,
          child: SmartRefresher(
            enablePullDown: false,
            enablePullUp: true,
            controller: storyRefresh,
            scrollDirection: Axis.horizontal,
            onLoading: () {
              context.read<StoryBloc>().add(StoryEvent.fetchStory(
                  context: context, controller: storyRefresh));
            },
            child: ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 16.r),
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: state.story.length,
                itemBuilder: (context, index) {
                  return StoryItem(
                    colors: colors,
                    story: (state.story[index]?.isNotEmpty ?? false)
                        ? (state.story[index]?.first)
                        : null,
                    onTap: () {
                      AppRouteShop.goStoryPage(
                          context: context,
                          controller: storyRefresh,
                          index: index);
                    },
                  );
                }),
          ),
        )
            : state.isLoading
            ? _shimmer()
            : const SizedBox.shrink();
      },
    );
  }

  Widget _shimmer() {
    return SizedBox(
      height: 180.r,
      child: ListView.builder(
          padding: EdgeInsets.symmetric(horizontal: 16.r),
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: 6,
          itemBuilder: (context, index) {
            return Container(
              width: 120.r,
              margin: EdgeInsets.only(right: 8.r),
              decoration: BoxDecoration(
                  color: CustomStyle.shimmerBase,
                  border: Border.all(color: colors.icon),
                  borderRadius: BorderRadius.circular(10.r)),
            );
          }),
    );
  }
}