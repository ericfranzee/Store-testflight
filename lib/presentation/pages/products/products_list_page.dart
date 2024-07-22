import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ibeauty/app_constants.dart';
import 'package:ibeauty/application/filter/filter_bloc.dart';
import 'package:ibeauty/application/new_ui/new_ui_bloc.dart';
import 'package:ibeauty/application/products/product_bloc.dart';
import 'package:ibeauty/domain/model/model/product_model.dart';
import 'package:ibeauty/domain/service/helper.dart';
import 'package:ibeauty/domain/service/tr_keys.dart';
import 'package:ibeauty/infrastructure/local_storage/local_storage.dart';
import 'package:ibeauty/presentation/components/button/filter_button.dart';
import 'package:ibeauty/presentation/components/button/pop_button.dart';
import 'package:ibeauty/presentation/components/custom_scaffold.dart';
import 'package:ibeauty/presentation/pages/products/widgets/cart_button.dart';
import 'package:ibeauty/presentation/pages/products/widgets/new_scrollable_ui.dart';
import 'package:ibeauty/presentation/pages/products/widgets/simple_list_page.dart';
import 'package:ibeauty/presentation/route/app_route.dart';
import 'package:ibeauty/presentation/style/style.dart';
import 'package:ibeauty/presentation/style/theme/theme.dart';
import 'package:lottie/lottie.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../components/shimmer/products_shimmer.dart';
import 'widgets/grid_list_page.dart';
import 'widgets/one_list_page.dart';
import 'widgets/vertical_list_page.dart';

class ProductsListPage extends StatefulWidget {
  final List<ProductData> list;
  final String title;
  final int totalCount;
  final bool? isNewProduct;
  final bool? isMostSaleProduct;
  final int? categoryId;
  final int? shopId;
  final int? bannerId;
  final int? brandId;

  const ProductsListPage({
    Key? key,
    required this.list,
    required this.title,
    required this.totalCount,
    this.isNewProduct = false,
    this.isMostSaleProduct = false,
    this.categoryId,
    this.shopId,
    this.bannerId,
    this.brandId,
  }) : super(key: key);

  @override
  State<ProductsListPage> createState() => _ProductsListPageState();
}

class _ProductsListPageState extends State<ProductsListPage> {
  final isLtr = LocalStorage.getLangLtr();
  late RefreshController simpleController;
  late RefreshController gridController;
  late RefreshController verticalController;
  late RefreshController oneController;
  bool isFilter = false;

  @override
  void initState() {
    simpleController = RefreshController();
    gridController = RefreshController();
    verticalController = RefreshController();
    oneController = RefreshController();

    super.initState();
  }

  void onLoading(RefreshController refreshController, FilterState stateFilter) {
    List<int> brandIds = [];
    if (stateFilter.brands?.isEmpty ?? false) {
      if (widget.brandId != null) {
        brandIds.add(widget.brandId ?? 0);
      }

      brandIds.addAll(stateFilter.brands ?? []);
    }

    context.read<ProductBloc>().add(ProductEvent.fetchProducts(
        context: context,
        controller: refreshController,
        isNewProduct: widget.isNewProduct,
        isMostSaleProduct: widget.isMostSaleProduct,
        categoryId: widget.categoryId,
        bannerId: widget.bannerId,
        brandId: brandIds,
        categoryIds: stateFilter.categories,
        extrasId: stateFilter.extras,
        priceFrom: stateFilter.rangeValues?.start,
        priceTo: stateFilter.rangeValues?.end,
        shopId: widget.shopId));
  }

  void onRefresh(RefreshController refreshController, FilterState stateFilter) {
    List<int> brandIds = [];
    if (stateFilter.brands?.isEmpty ?? false) {
      if (widget.brandId != null) {
        brandIds.add(widget.brandId ?? 0);
      }
      brandIds.addAll(stateFilter.brands ?? []);
    }
    context.read<ProductBloc>().add(ProductEvent.fetchProducts(
        context: context,
        controller: refreshController,
        isRefresh: true,
        isNewProduct: widget.isNewProduct,
        isMostSaleProduct: widget.isMostSaleProduct,
        categoryId: widget.categoryId,
        bannerId: widget.bannerId,
        brandId: brandIds,
        categoryIds: stateFilter.categories,
        extrasId: stateFilter.extras,
        priceFrom: stateFilter.rangeValues?.start,
        priceTo: stateFilter.rangeValues?.end,
        shopId: widget.shopId));
  }

  @override
  void dispose() {
    verticalController.dispose();
    oneController.dispose();
    simpleController.dispose();
    gridController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductBloc, ProductState>(
      builder: (context, state) {
        return CustomScaffold(
          appBar: (colors) => _buildAppBar(colors, context, state),
          body: (colors) => state.commonProduct.isNotEmpty || state.isLoading
              ? BlocBuilder<FilterBloc, FilterState>(
                  builder: (context, stateFilter) {
                    switch (stateFilter.selectType) {
                      case LayoutType.twoH:
                        return state.isLoading
                            ? const ProductsShimmer()
                            : SimpleListPage(
                                list: state.commonProduct,
                                refreshController: simpleController,
                                onLoading: () =>
                                    onLoading(simpleController, stateFilter),
                                onRefresh: () =>
                                    onRefresh(simpleController, stateFilter),
                              );
                      case LayoutType.three:
                        return GridListPage(
                          list: state.commonProduct,
                          refreshController: gridController,
                          onLoading: () =>
                              onLoading(gridController, stateFilter),
                          onRefresh: () =>
                              onRefresh(gridController, stateFilter),
                        );
                      case LayoutType.one:
                        return OneListPage(
                          list: state.commonProduct,
                          refreshController: oneController,
                          onLoading: () =>
                              onLoading(oneController, stateFilter),
                          onRefresh: () =>
                              onRefresh(oneController, stateFilter),
                        );
                      case LayoutType.twoV:
                        return VerticalListPage(
                          list: state.commonProduct,
                          refreshController: verticalController,
                          onLoading: () =>
                              onLoading(verticalController, stateFilter),
                          onRefresh: () =>
                              onRefresh(verticalController, stateFilter),
                        );
                      case LayoutType.newUi:
                        return BlocProvider(
                          create: (context) => NewUiBloc(),
                          child: NewScrollableUi(list: state.commonProduct),
                        );
                    }
                  },
                )
              : _noItem(colors),
          floatingButtonLocation: FloatingActionButtonLocation.centerFloat,
          floatingButton: (colors) => Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.r),
            child: Row(
              children: [
                PopButton(colors: colors),
                const Spacer(),
                LocalStorage.getCartList()
                        .where((element) => element.count > 0)
                        .isNotEmpty
                    ? CartButton(colors: colors)
                    : const SizedBox.shrink(),
                const Spacer(),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _noItem(CustomColorSet colors) {
    return Center(
      child: Column(
        children: [
          Lottie.asset('assets/lottie/noItem.json'),
          16.verticalSpace,
          Text(
            AppHelper.getTrn(TrKeys.noProduct),
            style: CustomStyle.interNoSemi(color: colors.textBlack, size: 16),
          ),
        ],
      ),
    );
  }

  AppBar _buildAppBar(
      CustomColorSet colors, BuildContext context, ProductState state) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: colors.backgroundColor,
      title: Row(
        children: [
          SizedBox(
            width: 120.r,
            child: Text(
              widget.title,
              style: CustomStyle.interNoSemi(color: colors.textBlack, size: 18),
            ),
          ),
          12.horizontalSpace,
          Container(
            width: 6.r,
            height: 6.r,
            decoration: BoxDecoration(
                shape: BoxShape.circle, color: colors.newBoxColor),
          ),
          12.horizontalSpace,
          Text(
            "${state.totalCount} ${AppHelper.getTrn(TrKeys.products)}",
            style: CustomStyle.interNormal(color: colors.textBlack, size: 16),
          ),
          const Spacer(),
          FilterButton(
            colors: colors,
            onTap: () {
              AppRoute.goFilterBottomSheet(context, colors);
            },
          )
        ],
      ),
      elevation: 0,
    );
  }
}
