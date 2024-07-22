import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ibeauty/application/become_seller/become_seller_bloc.dart';
import 'package:ibeauty/domain/service/helper.dart';
import 'package:ibeauty/domain/service/img_service.dart';
import 'package:ibeauty/domain/service/tr_keys.dart';
import 'package:ibeauty/presentation/components/button/animation_button_effect.dart';
import 'package:ibeauty/presentation/components/custom_network_image.dart';
import 'package:ibeauty/presentation/style/style.dart';
import 'package:ibeauty/presentation/style/theme/theme.dart';

class BgImageScreen extends StatelessWidget {
  final CustomColorSet colors;

  const BgImageScreen({super.key, required this.colors});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppHelper.getTrn(TrKeys.backgroundImage),
          style: CustomStyle.interNormal(color: colors.textBlack),
        ),
        16.verticalSpace,
        Stack(
          children: [
            BlocBuilder<BecomeSellerBloc, BecomeSellerState>(
              buildWhen: (p, n) {
                return p.bgPath != n.bgPath;
              },
              builder: (context, state) {
                return state.bgPath == null
                    ? CustomNetworkImage(
                        url: "",
                        height: 130.r,
                        width: double.infinity,
                        radius: 10)
                    : Container(
                        height: 130.r,
                        width: double.infinity,
                        padding: EdgeInsets.all(8.r),
                        decoration: BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: FileImage(
                                File(state.bgPath ?? ""),
                              ),
                            ),
                            borderRadius: BorderRadius.circular(10.r),
                            color: colors.newBoxColor),
                      );
              },
            ),
            Positioned(
              bottom: 16.r,
              right: 16.r,
              child: ButtonEffectAnimation(
                onTap: () {
                  ImgService.openDialogImagePicker(
                    context: context,
                    openCamera: () async {
                      String? titleImg = await ImgService.getCamera();
                      if (context.mounted && (titleImg != null)) {
                        context.read<BecomeSellerBloc>().add(
                            BecomeSellerEvent.updateBgPath(
                                imagePath: titleImg));
                        Navigator.pop(context);
                      }
                    },
                    openGallery: () async {
                      String? titleImg = await ImgService.getGallery();
                      if (context.mounted && (titleImg != null)) {
                        context.read<BecomeSellerBloc>().add(
                            BecomeSellerEvent.updateBgPath(
                                imagePath: titleImg));
                        Navigator.pop(context);
                      }
                    },
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(28.r),
                      color: colors.backgroundColor),
                  padding:
                      EdgeInsets.symmetric(vertical: 10.r, horizontal: 20.r),
                  child: Text(
                    AppHelper.getTrn(TrKeys.uploadPhoto),
                    style: CustomStyle.interNormal(color: colors.textBlack),
                  ),
                ),
              ),
            )
          ],
        ),
      ],
    );
  }
}
