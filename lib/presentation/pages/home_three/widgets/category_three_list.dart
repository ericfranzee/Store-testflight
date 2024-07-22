import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ibeauty/application/category/category_bloc.dart';
import 'package:ibeauty/application/main/main_bloc.dart';
import 'package:ibeauty/domain/service/helper.dart';
import 'package:ibeauty/domain/service/tr_keys.dart';
import 'package:ibeauty/presentation/components/button/animation_button_effect.dart';
import 'package:ibeauty/presentation/components/custom_network_image.dart';
import 'package:ibeauty/presentation/components/title.dart';
import 'package:ibeauty/presentation/style/style.dart';
import 'package:ibeauty/presentation/style/theme/theme.dart';

class CategoryThreeList extends StatelessWidget {

  final CustomColorSet colors;

  const CategoryThreeList({
    Key? key,
    required this.colors,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryBloc, CategoryState>(
      builder: (context, state) {
        return state.categories.isNotEmpty || state.isLoadingCategory
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Divider(
                    color: CustomStyle.dividerColor,
                    thickness: 16.r,
                  ),
                  16.verticalSpace,
                  TitleWidget(
                    title: AppHelper.getTrn(TrKeys.categories),
                    titleColor: colors.textBlack,
                    subTitle: AppHelper.getTrn(TrKeys.seeAll),
                    onTap: () {
                      context
                          .read<MainBloc>()
                          .add(const MainEvent.changeIndex(index: 1));
                    },
                  ),
                  16.verticalSpace,
                  if (state.categories.isNotEmpty)
                    GridView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: 0.8.r,
                            crossAxisCount: 2,
                            mainAxisExtent: 200.r),
                        shrinkWrap: true,
                        padding: EdgeInsets.symmetric(horizontal: 16.r),
                        itemCount: state.categories.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.r),
                            child: ButtonEffectAnimation(
                              onTap: () {
                                context
                                    .read<MainBloc>()
                                    .add(const MainEvent.changeIndex(index: 1));
                                context.read<CategoryBloc>().add(
                                    CategoryEvent.selectCategoryTwo(
                                        context: context,
                                        category: state.categories[index]));
                              },
                              child: Container(
                                margin: EdgeInsets.only(bottom: 10.r),
                                decoration: BoxDecoration(
                                    border: Border.all(color: colors.icon),
                                    borderRadius: BorderRadius.circular(8.r)),
                                child: Column(
                                  children: [
                                    const Spacer(),
                                    CustomNetworkImage(
                                        url: state.categories[index].img ?? "",
                                        height: 100,
                                        width: 90,
                                        radius: 0),
                                    16.verticalSpace,
                                    Text(
                                      state.categories[index].translation
                                              ?.title ??
                                          "",
                                      style: CustomStyle.interRegular(
                                          color: colors.textBlack, size: 16),
                                    ),
                                    const Spacer(),
                                  ],
                                ),
                              ),
                            ),
                          );
                        }),
                  16.verticalSpace,
                  Divider(
                    color: CustomStyle.dividerColor,
                    thickness: 16.r,
                  ),
                  16.verticalSpace,
                ],
              )
            : const SizedBox.shrink();
      },
    );
  }
}
