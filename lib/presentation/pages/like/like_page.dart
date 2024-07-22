import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ibeauty/application/products/product_bloc.dart';
import 'package:ibeauty/application/shop/shop_bloc.dart';
import 'package:ibeauty/domain/service/helper.dart';
import 'package:ibeauty/domain/service/tr_keys.dart';
import 'package:ibeauty/infrastructure/local_storage/local_storage.dart';
import 'package:ibeauty/presentation/components/custom_scaffold.dart';
import 'package:ibeauty/presentation/components/custom_tab_bar.dart';
import 'package:ibeauty/presentation/components/master_item/master_item.dart';
import 'package:ibeauty/presentation/components/shimmer/products_shimmer.dart';
import 'package:ibeauty/presentation/components/shimmer/shops_shimmer.dart';
import 'package:ibeauty/presentation/components/shop_items/shop_item.dart';
import 'package:ibeauty/presentation/pages/products/widgets/simple_list_page.dart';
import 'package:ibeauty/presentation/style/style.dart';
import 'package:ibeauty/presentation/style/theme/theme.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../application/master/master_bloc.dart';

class LikePage extends StatefulWidget {
  const LikePage({Key? key}) : super(key: key);

  @override
  State<LikePage> createState() => _LikePageState();
}

class _LikePageState extends State<LikePage>
    with SingleTickerProviderStateMixin {
  late RefreshController discountRefresh;
  late RefreshController likeRefresh;
  late TabController tabController;
  final isLtr = LocalStorage.getLangLtr();

  List<Tab> listTabs = [
    Tab(
      child: Text(AppHelper.getTrn(TrKeys.salons)),
    ),
    Tab(
      child: Text(AppHelper.getTrn(TrKeys.masters)),
    ),
    Tab(
      child: Text(AppHelper.getTrn(TrKeys.products)),
    ),
  ];

  @override
  void initState() {
    tabController = TabController(length: listTabs.length, vsync: this);
    discountRefresh = RefreshController();
    likeRefresh = RefreshController();
    context
        .read<ProductBloc>()
        .add(ProductEvent.fetchLikeProduct(context: context));
    context.read<ShopBloc>().add(ShopEvent.fetchLikeShops(context: context));
    context
        .read<MasterBloc>()
        .add(MasterEvent.fetchLikeMasters(context: context));
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    discountRefresh.dispose();
    likeRefresh.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: (colors) => SafeArea(
        bottom: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.r),
              child: Text(
                AppHelper.getTrn(TrKeys.favourites),
                style:
                    CustomStyle.interNoSemi(color: colors.textBlack, size: 22),
              ),
            ),
            24.verticalSpace,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.r),
              child: CustomTabBar(
                tabController: tabController,
                tabs: listTabs,
              ),
            ),
            Expanded(
              child: TabBarView(controller: tabController, children: [
                _salon(colors, context),
                _master(colors, context),
                _product(colors, context),
              ]),
            ),
          ],
        ),
      ),
    );
  }

  Widget _product(CustomColorSet colors, BuildContext context) {
    return BlocBuilder<ProductBloc, ProductState>(builder: (context, state) {
      return state.isLoadingLike
          ? const ProductsShimmer()
          : state.isLoadingLike || state.likeProducts.isNotEmpty
              ? SimpleListPage(
                  list: state.likeProducts,
                  refreshController: likeRefresh,
                  onRefresh: () {
                    context.read<ProductBloc>().add(
                        ProductEvent.fetchLikeProduct(
                            context: context,
                            controller: likeRefresh,
                            isRefresh: true));
                  },
                )
              : _noItem(colors);
    });
  }

  Widget _salon(CustomColorSet colors, BuildContext context) {
    return BlocBuilder<ShopBloc, ShopState>(
      builder: (context, state) {
        return state.isLoadingLike
            ? const ShopsShimmer()
            : state.isLoadingLike || state.likeShops.isNotEmpty
                ? ListView.builder(
                    shrinkWrap: true,
                    padding: EdgeInsets.only(
                        right: 16.r, left: 16.r, top: 16.r, bottom: 100.r),
                    itemCount: state.likeShops.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(bottom: 8.r),
                        child: ShopItem(
                          shop: state.likeShops[index],
                          colors: colors,
                        ),
                      );
                    })
                : _noSalonItem(colors);
      },
    );
  }

  Widget _master(CustomColorSet colors, BuildContext context) {
    return BlocBuilder<MasterBloc, MasterState>(builder: (context, state) {
      return state.likeMasters.isNotEmpty
          ? GridView.builder(
              padding: EdgeInsets.only(
                  right: 16.r, left: 16.r, top: 16.r, bottom: 100.r),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 0.8.r,
                  crossAxisCount: 2,
                  mainAxisExtent: 320.r),
              itemCount: state.likeMasters.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4.r),
                  child: MasterItem(
                      like: true,
                      master: state.likeMasters[index],
                      colors: colors),
                );
              })
          : _noMasterItem(colors);
    });
  }

  Widget _noItem(CustomColorSet colors) {
    return Center(
      child: Column(
        children: [
          56.verticalSpace,
          Image.asset("assets/images/salonEmpty.png"),
          16.verticalSpace,
          Text(
            AppHelper.getTrn(TrKeys.emptyInFavorites),
            style: CustomStyle.interNoSemi(
              color: colors.textBlack,
              size: 24,
            ),
          ),
          12.verticalSpace,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 32.r),
            child: Text(
              AppHelper.getTrn(TrKeys.addYourFavoriteProduct),
              style: CustomStyle.interRegular(
                color: colors.textBlack,
                size: 16,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }

  Widget _noSalonItem(CustomColorSet colors) {
    return Center(
      child: Column(
        children: [
          56.verticalSpace,
          Image.asset("assets/images/salonEmpty.png"),
          16.verticalSpace,
          Text(
            AppHelper.getTrn(TrKeys.emptyInFavorites),
            style: CustomStyle.interNoSemi(
              color: colors.textBlack,
              size: 24,
            ),
          ),
          12.verticalSpace,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 32.r),
            child: Text(
              AppHelper.getTrn(TrKeys.addYourFavoriteSalons),
              style: CustomStyle.interRegular(
                color: colors.textBlack,
                size: 16,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }

  Widget _noMasterItem(CustomColorSet colors) {
    return Center(
      child: Column(
        children: [
          56.verticalSpace,
          Image.asset("assets/images/masterEmpty.png"),
          16.verticalSpace,
          Text(
            AppHelper.getTrn(TrKeys.emptyInFavorites),
            style: CustomStyle.interNoSemi(
              color: colors.textBlack,
              size: 24,
            ),
          ),
          12.verticalSpace,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 32.r),
            child: Text(
              AppHelper.getTrn(TrKeys.addYourFavoriteMasters),
              style: CustomStyle.interRegular(
                color: colors.textBlack,
                size: 16,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
