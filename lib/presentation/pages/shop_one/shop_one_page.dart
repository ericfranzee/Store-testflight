import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ibeauty/presentation/components/custom_scaffold.dart';
import 'package:ibeauty/presentation/pages/shop/widgets/connect_button.dart';
import 'package:ibeauty/presentation/pages/shop_one/widgets/ads_shop_one.dart';
import 'package:ibeauty/presentation/pages/shop_one/widgets/category_shop_one.dart';
import 'package:ibeauty/presentation/pages/shop_one/widgets/looks_shop_one.dart';
import 'package:ibeauty/presentation/route/app_route.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../components/blur_wrap.dart';
import '../../components/button/pop_button.dart';
import 'widgets/most_products_shop_one.dart';
import 'widgets/new_products_shop_one.dart';
import 'widgets/shop_one_avatar.dart';

class ShopOnePage extends StatefulWidget {
  final int shopId;

  const ShopOnePage({Key? key, required this.shopId}) : super(key: key);

  @override
  State<ShopOnePage> createState() => _ShopOnePageState();
}

class _ShopOnePageState extends State<ShopOnePage> {
  late RefreshController categoryController;

  @override
  void initState() {
    categoryController = RefreshController();
    super.initState();
  }

  @override
  void dispose() {
    categoryController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: (colors) => Stack(
        children: [
          SizedBox(
            height: MediaQuery.sizeOf(context).height,
            width: MediaQuery.sizeOf(context).width,
            child: NestedScrollView(
              physics: const NeverScrollableScrollPhysics(),
              headerSliverBuilder: (BuildContext context, bool innerBox) {
                return [
                  SliverAppBar(
                    pinned: true,
                    snap: false,
                    floating: true,
                    forceElevated: true,
                    expandedHeight: 250.r,
                    toolbarHeight: 56.r,
                    elevation: 0,
                    leading: const SizedBox.shrink(),
                    backgroundColor: colors.backgroundColor,
                    flexibleSpace: FlexibleSpaceBar(
                      expandedTitleScale: 1.5,
                      collapseMode: CollapseMode.pin,
                      title: ShopOneName(colors: colors),
                      titlePadding: EdgeInsets.only(
                        top: MediaQuery.paddingOf(context).top + 10.r,
                      ),
                      background: ShopOneAvatar(colors: colors),
                    ),
                  )
                ];
              },
              body: ListView(
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                children: [
                  CategoryShopOne(
                    colors: colors,
                    categoryRefresh: categoryController,
                    shopId: widget.shopId,
                  ),
                  MostShopOneProductList(
                    colors: colors,
                    shopId: widget.shopId,
                  ),
                  LooksShopOne(colors: colors),
                  NewShopsOneProductList(
                    colors: colors,
                    shopId: widget.shopId,
                  ),
                  AdsShopOne(colors: colors)
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                top: MediaQuery.paddingOf(context).top + 4,
                left: 14.r,
                right: 14.r),
            child: Row(
              children: [
                BlurWrap(
                  radius: BorderRadius.circular(32.r),
                  child: Container(
                    color: colors.white.withOpacity(0.2),
                    child: PopButton(colors: colors),
                  ),
                ),
                const Spacer(),
                BlurWrap(
                  radius: BorderRadius.circular(32.r),
                  child: Container(
                    color: colors.white.withOpacity(0.2),
                    child: IconButton(
                        onPressed: () {
                          AppRoute.goSearchPage(
                              context: context, shopId: widget.shopId);
                        },
                        icon: Icon(
                          FlutterRemix.search_2_line,
                          color: colors.textBlack,
                        )),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
      floatingButton: (colors) => ConnectButtonShop(colors: colors),
    );
  }

}
