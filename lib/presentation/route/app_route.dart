import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ibeauty/application/address/address_bloc.dart';
import 'package:ibeauty/application/auth/auth_bloc.dart';
import 'package:ibeauty/application/banner/banner_bloc.dart';
import 'package:ibeauty/application/blog/blog_bloc.dart';
import 'package:ibeauty/application/booking/booking_bloc.dart';
import 'package:ibeauty/application/brand/brand_bloc.dart';
import 'package:ibeauty/application/cart/cart_bloc.dart';
import 'package:ibeauty/application/category/category_bloc.dart';
import 'package:ibeauty/application/checkout/checkout_bloc.dart';
import 'package:ibeauty/application/compare/compare_bloc.dart';
import 'package:ibeauty/application/filter/filter_bloc.dart';
import 'package:ibeauty/application/main/main_bloc.dart';
import 'package:ibeauty/application/map/map_bloc.dart';
import 'package:ibeauty/application/master/master_bloc.dart';
import 'package:ibeauty/application/notification/notification_bloc.dart';
import 'package:ibeauty/application/order/order_bloc.dart';
import 'package:ibeauty/application/product_detail/product_detail_bloc.dart';
import 'package:ibeauty/application/products/product_bloc.dart';
import 'package:ibeauty/application/profile/profile_bloc.dart';
import 'package:ibeauty/application/review/review_bloc.dart';
import 'package:ibeauty/application/search/search_bloc.dart';
import 'package:ibeauty/application/shop/shop_bloc.dart';
import 'package:ibeauty/domain/di/dependency_manager.dart';
import 'package:ibeauty/domain/model/model/blog_model.dart';
import 'package:ibeauty/domain/model/model/location_model.dart';
import 'package:ibeauty/domain/model/model/order_model.dart';
import 'package:ibeauty/domain/model/model/product_model.dart';
import 'package:ibeauty/domain/model/model/review_data.dart';
import 'package:ibeauty/domain/model/response/banners_paginate_response.dart';
import 'package:ibeauty/domain/model/response/cart_response.dart';
import 'package:ibeauty/domain/model/response/delivery_point_response.dart';
import 'package:ibeauty/domain/model/response/refund_pagination_response.dart';
import 'package:ibeauty/domain/model/response/user_address_response.dart';
import 'package:ibeauty/domain/service/helper.dart';
import 'package:ibeauty/infrastructure/local_storage/local_storage.dart';
import 'package:ibeauty/presentation/components/bottom_sheets/ads_bottom_sheet.dart';
import 'package:ibeauty/presentation/components/bottom_sheets/banner_bottom_sheet.dart';
import 'package:ibeauty/presentation/components/bottom_sheets/blog_bottom_sheet.dart';
import 'package:ibeauty/presentation/components/bottom_sheets/looks_bottom_sheet.dart';
import 'package:ibeauty/presentation/pages/address/add_edit_address.dart';
import 'package:ibeauty/presentation/pages/blog/blog_screen.dart';
import 'package:ibeauty/presentation/pages/category/category_page.dart';
import 'package:ibeauty/presentation/pages/checkout/widget/select_delivery_point.dart';
import 'package:ibeauty/presentation/pages/compare/compare_list_page.dart';
import 'package:ibeauty/presentation/pages/compare/compare_product_page.dart';
import 'package:ibeauty/presentation/pages/order/refund_screen.dart';
import 'package:ibeauty/presentation/pages/search/search_location.dart';
import 'package:ibeauty/presentation/pages/search/search_map.dart';
import 'package:ibeauty/presentation/pages/my_digital_files/my_digital_list.dart';
import 'package:ibeauty/presentation/pages/auth/auth_page.dart';
import 'package:ibeauty/presentation/pages/cart/widget/note_product.dart';
import 'package:ibeauty/presentation/pages/search/search_page.dart';
import 'package:ibeauty/presentation/pages/checkout/checkout_page.dart';
import 'package:ibeauty/presentation/pages/checkout/congrats_page.dart';
import 'package:ibeauty/presentation/pages/checkout/widget/select_date.dart';
import 'package:ibeauty/presentation/pages/filter/filter_page.dart';
import 'package:ibeauty/presentation/pages/main/main_page.dart';
import 'package:ibeauty/presentation/pages/map/map_page.dart';
import 'package:ibeauty/presentation/pages/order/order_screen.dart';
import 'package:ibeauty/presentation/pages/order/orders_list.dart';
import 'package:ibeauty/presentation/components/web_view.dart';
import 'package:ibeauty/presentation/pages/product_detail/product_page.dart';
import 'package:ibeauty/presentation/pages/product_detail/widgets/only_image.dart';
import 'package:ibeauty/presentation/pages/product_detail_one/product_one_page.dart';
import 'package:ibeauty/presentation/pages/product_detail_two/product_two_page.dart';
import 'package:ibeauty/presentation/pages/products/products_list_page.dart';
import 'package:ibeauty/presentation/pages/review/review_page.dart';
import 'package:ibeauty/presentation/pages/review/widgets/review_images.dart';
import 'package:ibeauty/presentation/pages/search/select_time.dart';
import 'package:ibeauty/presentation/style/theme/theme.dart';
import 'package:osm_nominatim/osm_nominatim.dart';

import '../../application/story/story_bloc.dart';

abstract class AppRoute {
  AppRoute._();

  static goMain(BuildContext context) =>
      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
        builder: (_) {
          return MultiBlocProvider(
            providers: [
              BlocProvider<MainBloc>(create: (context) => MainBloc()),
              BlocProvider<ProfileBloc>(
                create: (context) => ProfileBloc(
                    userRepository, settingsRepository, galleryRepository),
              ),
              BlocProvider<ShopBloc>(
                create: (context) => ShopBloc(shopsRepository)
                  ..add(ShopEvent.fetchShops(context: context, isRefresh: true))
                  ..add(ShopEvent.fetchPopularShops(
                      context: context, isRefresh: true))
                  ..add(ShopEvent.fetchNewShops(
                      context: context, isRefresh: true)),
              ),
              BlocProvider<StoryBloc>(
                create: (context) => StoryBloc(shopsRepository)
                  ..add(
                      StoryEvent.fetchStory(context: context, isRefresh: true)),
              ),
              BlocProvider<ProductBloc>(
                create: (context) => ProductBloc(productsRepository)
                  ..add(ProductEvent.fetchMostSaleProduct(
                      context: context, isRefresh: true))
                  ..add(ProductEvent.fetchNewProduct(
                      context: context, isRefresh: true))
                  ..add(ProductEvent.fetchAllProduct(
                      context: context, isRefresh: true)),
              ),
              BlocProvider<BlogBloc>(
                create: (context) => BlogBloc(blogsRepository)
                  ..add(BlogEvent.fetchBlog(context: context, isRefresh: true)),
              ),
              BlocProvider<BannerBloc>(
                create: (context) => BannerBloc(bannersRepository)
                  ..add(BannerEvent.fetchBanner(
                      context: context, isRefresh: true))
                  ..add(BannerEvent.fetchAdsBanner(
                      context: context, isRefresh: true))
                  ..add(
                      BannerEvent.fetchLooks(context: context, isRefresh: true))
                  ..add(BannerEvent.fetchAdsListProduct(
                      context: context, isRefresh: true)),
              ),
              LocalStorage.getToken().isNotEmpty
                  ? BlocProvider<CartBloc>(
                      create: (context) => CartBloc(cartRepository)
                        ..add(CartEvent.getCart(context: context)),
                    )
                  : BlocProvider<CartBloc>(
                      create: (context) => CartBloc(cartRepository)),
              if (LocalStorage.getToken().isNotEmpty)
                BlocProvider<NotificationBloc>(
                    create: (context) => NotificationBloc(userRepository)
                      ..add(NotificationEvent.fetchCount(context: context))),
              BlocProvider<BrandBloc>(
                  create: (context) => BrandBloc(brandsRepository)
                    ..add(BrandEvent.fetchBrands(context: context))),
              BlocProvider<MasterBloc>(
                  create: (context) => MasterBloc(masterRepository)
                    ..add(MasterEvent.fetchMasters(context: context))),
              LocalStorage.getToken().isNotEmpty
                  ? BlocProvider<BookingBloc>(
                      create: (context) =>
                          BookingBloc(bookingRepository, paymentsRepository)
                            ..add(BookingEvent.fetchBookUpcoming(
                                context: context, isRefresh: true))
                            ..add(BookingEvent.fetchBookPast(
                                context: context, isRefresh: true)),
                    )
                  : BlocProvider<BookingBloc>(
                      create: (context) =>
                          BookingBloc(bookingRepository, paymentsRepository)),
              BlocProvider<CategoryBloc>(
                  create: (context) => CategoryBloc(categoriesRepository)
                    ..add(CategoryEvent.fetchCategoryOfService(
                        context: context, isRefresh: true))),
            ],
            child: const MainPage(),
          );
        },
      ), (route) => false);

  static goLogin(BuildContext context) =>
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (_) => BlocProvider(
              create: (context) => AuthBloc(authRepository),
              child: const AuthPage(),
            ),
          ),
          (route) => false);

  static goProductPage(
      {required BuildContext context, required ProductData product}) async {
    await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => ProductDetailBloc(productsRepository)
                ..add(ProductDetailEvent.fetchProductById(
                    context: context, product: product))
                ..add(ProductDetailEvent.fetchRelatedProduct(
                    context: context,
                    productUuid: product.uuid,
                    isRefresh: true))
                ..add(ProductDetailEvent.fetchViewedProducts(
                    context: context, productId: product.id))
                ..add(ProductDetailEvent.fetchBuyWithProduct(
                    context: context, productId: product.id)),
            ),
            BlocProvider.value(value: context.read<ProductBloc>()),
            BlocProvider.value(value: context.read<MainBloc>()),
            BlocProvider.value(value: context.read<CartBloc>())
          ],
          child: AppHelper.getType() == 0
              ? const ProductPage()
              : AppHelper.getType() == 1
                  ? const ProductOnePage()
                  : const ProductTwoPage(),
        ),
      ),
    );
  }

  static goOnlyImagePage(
      {required BuildContext context,
      required List<Galleries> list,
      int? selectIndex}) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => MultiBlocProvider(
          providers: [
            BlocProvider.value(value: context.read<ProductDetailBloc>())
          ],
          child: OnlyImagePage(list: list, selectIndex: selectIndex ?? 0),
        ),
      ),
    );
  }

  static goCheckoutPage(
      {required BuildContext context, required bool fullDigital}) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => MultiBlocProvider(providers: [
          BlocProvider(
              create: (context) =>
                  CheckoutBloc(paymentsRepository, addressRepository)
                    ..add(CheckoutEvent.fetchPayments(context: context))
                    ..add(CheckoutEvent.fetchUserAddress(
                        context: context, isRefresh: true))
                    ..add(CheckoutEvent.fetchDeliveryPoint(context: context))
                    ..add(CheckoutEvent.fetchDeliveryPrice(context: context))),
          BlocProvider(
              create: (context) => OrderBloc(
                  ordersRepository, paymentsRepository, cartRepository)),
          BlocProvider(create: (context) => AddressBloc(addressRepository)),
          BlocProvider.value(
            value: context.read<CartBloc>(),
          ),
          BlocProvider.value(
            value: context.read<MainBloc>(),
          ),
          BlocProvider.value(
            value: context.read<ProductBloc>(),
          ),
        ], child: CheckoutPage(fullDigital: fullDigital)),
      ),
    );
  }

  static Future goProductList(
          {required BuildContext context,
          List<ProductData>? list,
          String? title,
          int? total,
          bool? isNewProduct,
          bool? isMostSaleProduct,
          int? categoryId,
          int? brandId,
          int? bannerId,
          int? shopId}) async =>
      await Navigator.of(context).push(
        MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => ProductBloc(productsRepository)
                  ..add(ProductEvent.fetchProducts(
                      context: context,
                      isRefresh: true,
                      list: list,
                      isNewProduct: isNewProduct,
                      isMostSaleProduct: isMostSaleProduct,
                      categoryId: categoryId,
                      bannerId: bannerId,
                      brandId: brandId == null ? null : [brandId],
                      shopId: shopId)),
              ),
              BlocProvider.value(value: context.read<MainBloc>()),
              BlocProvider.value(
                value: context.read<CartBloc>(),
              ),
              BlocProvider(
                create: (context) =>
                    FilterBloc(productsRepository, shopsRepository)
                      ..add(FilterEvent.fetchExtras(
                          context: context,
                          categoryId: categoryId,
                          type: categoryId != null
                              ? "category"
                              : isMostSaleProduct ?? false
                                  ? "most_sold"
                                  : isNewProduct ?? false
                                      ? "news_letter"
                                      : null,
                          isPrice: true))
                      ..add(FilterEvent.setBrands(id: brandId ?? -1)),
              ),
            ],
            child: ProductsListPage(
              list: list ?? [],
              title: title ?? "",
              totalCount: total ?? 0,
              isMostSaleProduct: isMostSaleProduct,
              isNewProduct: isNewProduct,
              categoryId: categoryId,
              shopId: shopId,
              brandId: brandId,
              bannerId: bannerId,
            ),
          ),
        ),
      );

  static goBlogBottomSheet(BuildContext context, BlogData blog) {
    return AppHelper.showCustomModalBottomSheet(
      context: context,
      modal: BlocProvider.value(
        value: context.read<BlogBloc>()
          ..add(BlogEvent.fetchBlogById(
              context: context, id: blog.id ?? 0, blog: blog)),
        child: const BlogBottomSheet(),
      ),
    );
  }

  static goBlogPage(BuildContext context, BlogData blog) {
    return Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => BlocProvider.value(
          value: context.read<BlogBloc>()
            ..add(BlogEvent.fetchBlogById(
                context: context, id: blog.id ?? 0, blog: blog)),
          child: const BlogScreen(),
        ),
      ),
    );
  }

  static goNoteForProduct(
      BuildContext context, CartDetailProduct? product, String? note) {
    return AppHelper.showCustomModalBottomSheet(
      paddingTop: 0,
      context: context,
      modal: BlocProvider.value(
        value: context.read<CartBloc>(),
        child: NoteProduct(cartItem: product, note: note),
      ),
    );
  }

  static Future goMap(BuildContext context) async {
    await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => MultiBlocProvider(providers: [
          BlocProvider(create: (context) => MapBloc()),
        ], child: const MapPage()),
      ),
    );
  }

  static Future goSearchMap(
      {required BuildContext context,
      LocationModel? location,
      int? categoryId}) async {
    await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => MultiBlocProvider(providers: [
          BlocProvider(create: (context) => MapBloc()),
          BlocProvider.value(
            value: context.read<ShopBloc>()
              ..add(
                ShopEvent.fetchNearShops(
                  context: context,
                  onSuccess: () {},
                  category: categoryId,
                  location: location ??
                      LocationModel(
                        latitude: AppHelper.getInitialLatitude().toString(),
                        longitude: AppHelper.getInitialLongitude().toString(),
                      ),
                ),
              ),
          ),
          BlocProvider.value(value: context.read<ProductBloc>()),
          BlocProvider.value(value: context.read<CartBloc>()),
          BlocProvider.value(value: context.read<MainBloc>()),
        ], child: SearchMapPage(categoryId: categoryId, location: location)),
      ),
    );
  }

  static Future<Place> goSearchLocation(BuildContext context) async {
    return await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => MultiBlocProvider(providers: [
          BlocProvider(create: (context) => MapBloc()),
        ], child: const SearchLocationPage()),
      ),
    );
  }

  static goLookBottomSheet(
      BuildContext context, BannerData banner, CustomColorSet colors) {
    AppHelper.showCustomModalBottomSheet(
      context: context,
      modal: MultiBlocProvider(
        providers: [
          BlocProvider.value(
              value: context.read<BannerBloc>()
                ..add(BannerEvent.fetchProduct(
                    context: context, id: banner.id ?? 0))),
          BlocProvider.value(value: context.read<MainBloc>()),
          BlocProvider.value(value: context.read<CartBloc>()),
          BlocProvider.value(value: context.read<ProductBloc>()),
        ],
        child: LooksBottomSheet(look: banner, colors: colors),
      ),
    );
  }

  static goAdsBottomSheet(
      BuildContext context, BannerData banner, CustomColorSet colors) {
    AppHelper.showCustomModalBottomSheet(
      context: context,
      modal: MultiBlocProvider(
        providers: [
          BlocProvider.value(
              value: context.read<BannerBloc>()
                ..add(BannerEvent.fetchAdsProduct(
                    context: context, id: banner.id ?? 0))),
          BlocProvider.value(value: context.read<MainBloc>()),
          BlocProvider.value(value: context.read<CartBloc>()),
          BlocProvider.value(value: context.read<ProductBloc>()),
        ],
        child: AdsBottomSheet(look: banner, colors: colors),
      ),
    );
  }

  static goBannerBottomSheet(
      BuildContext context, BannerData banner, CustomColorSet colors) {
    AppHelper.showCustomModalBottomSheet(
      context: context,
      modal: MultiBlocProvider(
        providers: [
          BlocProvider.value(value: context.read<BannerBloc>()),
          BlocProvider.value(value: context.read<MainBloc>()),
          BlocProvider.value(value: context.read<CartBloc>()),
        ],
        child: BannerBottomSheet(banner: banner, colors: colors),
      ),
    );
  }

  static goFilterBottomSheet(BuildContext context, CustomColorSet colors) {
    return AppHelper.showCustomModalBottomSheetDrag(
      paddingTop: 90.r,
      context: context,
      modal: (c) => MultiBlocProvider(
        providers: [
          BlocProvider.value(
            value: context.read<FilterBloc>(),
          ),
          BlocProvider.value(
            value: context.read<ProductBloc>(),
          ),
        ],
        child: FilterPage(controller: c, colors: colors),
      ),
    );
  }

  static Future goCategoryPage({required BuildContext context}) async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => MultiBlocProvider(
          providers: [
            BlocProvider.value(value: context.read<ProductBloc>()),
            BlocProvider.value(value: context.read<ShopBloc>()),
            BlocProvider<CategoryBloc>(
              create: (context) => CategoryBloc(categoriesRepository)
                ..add(CategoryEvent.fetchCategory(
                    context: context, isRefresh: true))
                ..add(CategoryEvent.fetchCategoryOfService(
                    context: context, isRefresh: true)),
            ),
            BlocProvider.value(value: context.read<MainBloc>()),
            BlocProvider.value(value: context.read<CartBloc>()),
          ],
          child: const CategoryPage(),
        ),
      ),
    );
  }

  static goSearchPage({required BuildContext context, int? shopId}) {
    return Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => MultiBlocProvider(
          providers: [
            BlocProvider.value(
              value: context.read<ProductBloc>(),
            ),
            BlocProvider.value(
              value: context.read<ShopBloc>(),
            ),
            BlocProvider.value(value: context.read<MainBloc>()),
            BlocProvider.value(value: context.read<CartBloc>()),
            BlocProvider(
              create: (context) => SearchBloc(shopsRepository,
                  productsRepository, categoriesRepository, brandsRepository),
            ),
          ],
          child: SearchPage(shopId: shopId),
        ),
      ),
    );
  }

  static goComparePage({required BuildContext context}) {
    return Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => MultiBlocProvider(
          providers: [
            BlocProvider.value(value: context.read<ProductBloc>()),
            BlocProvider.value(value: context.read<MainBloc>()),
            BlocProvider.value(value: context.read<CartBloc>()),
            BlocProvider(
                create: (context) => CompareBloc(productsRepository)
                  ..add(CompareEvent.fetchCompare(
                      context: context, isRefresh: true)))
          ],
          child: const CompareListPage(),
        ),
      ),
    );
  }

  static goReviewPage({
    required BuildContext context,
    required CustomColorSet colors,
    int? shopId,
    int? productId,
    int? blogId,
    int? driverId,
    int? orderId,
    String? productUuid,
  }) {
    return AppHelper.showCustomModalBottomSheetDrag(
      paddingTop: 0,
      context: context,
      modal: (c) => BlocProvider(
        create: (context) => ReviewBloc(reviewRepository, galleryRepository)
          ..add(ReviewEvent.fetchReviewList(
              context: context,
              shopId: shopId,
              productUuid: productUuid,
              blogId: blogId,
              driverId: driverId,
              isRefresh: true))
          ..add(ReviewEvent.fetchReview(
              context: context,
              shopId: shopId,
              driverId: driverId,
              productId: productId,
              blogId: blogId)),
        child: ReviewPage(
          colors: colors,
          blogId: blogId,
          controller: c,
          shopId: shopId,
          orderId: orderId,
          productId: productId,
          productUuid: productUuid,
        ),
      ),
    );
  }

  static goSelectDate(
      {required BuildContext context,
      required CustomColorSet colors,
      required DateTime? dateTime}) {
    return AppHelper.showCustomModalBottomSheet(
        context: context,
        paddingTop: 400.r,
        modal: BlocProvider.value(
          value: context.read<CheckoutBloc>(),
          child: SelectDate(colors: colors, dateTime: dateTime),
        ));
  }

  static Future<DateTime?> goSelectDateSearch(
      {required BuildContext context,
      required CustomColorSet colors,
      required DateTime? dateTime}) async {
    return await AppHelper.showSelectDate(context: context, colors: colors);
  }

  static Future goSelectTime({required BuildContext context}) async {
    return await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => BlocProvider.value(
          value: context.read<ProfileBloc>()
            ..add(ProfileEvent.getHelps(context: context)),
          child: const SelectTimePage(),
        ),
      ),
    );
  }

  static goCongratsPage(BuildContext context) {
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const CongratsPage()),
        (route) => route.isFirst);
  }

  static goSelectDeliveryPoint(
      {required BuildContext context, required List<DeliveryPoint> list}) {
    return Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => BlocProvider.value(
          value: context.read<CheckoutBloc>(),
          child: SelectDeliveryPoint(list: list),
        ),
      ),
    );
  }

  static goOrdersList({required BuildContext context}) {
    return Navigator.of(context).push(
      MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
                providers: [
                  BlocProvider(
                      create: (context) => OrderBloc(
                          ordersRepository, paymentsRepository, cartRepository)
                        ..add(OrderEvent.fetchActiveOrders(context: context))
                        ..add(OrderEvent.fetchRefundOrders(context: context))),
                  BlocProvider.value(value: context.read<ProductBloc>()),
                  BlocProvider.value(value: context.read<MainBloc>()),
                  BlocProvider.value(value: context.read<CartBloc>()),
                ],
                child: const OrdersListPage(),
              )),
    );
  }

  static goRefundOrderPage(
      BuildContext context, CustomColorSet colors, RefundModel? refund) {
    return AppHelper.showCustomModalBottomSheetDrag(
      context: context,
      paddingTop: MediaQuery.sizeOf(context).height / 10,
      modal: (c) => MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) =>
                OrderBloc(ordersRepository, paymentsRepository, cartRepository)
                  ..add(
                    OrderEvent.fetchRefundOrderById(
                      context: context,
                      id: refund?.id ?? 0,
                      refund: refund,
                    ),
                  ),
          ),
          BlocProvider.value(value: context.read<ProductBloc>()),
          BlocProvider.value(value: context.read<MainBloc>()),
          BlocProvider.value(value: context.read<CartBloc>()),
        ],
        child: RefundScreen(colors: colors, controller: c),
      ),
    );
  }

  static goOrderPage(BuildContext context, OrderShops order) {
    return AppHelper.showCustomModalBottomSheetDrag(
      context: context,
      paddingTop: MediaQuery.sizeOf(context).height / 10,
      modal: (c) => MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) =>
                OrderBloc(ordersRepository, paymentsRepository, cartRepository)
                  ..add(
                    OrderEvent.fetchOrderById(
                      context: context,
                      id: order.id ?? 0,
                      order: OrderModel(orderShops: [order]),
                    ),
                  ),
          ),
          BlocProvider.value(value: context.read<ProductBloc>()),
          BlocProvider.value(value: context.read<MainBloc>()),
          BlocProvider.value(value: context.read<CartBloc>()),
        ],
        child: OrderScreen(controller: c),
      ),
    );
  }

  static Future goAddEditAddress(
      {required BuildContext context, UserAddress? address}) async {
    return await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => BlocProvider(
          create: (context) => AddressBloc(addressRepository),
          child: AddEditAddressPage(address: address),
        ),
      ),
    );
  }

  static Future goWebView({required BuildContext context, String? url}) async {
    return await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => BlocProvider(
          create: (context) => AddressBloc(addressRepository),
          child: WebViewPage(url: url ?? ""),
        ),
      ),
    );
  }

  static Future goCompareProductPage(
      {required BuildContext context, required List<ProductData> list}) async {
    return await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => MultiBlocProvider(
          providers: [
            BlocProvider.value(
              value: context.read<CompareBloc>(),
            ),
            BlocProvider.value(value: context.read<ProductBloc>()),
            BlocProvider.value(value: context.read<MainBloc>()),
            BlocProvider.value(value: context.read<CartBloc>()),
          ],
          child: CompareProductPage(list: list),
        ),
      ),
    );
  }

  static goMyDigitalList({required BuildContext context}) {
    return Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => MultiBlocProvider(
          providers: [
            BlocProvider.value(
              value: context.read<ProfileBloc>()
                ..add(ProfileEvent.fetchDigitalList(
                    context: context, isRefresh: true)),
            ),
            BlocProvider.value(value: context.read<ProductBloc>()),
            BlocProvider.value(value: context.read<MainBloc>()),
            BlocProvider.value(value: context.read<CartBloc>()),
          ],
          child: const MyDigitalList(),
        ),
      ),
    );
  }

  static goReviewImages(
      {required BuildContext context,
      required int index,
      required List<Galleries> list}) {
    return Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => ReviewImages(selectIndex: index, list: list),
      ),
    );
  }
}
