import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ibeauty/application/profile/profile_bloc.dart';
import 'package:ibeauty/domain/service/img_service.dart';
import 'package:ibeauty/infrastructure/local_storage/local_storage.dart';
import 'package:ibeauty/presentation/components/button/animation_button_effect.dart';
import 'package:ibeauty/presentation/components/custom_network_image.dart';
import 'package:ibeauty/presentation/style/theme/theme.dart';

class AvatarEditScreen extends StatelessWidget {
  final CustomColorSet colors;

  const AvatarEditScreen({super.key, required this.colors});

  @override
  Widget build(BuildContext context) {
    return ButtonEffectAnimation(
      onTap: () {
        ImgService.openDialogImagePicker(
          context: context,
          openCamera: () async {
            String? titleImg = await ImgService.getCamera();
            if (context.mounted && (titleImg != null)) {
              context
                  .read<ProfileBloc>()
                  .add(ProfileEvent.updateImagePath(imagePath: titleImg));
              Navigator.pop(context);
            }
          },
          openGallery: () async {
            String? titleImg = await ImgService.getGallery();
            if (context.mounted && (titleImg != null)) {
              context
                  .read<ProfileBloc>()
                  .add(ProfileEvent.updateImagePath(imagePath: titleImg));
              Navigator.pop(context);
            }
          },
        );
      },
      child: Stack(
        children: [
          BlocBuilder<ProfileBloc, ProfileState>(
            builder: (context, state) {
              return state.imagePath == null
                  ? CustomNetworkImage(
                      url: LocalStorage.getUser().img ?? "",
                      name: LocalStorage.getUser().firstname ??
                          LocalStorage.getUser().lastname,
                      height: 84.r,
                      width: 84.r,
                      radius: 42.r)
                  : Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(42.r),
                          border: Border.all(color: colors.textHint)),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(42.r),
                        child: Image.file(
                          File(state.imagePath ?? ""),
                          width: 84.r,
                          height: 84.r,
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
            },
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Container(
                padding: EdgeInsets.all(4.r),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: colors.backgroundColor,
                    border: Border.all(color: colors.textHint)),
                child: Icon(
                  FlutterRemix.pencil_line,
                  color: colors.textBlack,
                )),
          ),
        ],
      ),
    );
  }
}
