import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ibeauty/application/filter/filter_bloc.dart';
import 'package:ibeauty/domain/model/response/filter_response.dart';
import 'package:ibeauty/presentation/pages/filter/widgets/extras_item.dart';
import 'package:ibeauty/presentation/style/style.dart';
import 'package:provider/provider.dart';

import '../../../style/theme/theme.dart';

class ExtrasScreen extends StatelessWidget {
  final CustomColorSet colors;
  final List<Group> group;
  final List<int> listExtras;

  const ExtrasScreen(
      {super.key,
      required this.colors,
      required this.group,
      required this.listExtras});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: EdgeInsets.zero,
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: group.length,
        itemBuilder: (context, index) {
          return Container(
            key: UniqueKey(),
            margin: EdgeInsets.only(bottom: 8.r),
            padding: EdgeInsets.all(16.r),
            decoration: BoxDecoration(
                color: colors.newBoxColor,
                borderRadius: BorderRadius.circular(16.r)),
            child: Theme(
              data: Theme.of(context).copyWith(
                  dividerColor: CustomStyle.transparent,
                  primaryColor: colors.textBlack,
                  colorScheme: Theme.of(context).colorScheme.copyWith(
                      secondary: colors.textBlack, primary: colors.textBlack)),
              child: ExpansionTile(
                title: Text(
                  group[index].title ?? "",
                  style: CustomStyle.interNoSemi(
                      color: colors.textBlack, size: 16),
                ),
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Wrap(
                      children: group[index]
                              .extras
                              ?.map((e) => InkWell(
                                    onTap: () {
                                      context.read<FilterBloc>()
                                        ..add(FilterEvent.setExtras(
                                            id: e.id ?? 0))
                                        ..add(FilterEvent.fetchExtras(
                                            context: context, isPrice: true));
                                    },
                                    child: ExtrasItem(
                                        list: listExtras,
                                        type: group[index].type ?? "",
                                        extra: e,
                                        colors: colors),
                                  ))
                              .toList() ??
                          [],
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }
}




