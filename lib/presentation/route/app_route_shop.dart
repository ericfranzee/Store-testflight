import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cea_zed/application/banner/banner_bloc.dart';
import 'package:cea_zed/application/become_seller/become_seller_bloc.dart';
import 'package:cea_zed/application/cart/cart_bloc.dart';
import 'package:cea_zed/application/category/category_bloc.dart';
import 'package:cea_zed/application/filter/filter_bloc.dart';
import 'package:cea_zed/application/gift_cart/gift_cart_bloc.dart';
import 'package:cea_zed/application/main/main_bloc.dart';
import 'package:cea_zed/application/master/master_bloc.dart';
import 'package:cea_zed/application/membership/membership_bloc.dart';
import 'package:cea_zed/application/product_detail/product_detail_bloc.dart';
import 'package:cea_zed/application/products/product_bloc.dart';
import 'package:cea_zed/application/profile/profile_bloc.dart';
import 'package:cea_zed/application/review/review_bloc.dart';
import 'package:cea_zed/application/service/service_bloc.dart';
import 'package:cea_zed/application/shop/shop_bloc.dart';
import 'package:cea_zed/application/story/story_bloc.dart';
import 'package:cea_zed/domain/di/dependency_manager.dart';
import 'package:cea_zed/domain/model/model/filter_shop_model.dart';
import 'package:cea_zed/domain/model/model/location_model.dart';
import 'package:cea_zed/domain/model/model/shop_model.dart';
import 'package:cea_zed/domain/model/response/gift_cart_response.dart';
import 'package:cea_zed/domain/model/response/membership_response.dart';
import 'package:cea_zed/domain/service/helper.dart';
import 'package:cea_zed/presentation/pages/become_seller/become_seller.dart';
import 'package:cea_zed/presentation/pages/filter/filter_shop_page.dart';
import 'package:cea_zed/presentation/pages/gift_cart/gift_cart_payment.dart';
import 'package:cea_zed/presentation/pages/membership/membership_payment.dart';
import 'package:cea_zed/presentation/pages/shop/shop_page.dart';
import 'package:cea_zed/presentation/pages/membership/membership_bottom_sheet.dart';
import 'package:cea_zed/presentation/pages/shop_list/shop_list_page.dart';
import 'package:cea_zed/presentation/pages/story/story_page.dart';
import 'package:cea_zed/presentation/style/theme/theme.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

abstract class AppRouteShop {
  AppRouteShop._();

  static Future goShopPage(
      {required BuildContext context, required ShopData? shop}) async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => ProductBloc(productsRepository)
                  ..add(ProductEvent.fetchMostSaleShopProduct(
                    context: context,
                    isRefresh: true,
                    shopId: shop?.id,
                  ))
                  ..add(ProductEvent.fetchNewShopProduct(
                      context: context, isRefresh: true, shopId: shop?.id)),
              ),
              BlocProvider(
                create: (context) => ShopBloc(shopsRepository)
                  ..add(ShopEvent.fetchShopById(context: context, shop: shop))
                  ..add(ShopEvent.generateLink(context: context))
                  ..add(ShopEvent.fetchNearShops(
                      context: context,
                      onSuccess: () {},
                      withoutShopId: shop?.id,
                      location: shop?.location))
                  ..add(ShopEvent.fetchShopsImages(
                      context: context, shopId: shop?.id)),
              ),
              BlocProvider(
                create: (context) => ServiceBloc(serviceRepository)
                  ..add(ServiceEvent.fetchCategoryServices(
                      context: context, isRefresh: true, shopId: shop?.id ?? 0))
                  ..add(ServiceEvent.fetchServices(
                      context: context, shopId: shop?.id, isRefresh: true)),
              ),
              BlocProvider(
                create: (context) =>
                    ReviewBloc(reviewRepository, galleryRepository)
                      ..add(ReviewEvent.fetchReviewList(
                          context: context,
                          isRefresh: true,
                          shopId: shop?.id ?? 0))
                      ..add(ReviewEvent.fetchReviewOptions(
                          context: context, shopId: shop?.id)),
              ),
              if (AppHelper.getType() != 0)
                BlocProvider(
                  create: (context) => CategoryBloc(categoriesRepository)
                    ..add(CategoryEvent.fetchCategory(
                        context: context,
                        isRefresh: true,
                        shopId: shop?.id ?? 0)),
                ),
              if (AppHelper.getType() != 0)
                BlocProvider(
                  create: (context) => BannerBloc(bannersRepository)
                    ..add(BannerEvent.fetchLooks(
                        context: context,
                        isRefresh: true,
                        shopId: shop?.id ?? 0))
                    ..add(BannerEvent.fetchAdsListProduct(
                        context: context,
                        isRefresh: true,
                        shopId: shop?.id ?? 0)),
                ),
              BlocProvider.value(value: context.read<MainBloc>()),
              BlocProvider.value(value: context.read<CartBloc>()),
              BlocProvider(
                create: (context) => ProductDetailBloc(productsRepository),
              ),
              BlocProvider(
                create: (context) => MasterBloc(masterRepository)
                  ..add(MasterEvent.fetchMasters(
                      context: context,
                      isRefresh: true,
                      shopId: shop?.id ?? 0)),
              ),
              BlocProvider(
                create: (context) =>
                    MembershipBloc(shopsRepository, paymentsRepository)
                      ..add(MembershipEvent.fetchMembership(
                          context: context,
                          isRefresh: true,
                          shopId: shop?.id ?? 0)),
              ),
              BlocProvider(
                create: (context) =>
                    GiftCartBloc(shopsRepository, paymentsRepository)
                      ..add(GiftCartEvent.fetchGiftCart(
                          context: context,
                          isRefresh: true,
                          shopId: shop?.id ?? 0)),
              ),
            ],
            child: ShopPage(
              shopId: shop?.id ?? 0,
            )
            // : AppHelper.getType() == 1
            //     ? ShopOnePage(
            //         shopId: shop?.id ?? 0,
            //       )
            //     : ShopTwoPage(
            //         shopId: shop?.id ?? 0,
            //       ),
            ),
      ),
    );
  }

  static Future goShopListPage({required BuildContext context}) async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => MultiBlocProvider(
          providers: [
            BlocProvider.value(value: context.read<ProductBloc>()),
            BlocProvider(
              create: (context) => ShopBloc(shopsRepository)
                ..add(ShopEvent.fetchShops(context: context)),
            ),
            BlocProvider.value(value: context.read<MainBloc>()),
            BlocProvider.value(value: context.read<CartBloc>()),
          ],
          child: const ShopListPage(),
        ),
      ),
    );
  }

  static goBecomeSeller({required BuildContext context}) {
    return Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) =>
                  BecomeSellerBloc(shopsRepository, galleryRepository),
            ),
            BlocProvider.value(
              value: context.read<ProfileBloc>()
                ..add(ProfileEvent.fetchProfile(context: context)),
            ),
          ],
          child: const BecomeSellerPage(),
        ),
      ),
    );
  }

  static goFilterShopBottomSheet({
    required BuildContext context,
    required CustomColorSet colors,
    FilterShopModel? filter,
    bool isNear = false,
    LocationModel? location,
    int? categoryId,
  }) {
    return AppHelper.showCustomModalBottomSheetDrag(
      paddingTop: 90.r,
      context: context,
      modal: (c) => MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => FilterBloc(productsRepository, shopsRepository)
              ..add(FilterEvent.fetchTags(context: context))
              ..add(FilterEvent.setFilter(filter: filter)),
          ),
          BlocProvider.value(value: context.read<ShopBloc>())
        ],
        child: FilterShopPage(
          controller: c,
          colors: colors,
          filter: filter,
          isNear: isNear,
          location: location,
          categoryId: categoryId,
        ),
      ),
    );
  }

  static Future goStoryPage(
      {required BuildContext context,
      required RefreshController controller,
      required int index}) async {
    return await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => MultiBlocProvider(
          providers: [
            BlocProvider.value(
              value: context.read<StoryBloc>(),
            ),
            BlocProvider.value(value: context.read<ProductBloc>()),
            BlocProvider.value(value: context.read<MainBloc>()),
            BlocProvider.value(value: context.read<CartBloc>()),
          ],
          child: StoryPage(controller: controller, index: index),
        ),
      ),
    );
  }

  static goMembershipBottomSheet({
    required BuildContext context,
    required MembershipModel? model,
    required CustomColorSet colors,
    bool enableBuy = true,
  }) {
    return AppHelper.showCustomModalBottomSheetDrag(
      initialChildSize: 0.5,
      context: context,
      modal: (c) => BlocProvider.value(
          value: context.read<GiftCartBloc>(),
          child: MembershipBottomSheet(
            colors: colors,
            controller: c,
            membership: model,
            enableBuy: enableBuy,
          )),
    );
  }

  static goMembershipPaymentBottomSheet(
      {required BuildContext context,
      required MembershipModel? model,
      required CustomColorSet colors}) {
    return AppHelper.showCustomModalBottomSheetDrag(
      initialChildSize: 0.5,
      context: context,
      modal: (c) => BlocProvider.value(
          value: context.read<MembershipBloc>()
            ..add(MembershipEvent.fetchPayments(context: context)),
          child: MembershipPaymentBottomSheet(
              colors: colors, controller: c, model: model)),
    );
  }

  static goGiftCartPaymentBottomSheet(
      {required BuildContext context,
      required GiftCartModel? model,
      required CustomColorSet colors}) {
    return AppHelper.showCustomModalBottomSheetDrag(
      initialChildSize: 0.5,
      context: context,
      modal: (c) => BlocProvider.value(
          value: context.read<GiftCartBloc>()
            ..add(GiftCartEvent.fetchPayments(context: context)),
          child: GiftCartPaymentBottomSheet(
              colors: colors, controller: c, model: model)),
    );
  }
}
