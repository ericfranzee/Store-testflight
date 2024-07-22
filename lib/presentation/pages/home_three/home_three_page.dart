import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ibeauty/application/banner/banner_bloc.dart';
import 'package:ibeauty/application/blog/blog_bloc.dart';
import 'package:ibeauty/application/booking/booking_bloc.dart';
import 'package:ibeauty/application/brand/brand_bloc.dart';
import 'package:ibeauty/application/main/main_bloc.dart';
import 'package:ibeauty/application/master/master_bloc.dart';
import 'package:ibeauty/application/notification/notification_bloc.dart';
import 'package:ibeauty/application/products/product_bloc.dart';
import 'package:ibeauty/application/shop/shop_bloc.dart';
import 'package:ibeauty/application/story/story_bloc.dart';
import 'package:ibeauty/domain/service/helper.dart';
import 'package:ibeauty/domain/service/tr_keys.dart';
import 'package:ibeauty/infrastructure/local_storage/local_storage.dart';
import 'package:ibeauty/presentation/components/custom_scaffold.dart';
import 'package:ibeauty/presentation/components/custom_textformfield.dart';
import 'package:ibeauty/presentation/pages/home/widgets/all_shop_list.dart';
import 'package:ibeauty/presentation/pages/home/widgets/banner_list.dart';
import 'package:ibeauty/presentation/pages/home/widgets/blog_list.dart';
import 'package:ibeauty/presentation/pages/home/widgets/masters_list.dart';
import 'package:ibeauty/presentation/pages/home/widgets/popular_shop.dart';
import 'package:ibeauty/presentation/pages/home_three/widgets/most_product_three.dart';
import 'package:ibeauty/presentation/pages/home_three/widgets/story_three_list.dart';
import 'package:ibeauty/presentation/route/app_route.dart';
import 'package:ibeauty/presentation/route/app_route_setting.dart';
import 'package:ibeauty/presentation/style/style.dart';
import 'package:ibeauty/presentation/style/theme/theme.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'widgets/upcoming_three_list.dart';

class HomeThreePage extends StatefulWidget {
  const HomeThreePage({super.key});

  @override
  State<HomeThreePage> createState() => _HomeThreePageState();
}

class _HomeThreePageState extends State<HomeThreePage> {
  late RefreshController categoryRefresh;
  late RefreshController brandRefresh;
  late RefreshController shopRefresh;
  late RefreshController masterRefresh;
  late RefreshController storyRefresh;
  late RefreshController bannerRefresh;
  late ScrollController scrollController;
  late PageController pageController;

  void listen() {
    final direction = scrollController.position.userScrollDirection;
    if (direction == ScrollDirection.reverse) {
      context.read<MainBloc>().add(const MainEvent.showSearch(value: false));
    } else if (direction == ScrollDirection.forward) {
      context.read<MainBloc>().add(const MainEvent.showSearch(value: true));
    }
  }

  @override
  void initState() {
    categoryRefresh = RefreshController();
    shopRefresh = RefreshController();
    masterRefresh = RefreshController();
    storyRefresh = RefreshController();
    bannerRefresh = RefreshController();
    brandRefresh = RefreshController();
    pageController = PageController();
    scrollController = ScrollController();
    scrollController.addListener(listen);
    super.initState();
  }

  @override
  void dispose() {
    categoryRefresh.dispose();
    shopRefresh.dispose();
    pageController.dispose();
    masterRefresh.dispose();
    storyRefresh.dispose();
    brandRefresh.dispose();
    bannerRefresh.dispose();
    scrollController.removeListener(listen);
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: (colors) => _buildAppBar(colors),
      body: (colors) {
        return Container(
          color: colors.newBoxColor,
          child: Column(
            children: [
              16.verticalSpace,
              BlocBuilder<MainBloc, MainState>(
                buildWhen: (p, n) {
                  return p.isShowSearch != n.isShowSearch;
                },
                builder: (context, state) {
                  return AnimatedContainer(
                    margin: EdgeInsets.symmetric(horizontal: 16.r),
                    duration: const Duration(milliseconds: 500),
                    height: state.isShowSearch ? 48.r : 0,
                    decoration: BoxDecoration(
                      color: colors.backgroundColor,
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: state.isShowSearch
                        ? CustomTextFormField(
                            onTap: () {
                              AppRoute.goSearchPage(context: context);
                            },
                            readOnly: true,
                            radius: 10,
                            prefixIcon: const Icon(
                              FlutterRemix.search_2_line,
                              color: CustomStyle.textHint,
                            ),
                            hint: AppHelper.getTrn(TrKeys.search),
                          )
                        : const SizedBox.shrink(),
                  );
                },
              ),
              Expanded(
                child: SmartRefresher(
                  scrollController: scrollController,
                  controller: shopRefresh,
                  enablePullUp: true,
                  onRefresh: () {
                    context.read<ProductBloc>().add(
                        ProductEvent.fetchMostSaleProduct(
                            context: context,
                            isRefresh: true,
                            controller: shopRefresh));

                    context.read<StoryBloc>().add(StoryEvent.fetchStory(
                        context: context,
                        isRefresh: true,
                        controller: shopRefresh));

                    context.read<ShopBloc>()
                      ..add(ShopEvent.fetchShops(
                          context: context,
                          isRefresh: true,
                          controller: shopRefresh))
                      ..add(ShopEvent.fetchNewShops(
                          context: context,
                          isRefresh: true,
                          controller: shopRefresh))
                      ..add(ShopEvent.fetchPopularShops(
                          context: context,
                          isRefresh: true,
                          controller: shopRefresh));
                    context.read<BlogBloc>().add(BlogEvent.fetchBlog(
                        context: context,
                        isRefresh: true,
                        controller: shopRefresh));
                    context.read<BrandBloc>().add(BrandEvent.fetchBrands(
                        context: context,
                        isRefresh: true,
                        controller: shopRefresh));
                    context.read<BannerBloc>()
                      ..add(BannerEvent.fetchBanner(
                          context: context,
                          isRefresh: true,
                          controller: shopRefresh))
                      ..add(BannerEvent.fetchAdsBanner(
                          context: context,
                          isRefresh: true,
                          controller: shopRefresh));
                    context.read<MasterBloc>().add(MasterEvent.fetchMasters(
                        context: context,
                        isRefresh: true,
                        controller: shopRefresh));
                    context.read<BookingBloc>().add(
                        BookingEvent.fetchBookUpcoming(
                            context: context,
                            isRefresh: true,
                            controller: shopRefresh));
                    shopRefresh.resetNoData();
                  },
                  onLoading: () {
                    context.read<ShopBloc>().add(ShopEvent.fetchShops(
                        context: context, controller: shopRefresh));
                  },
                  child: ListView(
                    padding: EdgeInsets.only(top: 16.r),
                    shrinkWrap: true,
                    controller: scrollController,
                    children: [
                      StoryThreeList(
                          storyRefresh: storyRefresh, colors: colors),
                      BannerList(
                        pageController: pageController,
                        colors: colors,
                        controller: bannerRefresh,
                        onLoading: () {
                          context.read<BannerBloc>().add(
                              BannerEvent.fetchBanner(
                                  context: context, controller: bannerRefresh));
                        },
                      ),
                      ShopsPopularList(colors: colors),
                      16.verticalSpace,
                      UpComingThreeList(colors: colors),
                      MastersList(
                        colors: colors,
                        controller: masterRefresh,
                        onLoading: () {
                          context.read<MasterBloc>().add(
                              MasterEvent.fetchMasters(
                                  context: context, controller: masterRefresh));
                        },
                      ),
                      16.verticalSpace,
                      MostProductThreeList(colors: colors),
                      BlogList(colors: colors),
                      AllShopList(colors: colors),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  AppBar _buildAppBar(CustomColorSet colors) {
    return AppBar(
      backgroundColor: colors.backgroundColor,
      elevation: 0.0,
      centerTitle: true,
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
              child: SvgPicture.asset(
                "assets/svg/notification.svg",
                height: 24.r,
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
        style: CustomStyle.interSemi(color: colors.textBlack, size: 22),
      ),
    );
  }
}
