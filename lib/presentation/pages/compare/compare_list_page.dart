import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ibeauty/application/compare/compare_bloc.dart';
import 'package:ibeauty/domain/service/helper.dart';
import 'package:ibeauty/domain/service/tr_keys.dart';
import 'package:ibeauty/presentation/components/button/animation_button_effect.dart';
import 'package:ibeauty/presentation/components/button/pop_button.dart';
import 'package:ibeauty/presentation/components/custom_scaffold.dart';
import 'package:ibeauty/presentation/components/loading.dart';
import 'package:ibeauty/presentation/route/app_route.dart';
import 'package:ibeauty/presentation/style/style.dart';
import 'package:ibeauty/presentation/style/theme/theme.dart';
import 'package:lottie/lottie.dart';

class CompareListPage extends StatelessWidget {
  const CompareListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: (colors) => SafeArea(
        bottom: false,
        child: Column(
          children: [
            Text(
              AppHelper.getTrn(TrKeys.compare),
              style: CustomStyle.interNoSemi(
                  color: colors.textBlack, size: 18),
            ),
            24.verticalSpace,
            BlocBuilder<CompareBloc, CompareState>(
              builder: (context, state) {
                return state.isLoading
                    ? const Loading()
                    : state.compare.isNotEmpty
                        ? Expanded(
                            child: ListView.builder(
                                shrinkWrap: true,
                                padding: EdgeInsets.symmetric(horizontal: 16.r),
                                itemCount: state.compare.length,
                                itemBuilder: (context, index) {
                                  return ButtonEffectAnimation(
                                    onTap: () {
                                      context.read<CompareBloc>().add(
                                          CompareEvent.setExtraGroup(
                                              products: state.compare[index]));
                                      AppRoute.goCompareProductPage(
                                          context: context,
                                          list: state.compare[index]);
                                    },
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            Expanded(
                                              child: Text(
                                                state
                                                        .compare[index]
                                                        .first
                                                        .category
                                                        ?.translation
                                                        ?.title ??
                                                    "",
                                                style: CustomStyle.interNormal(
                                                    color: colors.textBlack),
                                              ),
                                            ),
                                            const Spacer(),
                                            Text(
                                              "${state.compare[index].length} ${AppHelper.getTrn(TrKeys.products)}",
                                              style: CustomStyle.interNormal(
                                                  color: colors.textBlack),
                                            ),
                                          ],
                                        ),
                                        const Divider(),
                                        8.verticalSpace
                                      ],
                                    ),
                                  );
                                }),
                          )
                        : _empty(context, colors);
              },
            )
          ],
        ),
      ),
      floatingButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingButton: (colors) => PopButton(colors: colors),
    );
  }

  Widget _empty(BuildContext context, CustomColorSet colors) {
    return SizedBox(width: MediaQuery.sizeOf(context).width,
      child: Column(
        children: [
          32.verticalSpace,
          Lottie.asset("assets/lottie/notification_empty.json",
              width: MediaQuery.sizeOf(context).width / 1.5),
          32.verticalSpace,
          Text(
            AppHelper.getTrn(TrKeys.yourCompareListIsEmpty),
            style: CustomStyle.interNoSemi(color: colors.textBlack, size: 18),
          )
        ],
      ),
    );
  }
}
