import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ibeauty/application/review/review_bloc.dart';
import 'package:ibeauty/domain/service/helper.dart';
import 'package:ibeauty/domain/service/img_service.dart';
import 'package:ibeauty/domain/service/tr_keys.dart';
import 'package:ibeauty/presentation/components/loading.dart';
import 'package:ibeauty/presentation/style/style.dart';
import 'package:ibeauty/presentation/style/theme/theme.dart';

class CommentButton extends StatelessWidget {
  final CustomColorSet colors;
  final TextEditingController controller;
  final int? shopId;
  final int? blogId;
  final int? productId;
  final int? orderId;
  final String? productUuid;

  const CommentButton(
      {super.key,
      required this.colors,
      required this.controller,
      this.shopId,
      this.productUuid,
      this.productId,
      this.blogId,
      this.orderId});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BlocBuilder<ReviewBloc, ReviewState>(
          builder: (context, state) {
            return state.listOfImage.isNotEmpty
                ? SizedBox(
                    height: 54.r,
                    child: ListView.builder(
                        padding: EdgeInsets.only(bottom: 8.r),
                        scrollDirection: Axis.horizontal,
                        itemCount: state.listOfImage.length,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: EdgeInsets.only(right: 4.r),
                            height: 54.r,
                            width: 54.r,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: FileImage(
                                  File(state.listOfImage[index]),
                                ),
                              ),
                            ),
                          );
                        }))
                : const SizedBox.shrink();
          },
        ),
        Container(
          decoration: BoxDecoration(
              color: colors.textWhite,
              borderRadius: BorderRadius.circular(16.r)),
          padding: EdgeInsets.all(16.r),
          child: Row(
            children: [
              BlocBuilder<ReviewBloc, ReviewState>(
                buildWhen: (p, n) {
                  return p.review != n.review;
                },
                builder: (context, state) {
                  return Text(
                    "${AppHelper.getTrn(TrKeys.yourRating)} – ${state.review.toInt()} ${AppHelper.getTrn(TrKeys.outOf)} 5",
                    style: CustomStyle.interNormal(
                        color: colors.textBlack, size: 12),
                  );
                },
              ),
              const Spacer(),
              RatingBar.builder(
                unratedColor: colors.textHint,
                initialRating: 3,
                direction: Axis.horizontal,
                allowHalfRating: false,
                itemCount: 5,
                itemSize: 24.r,
                glowColor: CustomStyle.starColor,
                itemPadding: EdgeInsets.symmetric(horizontal: 4.r),
                onRatingUpdate: (rating) {
                  context
                      .read<ReviewBloc>()
                      .add(ReviewEvent.setReview(review: rating));
                },
                itemBuilder: (BuildContext context, int index) {
                  return const Icon(
                    FlutterRemix.star_smile_fill,
                    color: CustomStyle.starColor,
                  );
                },
              )
            ],
          ),
        ),
        8.verticalSpace,
        Container(
          height: 60.r,
          margin: EdgeInsets.only(bottom: 8.r),
          padding: REdgeInsets.only(right: 16, left: 8.r),
          decoration: BoxDecoration(
            border: Border.all(color: colors.icon),
            borderRadius: BorderRadius.circular(16.r),
            color: colors.icon,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              InkWell(
                onTap: () {
                  ImgService.openDialogImagePicker(
                    context: context,
                    openCamera: () async {
                      String? titleImg = await ImgService.getCamera();
                      if (context.mounted && (titleImg != null)) {
                        context
                            .read<ReviewBloc>()
                            .add(ReviewEvent.setImage(imagePath: titleImg));
                        Navigator.pop(context);
                      }
                    },
                    openGallery: () async {
                      String? titleImg = await ImgService.getGallery();
                      if (context.mounted && (titleImg != null)) {
                        context
                            .read<ReviewBloc>()
                            .add(ReviewEvent.setImage(imagePath: titleImg));
                        Navigator.pop(context);
                      }
                    },
                  );
                },
                child: Container(
                  width: 42.r,
                  height: 42.r,
                  decoration: BoxDecoration(
                      color: colors.backgroundColor, shape: BoxShape.circle),
                  child: Icon(
                    FlutterRemix.attachment_2,
                    size: 18.r,
                    color: colors.textBlack,
                  ),
                ),
              ),
              8.horizontalSpace,
              Expanded(
                child: TextFormField(
                  autocorrect: true,
                  controller: controller,
                  cursorWidth: 1.r,
                  cursorColor: colors.textBlack,
                  style: CustomStyle.interNormal(
                    size: 14,
                    letterSpacing: -0.5,
                    color: colors.textBlack,
                  ),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintStyle: CustomStyle.interNormal(
                      size: 12,
                      letterSpacing: -0.5,
                      color: colors.textHint,
                    ),
                    hintText: AppHelper.getTrn(TrKeys.typeSomething),
                  ),
                ),
              ),
              BlocBuilder<ReviewBloc, ReviewState>(
                builder: (context, state) {
                  return InkWell(
                    onTap: () {
                      if (state.isButtonLoading) {
                        return;
                      }
                      context.read<ReviewBloc>().add(
                            ReviewEvent.sendReview(
                              context: context,
                              comment: controller.text,
                              shopId: shopId,
                              blogId: blogId,
                              orderId:orderId,
                              productUuid: productUuid,
                              onSuccess: () {
                                controller.clear();
                                Navigator.pop(context);
                              },
                            ),
                          );
                    },
                    child: Container(
                      width: 42.r,
                      height: 42.r,
                      decoration: BoxDecoration(
                          color: colors.backgroundColor,
                          shape: BoxShape.circle),
                      child: state.isButtonLoading
                          ? const Loading()
                          : Icon(
                              FlutterRemix.send_plane_2_line,
                              size: 18.r,
                              color: colors.textBlack,
                            ),
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ],
    );
  }
}
