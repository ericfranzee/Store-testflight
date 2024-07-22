import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ibeauty/app_constants.dart';
import 'package:ibeauty/application/category/category_bloc.dart';
import 'package:ibeauty/application/main/main_bloc.dart';
import 'package:ibeauty/domain/service/helper.dart';
import 'package:ibeauty/domain/service/tr_keys.dart';
import 'package:ibeauty/presentation/components/button/animation_button_effect.dart';
import 'package:ibeauty/presentation/components/custom_network_image.dart';
import 'package:ibeauty/presentation/components/title.dart';
import 'package:ibeauty/presentation/route/app_route.dart';
import 'package:ibeauty/presentation/style/style.dart';
import 'package:ibeauty/presentation/style/theme/theme.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class CategoryTwoList extends StatelessWidget {
  final RefreshController categoryRefresh;
  final CustomColorSet colors;

  const CategoryTwoList({
    Key? key,
    required this.categoryRefresh,
    required this.colors,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryBloc, CategoryState>(
      builder: (context, state) {
        return state.categoriesOfService.isNotEmpty
            ? Column(
          children: [
            TitleWidget(
              title: AppHelper.getTrn(TrKeys.categories),
              titleColor: colors.textBlack,
              subTitle: AppHelper.getTrn(TrKeys.seeAll),
              onTap: (){
                context.read<MainBloc>().add(const MainEvent.changeIndex(index: 1));
              },
            ),
            12.verticalSpace,
            SizedBox(
              height: 150.r,
              child: Row(
                children: [
                  Expanded(
                    child: SmartRefresher(
                      controller: categoryRefresh,
                      scrollDirection: Axis.horizontal,
                      enablePullUp: true,
                      enablePullDown: false,
                      onLoading: () {
                        context.read<CategoryBloc>().add(
                            CategoryEvent.fetchCategory(
                                context: context,
                                controller: categoryRefresh));
                      },
                      child: ListView.builder(
                          key: const PageStorageKey<String>("list"),
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: state.categoriesOfService.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding:
                              EdgeInsets.symmetric(horizontal: 8.r),
                              child: ButtonEffectAnimation(
                                onTap: () {
                                  AppRoute.goSearchMap(
                                      context: context,
                                      categoryId: state
                                          .categoriesOfService[index].id);
                                },
                                child: Container(
                                  width: 150.r,
                                  margin: EdgeInsets.all(8.r),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.r),
                                      color:
                                      AppConstants.serviceColors[(index % 11)],
                                      image: DecorationImage(
                                          image: AssetImage(
                                              "assets/images/service${(index % 11) + 1}.png"),
                                          fit: BoxFit.cover)),
                                  child: Stack(
                                    children: [
                                      Positioned(
                                        bottom: 0,
                                        right: 10,
                                        child: CustomNetworkImage(
                                          url: state
                                              .categoriesOfService[index].img ??
                                              "",
                                          fit: BoxFit.contain,
                                          height: 86,
                                          width: 96,
                                          radius: 10,
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.all(20.r),
                                        child: Text(
                                          state.categoriesOfService[index]
                                              .translation?.title ??
                                              "",
                                          style: CustomStyle.interNoSemi(
                                              color: colors.textBlack, size: 16),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }),
                    ),
                  ),
                ],
              ),
            ),
          ],
        )
            : const SizedBox.shrink();
      },
    );
  }
}
