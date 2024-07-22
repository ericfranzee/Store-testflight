import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ibeauty/application/category/category_bloc.dart';
import 'package:ibeauty/application/main/main_bloc.dart';
import 'package:ibeauty/domain/service/helper.dart';
import 'package:ibeauty/domain/service/tr_keys.dart';
import 'package:ibeauty/presentation/components/sub_category_item.dart';
import 'package:ibeauty/presentation/components/title.dart';
import 'package:ibeauty/presentation/style/style.dart';
import 'package:ibeauty/presentation/style/theme/theme.dart';

class SubCategoryList extends StatelessWidget {
  final CustomColorSet colors;

  const SubCategoryList({Key? key, required this.colors}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryBloc, CategoryState>(
      builder: (context, state) {
        return state.selectCategory != null &&
                (state.selectCategory?.children?.isNotEmpty ?? true)
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  16.verticalSpace,
                  TitleWidget(
                    title: AppHelper.getTrn(TrKeys.categories),
                    titleColor: colors.textBlack,
                    subTitle: AppHelper.getTrn(TrKeys.seeAll),
                    onTap: () {
                      context
                          .read<MainBloc>()
                          .add(const MainEvent.changeIndex(index: 1));
                      context.read<CategoryBloc>().add(
                          CategoryEvent.selectCategoryTwo(
                              context: context,
                              category: state.selectCategory));
                    },
                  ),
                  12.verticalSpace,
                  SizedBox(
                    height: 102.r,
                    child: ListView.builder(
                        padding: EdgeInsets.symmetric(horizontal: 16.r),
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount:
                            (state.selectCategory?.children?.length ?? 0) + 1,
                        itemBuilder: (context, index) {
                          return index == 0
                              ? Container(
                                  margin: EdgeInsets.only(right: 8.r),
                                  padding: EdgeInsets.all(12.r),
                                  width: 50.r,
                                  decoration: BoxDecoration(
                                      color: CustomStyle.subCategory,
                                      borderRadius:
                                          BorderRadius.circular(16.r)),
                                  child:
                                      SvgPicture.asset("assets/svg/filter.svg"),
                                )
                              : Padding(
                                padding: EdgeInsets.only(right: 8.r),
                                child: SubCategoryItem(
                                  categoryData: state
                                      .selectCategory?.children?[index - 1],
                                ),
                              );
                        }),
                  ),
                ],
              )
            : const SizedBox.shrink();
      },
    );
  }
}
