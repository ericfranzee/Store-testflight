import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ibeauty/application/filter/filter_bloc.dart';
import 'package:ibeauty/domain/model/response/filter_response.dart';
import 'package:ibeauty/domain/service/helper.dart';
import 'package:ibeauty/domain/service/tr_keys.dart';
import 'package:ibeauty/presentation/style/style.dart';
import 'package:ibeauty/presentation/style/theme/theme.dart';

class CategoryFilter extends StatelessWidget {
  final CustomColorSet colors;
  final List<Brand> categories;
  final List<int> list;

  const CategoryFilter(
      {super.key,
      required this.colors,
      required this.categories,
      required this.list});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.r),
      width: double.infinity,
      decoration: BoxDecoration(
        color: colors.newBoxColor,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Theme(
        data: Theme.of(context).copyWith(
            dividerColor: CustomStyle.transparent,
            primaryColor: colors.textBlack,
            colorScheme: Theme.of(context).colorScheme.copyWith(
                secondary: colors.textBlack, primary: colors.textBlack)),
        child: ExpansionTile(
          title: Text(
            AppHelper.getTrn(TrKeys.categories),
            style: CustomStyle.interNoSemi(color: colors.textBlack, size: 16),
          ),
          children: [
            Wrap(
              children: categories
                  .map((e) => InkWell(
                        onTap: () {
                          context.read<FilterBloc>()
                            ..add(FilterEvent.setCategory(id: e.id ?? 0))
                            ..add(FilterEvent.fetchExtras(
                                context: context, isPrice: true));
                        },
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Icon(
                                  list.contains(e.id)
                                      ? FlutterRemix.checkbox_circle_fill
                                      : FlutterRemix.checkbox_blank_circle_line,
                                  color: list.contains(e.id)
                                      ? colors.primary
                                      : CustomStyle.black,
                                ),
                                10.horizontalSpace,
                                Text(
                                  e.title ?? "",
                                  style: CustomStyle.interNormal(
                                    size: 14,
                                    color: colors.textBlack,
                                  ),
                                )
                              ],
                            ),
                            Divider(
                              color: colors.backgroundColor,
                            )
                          ],
                        ),
                      ))
                  .toList(),
            )
          ],
        ),
      ),
    );
  }
}
