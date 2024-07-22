import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ibeauty/application/chat/chat_bloc.dart';
import 'package:ibeauty/domain/model/model/message_model.dart';
import 'package:ibeauty/domain/service/helper.dart';
import 'package:ibeauty/domain/service/tr_keys.dart';
import 'package:ibeauty/presentation/components/button/animation_button_effect.dart';
import 'package:ibeauty/presentation/components/custom_network_image.dart';
import 'package:ibeauty/presentation/components/loading.dart';
import 'package:ibeauty/presentation/style/style.dart';
import 'package:ibeauty/presentation/style/theme/theme.dart';
import 'dart:io' show Platform;

class SendButton extends StatelessWidget {
  final CustomColorSet colors;
  final VoidCallback sendMessage;
  final VoidCallback sendImage;
  final TextEditingController controller;
  final FocusNode focusNode;
  final MessageModel? replyMessage;
  final VoidCallback removeReplyMessage;

  const SendButton(
      {super.key,
      required this.colors,
      required this.sendMessage,
      required this.controller,
      required this.focusNode,
      this.replyMessage,
      required this.removeReplyMessage,
      required this.sendImage});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: colors.backgroundColor,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          6.verticalSpace,
          if (replyMessage != null)
            Padding(
              padding: EdgeInsets.only(left: 16.r, top: 8.r, bottom: 8.r),
              child: IntrinsicHeight(
                child: Row(
                  children: [
                    Icon(
                      FlutterRemix.reply_line,
                      color: colors.textBlack,
                    ),
                    8.horizontalSpace,
                    const VerticalDivider(
                      color: CustomStyle.dividerColor,
                      thickness: 2,
                    ),
                    SizedBox(
                      width: MediaQuery.sizeOf(context).width - 120.r,
                      child: replyMessage?.type == "image"
                          ? Align(
                              alignment: Alignment.centerLeft,
                              child: CustomNetworkImage(
                                  url: replyMessage?.message ?? "",
                                  height: 56,
                                  width: 56,
                                  fit: BoxFit.contain,
                                  radius: 0),
                            )
                          : Text(
                              replyMessage?.message ?? "",
                              style: CustomStyle.interNormal(
                                size: 12,
                                letterSpacing: -0.5,
                                color: colors.textBlack,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                    ),
                    ButtonEffectAnimation(
                        onTap: removeReplyMessage,
                        child: Padding(
                          padding: EdgeInsets.all(8.r),
                          child: Icon(
                            FlutterRemix.close_line,
                            color: colors.textBlack,
                          ),
                        ))
                  ],
                ),
              ),
            ),
          Container(
            height: 60.r,
            margin: EdgeInsets.only(
                left: 16.r,
                right: 16.r,
                bottom: MediaQuery.viewInsetsOf(context).bottom +
                    MediaQuery.paddingOf(context).bottom +
                    (Platform.isAndroid ? 8.r : (-12.r))),
            padding: REdgeInsets.only(right: 16),
            decoration: BoxDecoration(
              border: Border.all(color: colors.icon),
              borderRadius: BorderRadius.circular(16.r),
              color: colors.icon,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                    onPressed: sendImage,
                    icon: Icon(
                      FlutterRemix.gallery_line,
                      color: colors.textBlack,
                    )),
                Expanded(
                  child: TextFormField(
                    focusNode: focusNode,
                    onEditingComplete: sendMessage,
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
                8.horizontalSpace,
                InkWell(
                  onTap: sendMessage,
                  child: Container(
                    width: 42.r,
                    height: 42.r,
                    decoration: BoxDecoration(
                        color: colors.backgroundColor, shape: BoxShape.circle),
                    child: BlocBuilder<ChatBloc, ChatState>(
                      builder: (context, state) {
                        return state.isButtonLoading
                            ? const Loading()
                            : Icon(
                                FlutterRemix.send_plane_2_line,
                                size: 18.r,
                                color: colors.textBlack,
                              );
                      },
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
