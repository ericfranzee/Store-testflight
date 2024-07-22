import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ibeauty/domain/model/model/message_model.dart';
import 'package:ibeauty/domain/service/helper.dart';
import 'package:ibeauty/domain/service/tr_keys.dart';
import 'package:ibeauty/infrastructure/local_storage/local_storage.dart';
import 'package:ibeauty/presentation/components/custom_network_image.dart';
import 'package:ibeauty/presentation/pages/chat/widget/image_chat_screen.dart';
import 'package:ibeauty/presentation/style/style.dart';
import 'package:ibeauty/presentation/style/theme/theme.dart';
import 'package:intl/intl.dart';
import 'package:swipe_to/swipe_to.dart';

import 'focused_custom_menu.dart';

class MessageItem extends StatelessWidget {
  final CustomColorSet colors;
  final MessageModel message;
  final MessageModel? replyMessage;
  final ValueChanged<String> edit;
  final ValueChanged<MessageModel> reply;
  final ValueChanged<String> delete;

  const MessageItem({
    super.key,
    required this.colors,
    required this.message,
    required this.edit,
    required this.reply,
    required this.delete,
    required this.replyMessage,
  });

  @override
  Widget build(BuildContext context) {
    bool owner = LocalStorage.getUser().id == message.senderId;
    return FocusedMenuHolder(
      menuBoxDecoration: BoxDecoration(
        color: colors.newBoxColor,
      ),
      borderColor: colors.transparent,
      menuItems: owner
          ? [
              if (message.type != "image")
                FocusedMenuItem(
                    backgroundColor: colors.newBoxColor,
                    title: Text(
                      TrKeys.edit,
                      style: CustomStyle.interNormal(color: colors.textBlack),
                    ),
                    trailingIcon: Icon(
                      FlutterRemix.edit_box_line,
                      color: colors.textBlack,
                    ),
                    onPressed: () => edit(message.doc ?? "")),
              if (message.type != "image")
                FocusedMenuItem(
                    backgroundColor: colors.newBoxColor,
                    title: Text(
                      TrKeys.copy,
                      style: CustomStyle.interNormal(color: colors.textBlack),
                    ),
                    trailingIcon: Icon(
                      FlutterRemix.file_copy_2_line,
                      color: colors.textBlack,
                    ),
                    onPressed: () {
                      AppHelper.errorSnackBar(
                          context: context, message: TrKeys.messageCopied);
                      Clipboard.setData(
                        ClipboardData(
                          text: message.message ?? "",
                        ),
                      );
                    }),
              FocusedMenuItem(
                  backgroundColor: colors.newBoxColor,
                  title: Text(
                    TrKeys.reply,
                    style: CustomStyle.interNormal(color: colors.textBlack),
                  ),
                  trailingIcon: Icon(
                    FlutterRemix.reply_line,
                    color: colors.textBlack,
                  ),
                  onPressed: () {
                    reply(message);
                  }),
              FocusedMenuItem(
                  backgroundColor: colors.newBoxColor,
                  title: Text(
                    TrKeys.delete,
                    style: CustomStyle.interNormal(color: colors.error),
                  ),
                  trailingIcon: Icon(
                    FlutterRemix.delete_bin_6_line,
                    color: colors.error,
                  ),
                  onPressed: () => delete(message.doc ?? "")),
            ]
          : [
              FocusedMenuItem(
                  backgroundColor: colors.newBoxColor,
                  title: Text(
                    TrKeys.reply,
                    style: CustomStyle.interNormal(color: colors.textBlack),
                  ),
                  trailingIcon: Icon(
                    FlutterRemix.reply_line,
                    color: colors.textBlack,
                  ),
                  onPressed: () => reply(message)),
              if (message.type != "image")
                FocusedMenuItem(
                    backgroundColor: colors.newBoxColor,
                    title: Text(
                      TrKeys.copy,
                      style: CustomStyle.interNormal(color: colors.textBlack),
                    ),
                    trailingIcon: Icon(
                      FlutterRemix.file_copy_2_line,
                      color: colors.textBlack,
                    ),
                    onPressed: () {
                      AppHelper.errorSnackBar(
                          context: context, message: TrKeys.messageCopied);
                      Clipboard.setData(
                        ClipboardData(
                          text: message.message ?? "",
                        ),
                      );
                    }),
            ],
      child: SwipeTo(
        key: UniqueKey(),
        onLeftSwipe: (s) {
          return reply(message);
        },
        child: Container(
          color: colors.transparent,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              if (owner) const Spacer(),
              message.type == "image"
                  ? _image(owner, context)
                  : _message(owner, context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _image(bool owner, BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => ImageChatPage(image: message.message ?? ""),
          ),
        );
      },
      child: Container(
        width: MediaQuery.sizeOf(context).width * 2 / 3,
        height: MediaQuery.sizeOf(context).width * 2 / 3,
        margin: EdgeInsets.only(bottom: 8.r, left: 8.r, right: 8.r),
        padding: EdgeInsets.all(2.r),
        decoration: BoxDecoration(
          color: owner ? colors.primary : colors.newBoxColor,
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: CustomNetworkImage(
            url: message.message ?? "",
            height: MediaQuery.sizeOf(context).width * 2 / 3,
            width: MediaQuery.sizeOf(context).width * 2 / 3,
            radius: 16),
      ),
    );
  }

  Widget _message(bool owner, BuildContext context) {
    return (message.message?.length ?? 0) > 26
        ? Container(
            width: MediaQuery.sizeOf(context).width * 2 / 3,
            margin: EdgeInsets.only(bottom: 8.r, left: 8.r, right: 8.r),
            padding: EdgeInsets.symmetric(vertical: 10.r, horizontal: 16.r),
            decoration: BoxDecoration(
              color: owner ? colors.primary : colors.newBoxColor,
              borderRadius: BorderRadius.circular(16.r),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (replyMessage?.doc != "")
                  IntrinsicHeight(
                    child: Row(
                      children: [
                        VerticalDivider(
                          color: owner
                              ? CustomStyle.dividerColor
                              : CustomStyle.icon,
                          thickness: 2,
                        ),
                        replyMessage?.type == "image"
                            ? CustomNetworkImage(
                                url: replyMessage?.message ?? "",
                                height: 56,
                                width: 56,
                                fit: BoxFit.contain,
                                radius: 0)
                            : (replyMessage?.message?.length ?? 0) > 26
                                ? SizedBox(
                                    width: MediaQuery.sizeOf(context).width *
                                        2 /
                                        3,
                                    child: Text(
                                      replyMessage?.message ?? "",
                                      style: CustomStyle.interNormal(
                                          color: owner
                                              ? colors.white
                                              : colors.textBlack,
                                          size: 12.sp),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  )
                                : Text(
                                    replyMessage?.message ?? "",
                                    style: CustomStyle.interNormal(
                                        color: owner
                                            ? colors.white
                                            : colors.textBlack,
                                        size: 12.sp),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  )
                      ],
                    ),
                  ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      child: Text(
                        message.message ?? "",
                        style: CustomStyle.interNormal(
                            color: owner ? colors.white : colors.textBlack,
                            size: 12.sp),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: 10.r,
                        left: 4.r,
                      ),
                      child: Row(
                        children: [
                          Text(
                            DateFormat("HH:mm")
                                .format(message.time ?? DateTime.now()),
                            style: CustomStyle.interRegular(
                                color: owner ? colors.white : colors.textBlack,
                                size: 10.sp),
                          ),
                          if (owner)
                            Icon(
                              message.read
                                  ? FlutterRemix.check_double_line
                                  : FlutterRemix.check_line,
                              size: 12.r,
                              color: colors.white,
                            ),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          )
        : Container(
            margin: EdgeInsets.only(bottom: 8.r, left: 8.r, right: 8.r),
            padding: EdgeInsets.symmetric(vertical: 10.r, horizontal: 16.r),
            decoration: BoxDecoration(
              color: owner ? colors.primary : colors.newBoxColor,
              borderRadius: BorderRadius.circular(16.r),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (replyMessage?.doc != "")
                  IntrinsicHeight(
                    child: Row(
                      children: [
                        VerticalDivider(
                          color: owner
                              ? CustomStyle.dividerColor
                              : CustomStyle.icon,
                          thickness: 2,
                        ),
                        replyMessage?.type == "image"
                            ? CustomNetworkImage(
                                url: replyMessage?.message ?? "",
                                height: 56,
                                width: 56,
                                fit: BoxFit.contain,
                                radius: 0)
                            : (replyMessage?.message?.length ?? 0) > 26
                                ? SizedBox(
                                    width: MediaQuery.sizeOf(context).width *
                                        2 /
                                        3,
                                    child: Text(
                                      replyMessage?.message ?? "",
                                      style: CustomStyle.interNormal(
                                          color: owner
                                              ? colors.white
                                              : colors.textBlack,
                                          size: 12.sp),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  )
                                : Text(
                                    replyMessage?.message ?? "",
                                    style: CustomStyle.interNormal(
                                        color: owner
                                            ? colors.white
                                            : colors.textBlack,
                                        size: 12.sp),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  )
                      ],
                    ),
                  ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      message.message ?? "",
                      style: CustomStyle.interNormal(
                          color: owner ? colors.white : colors.textBlack,
                          size: 12.sp),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: 10.r,
                        left: 4.r,
                      ),
                      child: Row(
                        children: [
                          Text(
                            DateFormat("HH:mm")
                                .format(message.time ?? DateTime.now()),
                            style: CustomStyle.interRegular(
                                color: owner ? colors.white : colors.textBlack,
                                size: 10.sp),
                          ),
                          if (owner)
                            Icon(
                              message.read
                                  ? FlutterRemix.check_double_line
                                  : FlutterRemix.check_line,
                              size: 12.r,
                              color: colors.white,
                            ),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          );
  }
}
