import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ibeauty/application/banner/banner_bloc.dart';
import 'package:ibeauty/application/blog/blog_bloc.dart';
import 'package:ibeauty/application/brand/brand_bloc.dart';
import 'package:ibeauty/application/category/category_bloc.dart';
import 'package:ibeauty/application/products/product_bloc.dart';
import 'package:ibeauty/application/profile/profile_bloc.dart';
import 'package:ibeauty/application/shop/shop_bloc.dart';
import 'package:ibeauty/application/story/story_bloc.dart';
import 'package:ibeauty/domain/di/dependency_manager.dart';
import 'package:ibeauty/domain/service/helper.dart';
import 'package:ibeauty/domain/service/tr_keys.dart';
import 'package:ibeauty/infrastructure/local_storage/local_storage.dart';
import 'package:ibeauty/presentation/components/blur_wrap.dart';
import 'package:ibeauty/presentation/components/button/animation_button_effect.dart';
import 'package:ibeauty/presentation/components/keyboard_dismisser.dart';
import 'package:ibeauty/presentation/components/loading.dart';
import 'package:ibeauty/presentation/style/style.dart';
import 'package:ibeauty/presentation/style/theme/theme_warpper.dart';

class CurrencyPage extends StatefulWidget {
  final ScrollController controller;

  const CurrencyPage({super.key, required this.controller});

  @override
  State<CurrencyPage> createState() => _CurrencyPageState();
}

class _CurrencyPageState extends State<CurrencyPage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context
          .read<ProfileBloc>()
          .add(ProfileEvent.getCurrency(context: context));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(builder: (colors, controller) {
      return KeyboardDismisser(
        isLtr: LocalStorage.getLangLtr(),
        child: BlurWrap(
          radius: BorderRadius.only(
            topRight: Radius.circular(24.r),
            topLeft: Radius.circular(24.r),
          ),
          child: Container(
            margin: MediaQuery.viewInsetsOf(context),
            width: double.infinity,
            decoration: BoxDecoration(
              color: colors.newBoxColor,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(24.r),
                topLeft: Radius.circular(24.r),
              ),
            ),
            padding: EdgeInsets.all(16.r),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                8.verticalSpace,
                Text(
                  AppHelper.getTrn(TrKeys.currency),
                  style: CustomStyle.interNoSemi(
                      color: colors.textBlack, size: 22),
                ),
                BlocBuilder<ProfileBloc, ProfileState>(
                  buildWhen: (p, n) {
                    return p.isCurrency != n.isCurrency;
                  },
                  builder: (context, state) {
                    return state.isCurrency
                        ? Padding(
                            padding: EdgeInsets.symmetric(vertical: 24.r),
                            child: const Loading(),
                          )
                        : Expanded(
                            child: ListView.builder(
                                controller: widget.controller,
                                padding:
                                    EdgeInsets.only(top: 24.r, bottom: 24.r),
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: state.currency.length,
                                itemBuilder: (context, index) {
                                  bool active =
                                      LocalStorage.getSelectedCurrency()?.id ==
                                          state.currency[index].id;
                                  return ButtonEffectAnimation(
                                    onTap: () async {
                                      LocalStorage.setSelectedCurrency(
                                          state.currency[index]);
                                      controller.toggle();
                                      controller.toggle();
                                      if (context.mounted) {
                                        context.read<ProfileBloc>().add(
                                            const ProfileEvent.updateLan());
                                        context.read<CategoryBloc>().add(
                                            CategoryEvent.fetchCategory(
                                                context: context,
                                                isRefresh: true));
                                        context.read<ProductBloc>()
                                          ..add(ProductEvent.fetchAllProduct(
                                              context: context,
                                              isRefresh: true))
                                          ..add(
                                              ProductEvent.fetchMostSaleProduct(
                                                  context: context,
                                                  isRefresh: true))
                                          ..add(ProductEvent.fetchNewProduct(
                                              context: context,
                                              isRefresh: true));
                                        context.read<ShopBloc>().add(
                                            ShopEvent.fetchShops(
                                                context: context,
                                                isRefresh: true));
                                        context.read<StoryBloc>().add(
                                            StoryEvent.fetchStory(
                                                context: context,
                                                isRefresh: true));
                                        context.read<BlogBloc>().add(
                                            BlogEvent.fetchBlog(
                                                context: context,
                                                isRefresh: true));
                                        context.read<BrandBloc>().add(
                                            BrandEvent.fetchBrands(
                                                context: context,
                                                isRefresh: true));
                                        context.read<BannerBloc>()
                                          ..add(BannerEvent.fetchAdsListProduct(
                                              context: context,
                                              isRefresh: true))
                                          ..add(BannerEvent.fetchAdsBanner(
                                              context: context,
                                              isRefresh: true))
                                          ..add(BannerEvent.fetchBanner(
                                              context: context,
                                              isRefresh: true))
                                          ..add(BannerEvent.fetchLooks(
                                              context: context,
                                              isRefresh: true));
                                      }

                                      if (LocalStorage.getToken().isNotEmpty) {
                                        authRepository.updateSetting();
                                        context.read<ProfileBloc>().add(
                                            ProfileEvent.fetchProfile(
                                                context: context));
                                      }
                                    },
                                    child: Column(
                                      children: [
                                        8.verticalSpace,
                                        Row(
                                          children: [
                                            Container(
                                              width: 18.r,
                                              height: 18.r,
                                              margin:
                                                  EdgeInsets.only(right: 10.r),
                                              decoration: BoxDecoration(
                                                  color: active
                                                      ? colors.primary
                                                      : colors.transparent,
                                                  shape: BoxShape.circle,
                                                  border: Border.all(
                                                      color: !active
                                                          ? colors.textHint
                                                          : colors.primary)),
                                              child: Icon(
                                                FlutterRemix.check_line,
                                                color: active
                                                    ? colors.white
                                                    : colors.transparent,
                                                size: 16.r,
                                              ),
                                            ),
                                            Text(
                                              "${state.currency[index].title ?? ""} (${state.currency[index].symbol})",
                                              style: CustomStyle.interNormal(
                                                  color: colors.textBlack,
                                                  size: 14),
                                            ),
                                          ],
                                        ),
                                        12.verticalSpace,
                                        Divider(
                                          color: colors.textHint,
                                        )
                                      ],
                                    ),
                                  );
                                }),
                          );
                  },
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}
