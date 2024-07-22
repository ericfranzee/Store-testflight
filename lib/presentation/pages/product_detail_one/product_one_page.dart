import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ibeauty/application/product_detail/product_detail_bloc.dart';
import 'package:ibeauty/application/products/product_bloc.dart';
import 'package:ibeauty/domain/model/model/review_data.dart';
import 'package:ibeauty/domain/service/helper.dart';
import 'package:ibeauty/domain/service/tr_keys.dart';
import 'package:ibeauty/infrastructure/local_storage/local_storage.dart';
import 'package:ibeauty/presentation/components/button/pop_button.dart';
import 'package:ibeauty/presentation/components/custom_scaffold.dart';
import 'package:ibeauty/presentation/pages/product_detail/widgets/bottom_widget.dart';
import 'package:ibeauty/presentation/pages/product_detail_one/widgets/product_extras_one.dart';
import 'package:ibeauty/presentation/pages/product_detail_one/widgets/product_info_one.dart';
import 'package:ibeauty/presentation/pages/product_detail_one/widgets/product_title_one.dart';
import 'package:ibeauty/presentation/pages/product_detail_one/widgets/related_and_viewed_products_one.dart';
import 'package:ibeauty/presentation/style/style.dart';

import 'package:ibeauty/presentation/style/theme/theme.dart';
import 'widgets/image_screen_one.dart';

class ProductOnePage extends StatefulWidget {
  const ProductOnePage({Key? key}) : super(key: key);

  @override
  State<ProductOnePage> createState() => _ProductOnePageState();
}

class _ProductOnePageState extends State<ProductOnePage> {
  late PageController pageController;

  @override
  void initState() {
    pageController = PageController();

    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: (colors) => BlocConsumer<ProductDetailBloc, ProductDetailState>(
        listenWhen: (p, n) {
          return p.selectImage?.id != n.selectImage?.id ||
              p.galleries.length != n.galleries.length;
        },
        listener: (context, state) {
          if (state.galleries.length == 1) {
            return;
          }
          if (!state.jumpTo) {
            pageController.jumpToPage(
                state.galleries.indexOf(state.selectImage ?? Galleries()));
          }
        },
        builder: (context, state) {
          return SafeArea(
            bottom: false,
            child: Column(
              children: [
                _appBar(colors, state, context),
                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 170.r),
                      child: Column(
                        children: [
                          ImageOneScreen(
                            controller: pageController,
                            colors: colors,
                            product: state.product,
                            selectImage: state.selectImage,
                            galleries: state.galleries,
                          ),
                          20.verticalSpace,
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ProductTitleOne(
                                product: state.product,
                                colors: colors,
                                selectStock: state.selectedStock,
                              ),
                              ProductExtrasOne(
                                list: state.galleries,
                                stocks: state.product?.stocks ?? [],
                                types: state.typedExtras,
                                colors: colors,
                                selectStock: state.selectedStock,
                              ),
                              RelatedAndViewedProductsOne(
                                colors: colors,
                                list: state.buyWithProduct,
                                title:
                                AppHelper.getTrn(TrKeys.withThisProductAlsoBuy),
                              ),
                              RelatedAndViewedProductsOne(
                                colors: colors,
                                list: state.relatedProduct,
                                title: AppHelper.getTrn(TrKeys.relatedProducts),
                              ),
                              ProductInfoOne(
                                colors: colors,
                                product: state.product,
                              ),
                              RelatedAndViewedProductsOne(
                                colors: colors,
                                list: state.viewedProduct,
                                title: AppHelper.getTrn(TrKeys.historyView),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
      floatingButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingButton: (colors) =>
          BlocBuilder<ProductDetailBloc, ProductDetailState>(
        builder: (context, state) {
          return BottomWidget(
            selectStock: state.selectedStock,
            colors: colors,
            product: state.product,
          );
        },
      ),
    );
  }

  Widget _appBar(
      CustomColorSet colors, ProductDetailState state, BuildContext context) {
    return Row(
      children: [
        PopButton(colors: colors),
        const Spacer(),
        IconButton(
            splashColor: CustomStyle.transparent,
            highlightColor: CustomStyle.transparent,
            onPressed: () {
              LocalStorage.setCompareList(state.product?.id ?? 0);
              context
                  .read<ProductDetailBloc>()
                  .add(const ProductDetailEvent.updateState());
            },
            icon: LocalStorage.getCompareList().contains(state.product?.id)
                ? Icon(
                    FlutterRemix.arrow_up_down_fill,
                    color: CustomStyle.primary,
                    size: 24.r,
                  )
                : Icon(
                    FlutterRemix.arrow_up_down_line,
                    size: 24.r,
                    color: colors.textBlack,
                  )),
        IconButton(
            splashColor: CustomStyle.transparent,
            highlightColor: CustomStyle.transparent,
            onPressed: () {
              LocalStorage.setLikedProductsList(state.product?.id ?? 0);
              context.read<ProductBloc>().add(const ProductEvent.updateState());
              context
                  .read<ProductDetailBloc>()
                  .add(const ProductDetailEvent.updateState());
            },
            icon:
                LocalStorage.getLikedProductsList().contains(state.product?.id)
                    ? Icon(
                        FlutterRemix.heart_3_fill,
                        color: CustomStyle.red,
                        size: 24.r,
                      )
                    : Icon(
                        FlutterRemix.heart_3_line,
                        size: 24.r,
                  color: colors.textBlack,
                      )),
      ],
    );
  }
}
