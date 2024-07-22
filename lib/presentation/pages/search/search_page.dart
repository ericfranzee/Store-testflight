import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ibeauty/application/products/product_bloc.dart';
import 'package:ibeauty/application/search/search_bloc.dart';
import 'package:ibeauty/domain/service/helper.dart';
import 'package:ibeauty/domain/service/tpying_delay.dart';
import 'package:ibeauty/domain/service/tr_keys.dart';
import 'package:ibeauty/infrastructure/local_storage/local_storage.dart';
import 'package:ibeauty/presentation/components/button/animation_button_effect.dart';
import 'package:ibeauty/presentation/components/button/pop_button.dart';
import 'package:ibeauty/presentation/components/custom_scaffold.dart';
import 'package:ibeauty/presentation/components/custom_textformfield.dart';
import 'package:ibeauty/presentation/route/app_route.dart';
import 'package:ibeauty/presentation/route/app_route_shop.dart';
import 'package:ibeauty/presentation/style/style.dart';
import 'package:ibeauty/presentation/style/theme/theme.dart';

import 'widgets/search_list_item.dart';

class SearchPage extends StatefulWidget {
  final int? shopId;

  const SearchPage({Key? key, this.shopId}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  late TextEditingController searchController;
  final _delayed = Delayed(milliseconds: 700);

  @override
  void initState() {
    searchController = SearchController();
    super.initState();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: (colors) => SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.r),
              child: SizedBox(
                height: 50.r,
                child: CustomTextFormField(
                  controller: searchController,
                  autoFocus: true,
                  radius: 10,
                  prefixIcon: const Icon(
                    FlutterRemix.search_2_line,
                    color: CustomStyle.textHint,
                  ),
                  hint: AppHelper.getTrn(TrKeys.search),
                  onChanged: (s) {
                    _delayed.run(() {
                      if (s.isNotEmpty) {
                        LocalStorage.setSearchRecentlyList(s);
                        if (widget.shopId != null) {
                          context.read<SearchBloc>()
                            ..add(SearchEvent.setQuery(
                                query: s, shopId: widget.shopId))
                            ..add(SearchEvent.searchProduct(context: context));
                          return;
                        }
                        context.read<SearchBloc>()
                          ..add(SearchEvent.setQuery(query: s))
                          ..add(SearchEvent.searchBrand(context: context))
                          ..add(SearchEvent.searchCategory(context: context))
                          ..add(SearchEvent.searchProduct(context: context))
                          ..add(SearchEvent.searchShops(context: context));
                      }
                    });
                  },
                ),
              ),
            ),
            24.verticalSpace,
            BlocBuilder<SearchBloc, SearchState>(
              builder: (context, state) {
                return state.query.isEmpty
                    ? _recently(colors)
                    : Expanded(
                        child: ListView(
                          shrinkWrap: true,
                          padding: EdgeInsets.symmetric(horizontal: 16.r),
                          children: [
                            SearchItem(
                                title: TrKeys.shops,
                                colors: colors,
                                list: state.shops,
                                onTap: (index) async {
                                  await AppRouteShop.goShopPage(
                                      context: context,
                                      shop: state.shops[index]);
                                  if (context.mounted) {
                                    context
                                        .read<ProductBloc>()
                                        .add(const ProductEvent.updateState());
                                  }
                                },
                                isLoading: state.isShopLoading,
                                query: state.query),
                            SearchItem(
                                title: TrKeys.products,
                                colors: colors,
                                list: state.products,
                                onTap: (index) async {
                                  await AppRoute.goProductPage(
                                      context: context,
                                      product: state.products[index]);
                                  if (context.mounted) {
                                    context
                                        .read<ProductBloc>()
                                        .add(const ProductEvent.updateState());
                                  }
                                },
                                isLoading: state.isProductLoading,
                                query: state.query),
                            SearchItem(
                                title: TrKeys.categories,
                                colors: colors,
                                list: state.categories,
                                onTap: (index) async {
                                  await AppRoute.goProductList(
                                      context: context,
                                      title: state.categories[index].translation
                                              ?.title ??
                                          "",
                                      categoryId: state.categories[index].id);
                                  if (context.mounted) {
                                    context
                                        .read<ProductBloc>()
                                        .add(const ProductEvent.updateState());
                                  }
                                },
                                isLoading: state.isCategoryLoading,
                                query: state.query),
                            SearchItem(
                                title: TrKeys.brand,
                                colors: colors,
                                list: state.brands,
                                onTap: (index) async {
                                  await AppRoute.goProductList(
                                      context: context,
                                      title: state.brands[index].title ?? "",
                                      categoryId: state.brands[index].id);
                                  if (context.mounted) {
                                    context
                                        .read<ProductBloc>()
                                        .add(const ProductEvent.updateState());
                                  }
                                },
                                isBrand: true,
                                isLoading: state.isBrandLoading,
                                query: state.query),
                          ],
                        ),
                      );
              },
            ),
          ],
        ),
      ),
      floatingButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingButton: (colors) => PopButton(colors: colors),
    );
  }

  Widget _recently(CustomColorSet colors) {
    final List list = LocalStorage.getSearchRecentlyList();
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.r),
            child: Text(
              AppHelper.getTrn(TrKeys.recently),
              style: CustomStyle.interNoSemi(color: colors.textBlack, size: 18),
            ),
          ),
          16.verticalSpace,
          Expanded(
              child: ListView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 16.r),
                  shrinkWrap: true,
                  itemCount: list.length,
                  itemBuilder: (context, index) {
                    return ButtonEffectAnimation(
                      onTap: () {
                        searchController.text = list[index];
                        if (widget.shopId != null) {
                          context.read<SearchBloc>()
                            ..add(SearchEvent.setQuery(
                                query: list[index], shopId: widget.shopId))
                            ..add(SearchEvent.searchProduct(context: context));
                          return;
                        }
                        context.read<SearchBloc>()
                          ..add(SearchEvent.setQuery(query: list[index]))
                          ..add(SearchEvent.searchBrand(context: context))
                          ..add(SearchEvent.searchCategory(context: context))
                          ..add(SearchEvent.searchProduct(context: context))
                          ..add(SearchEvent.searchShops(context: context));
                      },
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Icon(
                                FlutterRemix.search_2_line,
                                color: colors.textBlack,
                              ),
                              8.horizontalSpace,
                              Text(
                                list[index],
                                style: CustomStyle.interNormal(
                                    color: colors.textBlack, size: 14),
                              ),
                              const Spacer(),
                              IconButton(
                                  onPressed: () {
                                    LocalStorage.removeSearchRecentlyList(
                                        list[index]);
                                    context.read<SearchBloc>().add(
                                        const SearchEvent.updateRecently());
                                  },
                                  icon: Icon(
                                    FlutterRemix.close_line,
                                    color: colors.textBlack,
                                  ))
                            ],
                          ),
                          8.verticalSpace,
                          Divider(
                            color: colors.textHint,
                          )
                        ],
                      ),
                    );
                  }))
        ],
      ),
    );
  }
}
