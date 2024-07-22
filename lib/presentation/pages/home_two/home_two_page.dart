import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ibeauty/application/banner/banner_bloc.dart';
import 'package:ibeauty/application/blog/blog_bloc.dart';
import 'package:ibeauty/application/brand/brand_bloc.dart';
import 'package:ibeauty/application/category/category_bloc.dart';
import 'package:ibeauty/application/main/main_bloc.dart';
import 'package:ibeauty/application/master/master_bloc.dart';
import 'package:ibeauty/application/notification/notification_bloc.dart';
import 'package:ibeauty/application/products/product_bloc.dart';
import 'package:ibeauty/domain/service/helper.dart';
import 'package:ibeauty/domain/service/tr_keys.dart';
import 'package:ibeauty/infrastructure/local_storage/local_storage.dart';
import 'package:ibeauty/presentation/components/custom_scaffold.dart';
import 'package:ibeauty/presentation/components/custom_textformfield.dart';
import 'package:ibeauty/presentation/pages/home/widgets/all_shop_list.dart';
import 'package:ibeauty/presentation/pages/home/widgets/masters_list.dart';
import 'package:ibeauty/presentation/pages/home/widgets/popular_shop.dart';
import 'package:ibeauty/presentation/pages/home_three/widgets/story_three_list.dart';
import 'package:ibeauty/presentation/route/app_route.dart';
import 'package:ibeauty/presentation/route/app_route_setting.dart';
import 'package:ibeauty/presentation/style/style.dart';
import 'package:ibeauty/presentation/style/theme/theme.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'widgets/category_two_list.dart';
import 'widgets/upcoming_two_list.dart';

class HomeTwoPage extends StatefulWidget {
  const HomeTwoPage({super.key});

  @override
  State<HomeTwoPage> createState() => _HomeTwoPageState();
}

class _HomeTwoPageState extends State<HomeTwoPage> {
  late RefreshController categoryRefresh;
  late RefreshController masterRefresh;
  late RefreshController productRefresh;
  late RefreshController storyRefresh;
  late RefreshController adsRefresh;
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
    productRefresh = RefreshController();
    storyRefresh = RefreshController();
    adsRefresh = RefreshController();
    bannerRefresh = RefreshController();
    masterRefresh = RefreshController();
    pageController = PageController();
    scrollController = ScrollController();
    scrollController.addListener(listen);
    super.initState();
  }

  @override
  void dispose() {
    categoryRefresh.dispose();
    productRefresh.dispose();
    pageController.dispose();
    storyRefresh.dispose();
    adsRefresh.dispose();
    masterRefresh.dispose();
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
        return Column(
          children: [
            8.verticalSpace,
            BlocBuilder<MainBloc, MainState>(
              buildWhen: (p, n) {
                return p.isShowSearch != n.isShowSearch;
              },
              builder: (context, state) {
                return AnimatedContainer(
                  margin: EdgeInsets.symmetric(horizontal: 16.r),
                  duration: const Duration(milliseconds: 500),
                  height: state.isShowSearch ? 50.r : 0,
                  child: state.isShowSearch ? CustomTextFormField(
                    onTap: () {
                      AppRoute.goSearchPage(context: context);
                    },
                    readOnly: true,
                    radius: 24,
                    prefixIcon: const Icon(
                      FlutterRemix.search_2_line,
                      color: CustomStyle.textHint,
                    ),
                    hint: AppHelper.getTrn(TrKeys.search),
                  ) : const SizedBox.shrink(),
                );
              },
            ),
            Expanded(
              child: SmartRefresher(
                scrollController: scrollController,
                controller: productRefresh,
                enablePullUp: true,
                onRefresh: () {
                  context.read<CategoryBloc>().add(CategoryEvent.fetchCategory(
                      context: context,
                      isRefresh: true,
                      controller: productRefresh));
                  context.read<ProductBloc>()
                    ..add(ProductEvent.fetchMostSaleProduct(
                        context: context,
                        isRefresh: true,
                        controller: productRefresh))
                    ..add(ProductEvent.fetchNewProduct(
                        context: context,
                        isRefresh: true,
                        controller: productRefresh))
                    ..add(ProductEvent.fetchAllProduct(
                        context: context,
                        isRefresh: true,
                        controller: productRefresh));
                  context.read<BlogBloc>().add(BlogEvent.fetchBlog(
                      context: context,
                      isRefresh: true,
                      controller: productRefresh));
                  context.read<BannerBloc>()
                    ..add(BannerEvent.fetchBanner(
                        context: context,
                        isRefresh: true,
                        controller: productRefresh))
                    ..add(BannerEvent.fetchLooks(
                        context: context,
                        isRefresh: true,
                        controller: productRefresh))
                    ..add(BannerEvent.fetchAdsBanner(
                        context: context,
                        isRefresh: true,
                        controller: productRefresh))
                    ..add(BannerEvent.fetchAdsListProduct(
                        context: context, isRefresh: true));
                  context.read<BrandBloc>().add(BrandEvent.fetchBrands(
                      context: context,
                      isRefresh: true,
                      controller: productRefresh));
                  productRefresh.resetNoData();
                },
                onLoading: () {
                  context.read<ProductBloc>().add(ProductEvent.fetchAllProduct(
                      context: context, controller: productRefresh));
                  context.read<BannerBloc>().add(
                      BannerEvent.fetchAdsListProduct(
                          context: context, controller: productRefresh));
                },
                child: ListView(
                  shrinkWrap: true,
                  padding: EdgeInsets.only(top: 16.r),
                  controller: scrollController,
                  children: [
                    UpComingTwoList(colors: colors),
                    16.verticalSpace,
                    CategoryTwoList(
                        categoryRefresh: categoryRefresh, colors: colors),
                    ShopsPopularList(colors: colors),
                    16.verticalSpace,
                    StoryThreeList(
                        storyRefresh: storyRefresh, colors: colors),
                    MastersList(
                      colors: colors,
                      controller: masterRefresh,
                      onLoading: () {
                        context.read<MasterBloc>().add(MasterEvent.fetchMasters(
                            context: context, controller: masterRefresh));
                      },
                    ),
                    AllShopList(colors: colors),
                    80.verticalSpace,
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  AppBar _buildAppBar(CustomColorSet colors) {
    return AppBar(
      backgroundColor: colors.backgroundColor,
      elevation: 0.0,
      centerTitle: false,
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
      title: Text(
        AppHelper.getAppName(),
        style: CustomStyle.interSemi(color: colors.textBlack, size: 22),
      ),
    );
  }
}
