import 'package:ibeauty/application/booking/booking_bloc.dart';
import 'package:ibeauty/application/brand/brand_bloc.dart';
import 'package:ibeauty/application/master/master_bloc.dart';
import 'package:ibeauty/application/shop/shop_bloc.dart';
import 'package:ibeauty/application/story/story_bloc.dart';
import 'package:ibeauty/presentation/pages/home/widgets/masters_list.dart';
import 'package:ibeauty/presentation/pages/home/widgets/new_shop.dart';
import 'package:ibeauty/presentation/pages/home/widgets/story_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ibeauty/application/banner/banner_bloc.dart';
import 'package:ibeauty/application/blog/blog_bloc.dart';
import 'package:ibeauty/application/notification/notification_bloc.dart';
import 'package:ibeauty/application/profile/profile_bloc.dart';
import 'package:ibeauty/domain/service/helper.dart';
import 'package:ibeauty/domain/service/tr_keys.dart';
import 'package:ibeauty/infrastructure/local_storage/local_storage.dart';
import 'package:ibeauty/presentation/components/custom_scaffold.dart';
import 'package:ibeauty/presentation/pages/home/widgets/upcoming_list.dart';
import 'package:ibeauty/presentation/route/app_route.dart';
import 'package:ibeauty/presentation/route/app_route_setting.dart';
import 'package:ibeauty/presentation/style/style.dart';
import 'package:ibeauty/presentation/style/theme/theme.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'widgets/all_shop_list.dart';
import 'widgets/blog_list.dart';
import 'widgets/brands_list.dart';
import 'widgets/popular_shop.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late RefreshController shopRefresh;
  late RefreshController storyRefresh;
  late RefreshController brandRefresh;
  late RefreshController bannerRefresh;
  late RefreshController masterRefresh;
  late PageController pageController;

  @override
  void initState() {
    shopRefresh = RefreshController();
    storyRefresh = RefreshController();
    brandRefresh = RefreshController();
    bannerRefresh = RefreshController();
    masterRefresh = RefreshController();
    pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    shopRefresh.dispose();
    pageController.dispose();
    storyRefresh.dispose();
    brandRefresh.dispose();
    masterRefresh.dispose();
    bannerRefresh.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: (colors) => _buildAppBar(colors),
      body: (colors) {
        return SmartRefresher(
          controller: shopRefresh,
          enablePullUp: true,
          onRefresh: () {
            context.read<StoryBloc>().add(StoryEvent.fetchStory(
                context: context, isRefresh: true, controller: shopRefresh));

            context.read<ShopBloc>()
              ..add(ShopEvent.fetchShops(
                  context: context, isRefresh: true, controller: shopRefresh))
              ..add(ShopEvent.fetchNewShops(
                  context: context, isRefresh: true, controller: shopRefresh))
              ..add(ShopEvent.fetchPopularShops(
                  context: context, isRefresh: true, controller: shopRefresh));
            context.read<BlogBloc>().add(BlogEvent.fetchBlog(
                context: context, isRefresh: true, controller: shopRefresh));
            context.read<BrandBloc>().add(BrandEvent.fetchBrands(
                context: context, isRefresh: true, controller: shopRefresh));
            context.read<BannerBloc>()
              ..add(BannerEvent.fetchBanner(
                  context: context, isRefresh: true, controller: shopRefresh))
              ..add(BannerEvent.fetchAdsBanner(
                  context: context, isRefresh: true, controller: shopRefresh));
            context.read<MasterBloc>().add(MasterEvent.fetchMasters(
                context: context, isRefresh: true, controller: shopRefresh));
            context.read<BookingBloc>().add(BookingEvent.fetchBookUpcoming(
                context: context, isRefresh: true, controller: shopRefresh));
            shopRefresh.resetNoData();
          },
          onLoading: () {
            context.read<ShopBloc>().add(ShopEvent.fetchShops(
                context: context, controller: shopRefresh));
          },
          child: ListView(
            shrinkWrap: true,
            padding: EdgeInsets.symmetric(vertical: 16.r),
            children: [
              if (LocalStorage.getUser().firstname != null) _hello(colors),
              24.verticalSpace,
              UpComingList(colors: colors),
              16.verticalSpace,
              StoryList(storyRefresh: storyRefresh, colors: colors),
              16.verticalSpace,
              ShopsPopularList(colors: colors),
              MastersList(
                colors: colors,
                controller: masterRefresh,
                onLoading: () {
                  context.read<MasterBloc>().add(MasterEvent.fetchMasters(
                      context: context, controller: masterRefresh));
                },
              ),
              BrandsList(brandRefresh: brandRefresh, colors: colors),
              NewShopList(colors: colors),
              BlogList(colors: colors),
              AllShopList(colors: colors),
              80.verticalSpace,
            ],
          ),
        );
      },
    );
  }

  Padding _hello(CustomColorSet colors) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.r),
      child: BlocBuilder<ProfileBloc, ProfileState>(
        builder: (context, state) {
          return Text(
            "${AppHelper.getTrn(TrKeys.hello)} 👋 \n${LocalStorage.getUser().firstname} ${LocalStorage.getUser().lastname ?? ""}",
            style: CustomStyle.interNoSemi(color: colors.textBlack, size: 32),
          );
        },
      ),
    );
  }

  AppBar _buildAppBar(CustomColorSet colors) {
    return AppBar(
      backgroundColor: colors.backgroundColor,
      elevation: 0.0,
      actions: [
        IconButton(
            onPressed: () {
              if (LocalStorage.getToken().isEmpty) {
                AppRoute.goLogin(context);
                return;
              }
              AppRouteSetting.goNotification(context: context);
            },
            icon: Badge(
              label: (LocalStorage.getToken().isEmpty)
                  ? const Text("0")
                  : BlocBuilder<NotificationBloc, NotificationState>(
                      builder: (context, state) {
                        return Text(state.countOfNotifications?.notification
                                .toString() ??
                            "0");
                      },
                    ),
              child: Icon(
                FlutterRemix.notification_line,
                color: colors.textBlack,
              ),
            ))
      ],
      leading: IconButton(
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
          icon: Icon(
            FlutterRemix.menu_line,
            color: colors.textBlack,
          )),
      title: Text(
        AppHelper.getAppName(),
        style: CustomStyle.interSemi(color: colors.textBlack, size: 15),
      ),
    );
  }
}
