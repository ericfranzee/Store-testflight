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
import 'package:ibeauty/application/category/category_bloc.dart';
import 'package:ibeauty/application/main/main_bloc.dart';
import 'package:ibeauty/application/master/master_bloc.dart';
import 'package:ibeauty/application/notification/notification_bloc.dart';
import 'package:ibeauty/application/products/product_bloc.dart';
import 'package:ibeauty/application/shop/shop_bloc.dart';
import 'package:ibeauty/domain/service/helper.dart';
import 'package:ibeauty/domain/service/tr_keys.dart';
import 'package:ibeauty/infrastructure/local_storage/local_storage.dart';
import 'package:ibeauty/presentation/components/custom_network_image.dart';
import 'package:ibeauty/presentation/components/custom_scaffold.dart';
import 'package:ibeauty/presentation/components/custom_textformfield.dart';
import 'package:ibeauty/presentation/pages/home/widgets/all_shop_list.dart';
import 'package:ibeauty/presentation/pages/home/widgets/banner_list.dart';
import 'package:ibeauty/presentation/pages/home/widgets/blog_list.dart';
import 'package:ibeauty/presentation/pages/home/widgets/new_shop.dart';
import 'package:ibeauty/presentation/pages/home/widgets/popular_shop.dart';
import 'package:ibeauty/presentation/pages/home_one/widgets/for_you_and_discount.dart';
import 'package:ibeauty/presentation/pages/home_one/widgets/upcoming_one_list.dart';
import 'package:ibeauty/presentation/route/app_route.dart';
import 'package:ibeauty/presentation/route/app_route_setting.dart';
import 'package:ibeauty/presentation/style/style.dart';
import 'package:ibeauty/presentation/style/theme/theme.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'widgets/category_one_list.dart';

class HomeOnePage extends StatefulWidget {
  const HomeOnePage({Key? key}) : super(key: key);

  @override
  State<HomeOnePage> createState() => _HomeOnePageState();
}

class _HomeOnePageState extends State<HomeOnePage> {
  late RefreshController categoryRefresh;
  late RefreshController shopRefresh;
  late RefreshController looksRefresh;
  late RefreshController adsRefresh;
  late RefreshController bannerRefresh;
  late PageController pageController;
  late ScrollController scrollController;

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
    looksRefresh = RefreshController();
    adsRefresh = RefreshController();
    bannerRefresh = RefreshController();
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
    looksRefresh.dispose();
    adsRefresh.dispose();
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
            16.verticalSpace,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.r),
              child: BlocBuilder<MainBloc, MainState>(
                buildWhen: (p, n) {
                  return p.isShowSearch != n.isShowSearch;
                },
                builder: (context, state) {
                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 500),
                    height: state.isShowSearch ? 50.r : 0,
                    child: state.isShowSearch
                        ? CustomTextFormField(
                            onTap: () {
                              AppRoute.goSearchPage(context: context);
                            },
                            readOnly: true,
                            radius: 16,
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
            ),
            Expanded(
              child: SmartRefresher(
                scrollController: scrollController,
                controller: shopRefresh,
                enablePullUp: true,
                onRefresh: () {
                  context.read<CategoryBloc>().add(CategoryEvent.fetchCategoryOfService(
                      context: context,
                      isRefresh: true,
                      controller: shopRefresh));
                  context.read<ProductBloc>()
                    ..add(ProductEvent.fetchMostSaleProduct(
                        context: context,
                        isRefresh: true,
                        controller: shopRefresh))
                    ..add(ProductEvent.fetchNewProduct(
                        context: context,
                        isRefresh: true,
                        controller: shopRefresh))
                    ..add(ProductEvent.fetchAllProduct(
                        context: context,
                        isRefresh: true,
                        controller: shopRefresh));
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
                  controller: scrollController,
                  shrinkWrap: true,
                  padding: EdgeInsets.symmetric(vertical: 16.r),
                  children: [
                    CategoryOneList(
                        categoryRefresh: categoryRefresh, colors: colors),
                    BannerList(
                      pageController: pageController,
                      colors: colors,
                      controller: bannerRefresh,
                      onLoading: () {
                        context.read<BannerBloc>().add(BannerEvent.fetchBanner(
                            context: context, controller: bannerRefresh));
                      },
                    ),
                    UpComingOneList(colors: colors),
                    ShopsPopularList(colors: colors),
                    16.verticalSpace,
                    ForYouAndDiscount(colors: colors),
                    NewShopList(colors: colors),
                    BlogList(colors: colors),
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
      leadingWidth: 56.r,
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
      leading: LocalStorage.getToken().isEmpty
          ? IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: Icon(
                FlutterRemix.menu_line,
                color: colors.textBlack,
              ),
            )
          : InkWell(
              onTap: () {
                Scaffold.of(context).openDrawer();
              },
              child: Padding(
                padding: EdgeInsets.only(left: 8.r),
                child: CustomNetworkImage(
                  url: LocalStorage.getUser().img,
                  height: 40,
                  width: 40,
                  radius: 30,
                  name: LocalStorage.getUser().firstname,
                ),
              ),
            ),
      title: InkWell(
        onTap: () {
          AppRouteSetting.goSelectCountry(context: context);
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              LocalStorage.getUser().firstname == null
                  ? AppHelper.getTrn(TrKeys.guest)
                  : "${LocalStorage.getUser().firstname ?? ""} ${LocalStorage.getUser().lastname ?? ""}",
              style: CustomStyle.interNormal(color: colors.textBlack, size: 14),
            ),
            Row(
              children: [
                Text(
                  "${LocalStorage.getAddress()?.country ?? ""} ${LocalStorage.getAddress()?.city ?? ""}",
                  style: CustomStyle.interRegular(
                      color: colors.textHint, size: 14),
                ),
                Icon(
                  FlutterRemix.arrow_down_s_line,
                  color: colors.textHint,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
