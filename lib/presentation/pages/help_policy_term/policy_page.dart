import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cea_zed/application/profile/profile_bloc.dart';
import 'package:cea_zed/domain/service/helper.dart';
import 'package:cea_zed/domain/service/tr_keys.dart';
import 'package:cea_zed/presentation/components/button/pop_button.dart';
import 'package:cea_zed/presentation/components/custom_scaffold.dart';
import 'package:cea_zed/presentation/components/loading.dart';
import 'package:cea_zed/presentation/style/style.dart';

class PolicyPage extends StatelessWidget {
  const PolicyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: (colors) => SafeArea(
        child: Column(
          children: [
            Text(
              AppHelper.getTrn(TrKeys.privacy),
              style: CustomStyle.interNoSemi(color: colors.textBlack, size: 18),
            ),
            BlocBuilder<ProfileBloc, ProfileState>(
              builder: (context, state) {
                return state.isHelpLoading
                    ? const Center(child: Loading())
                    : Expanded(
                        child: SingleChildScrollView(
                          padding: EdgeInsets.all(16.r),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                state.policy?.title ?? "",
                                style: CustomStyle.interNoSemi(
                                    color: colors.textBlack),
                              ),
                              8.verticalSpace,
                              Html(
                                data: state.policy?.description ?? "",
                                style: {
                                  "body": Style(
                                    color: colors.textBlack,
                                  ),
                                },
                              )
                            ],
                          ),
                        ),
                      );
              },
            )
          ],
        ),
      ),
      floatingButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingButton: (colors) => PopButton(colors: colors),
    );
  }
}
