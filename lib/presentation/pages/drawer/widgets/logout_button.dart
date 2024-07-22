import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ibeauty/application/profile/profile_bloc.dart';
import 'package:ibeauty/domain/di/dependency_manager.dart';
import 'package:ibeauty/domain/service/helper.dart';
import 'package:ibeauty/domain/service/tr_keys.dart';
import 'package:ibeauty/infrastructure/local_storage/local_storage.dart';
import 'package:ibeauty/presentation/components/button/animation_button_effect.dart';
import 'package:ibeauty/presentation/components/custom_network_image.dart';
import 'package:ibeauty/presentation/route/app_route.dart';
import 'package:ibeauty/presentation/style/style.dart';
import 'package:ibeauty/presentation/style/theme/theme.dart';

class LogoutButton extends StatelessWidget {
  final CustomColorSet colors;

  const LogoutButton({Key? key, required this.colors}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ButtonEffectAnimation(
      disabled: LocalStorage.getToken().isEmpty,
      onTap: () {
        AppRoute.goLogin(context);
      },
      child: Container(
        padding: EdgeInsets.all(10.r),
        decoration: BoxDecoration(
            color: colors.newBoxColor,
            borderRadius: BorderRadius.circular(16.r)),
        child: LocalStorage.getToken().isNotEmpty
            ? BlocBuilder<ProfileBloc, ProfileState>(
                buildWhen: (p, n) {
                  return p.isLoading != n.isLoading;
                },
                builder: (context, state) {
                  return Row(
                    children: [
                      CustomNetworkImage(
                          url: LocalStorage.getUser().img ?? "",
                          name: LocalStorage.getUser().firstname ??
                              LocalStorage.getUser().lastname,
                          height: 50,
                          width: 50,
                          radius: 25),
                      8.horizontalSpace,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 90.r,
                            child: Text(
                              LocalStorage.getUser().firstname ?? "",
                              style: CustomStyle.interNoSemi(
                                  color: colors.textBlack, size: 18),
                              maxLines: 1,
                            ),
                          ),
                          Text(
                            LocalStorage.getUser().lastname ?? "",
                            style: CustomStyle.interRegular(
                                color: colors.textHint, size: 14),
                          ),
                        ],
                      ),
                      const Spacer(),
                      IconButton(
                          onPressed: () {
                            AppRoute.goLogin(context);
                            authRepository.logout();
                          },
                          icon: Icon(
                            FlutterRemix.logout_circle_r_line,
                            color: colors.textBlack,
                          ))
                    ],
                  );
                },
              )
            : Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 12.r),
                  child: Text(
                    AppHelper.getTrn(TrKeys.signIn),
                    style: CustomStyle.interNoSemi(
                        color: colors.textBlack, size: 16),
                  ),
                ),
              ),
      ),
    );
  }
}
