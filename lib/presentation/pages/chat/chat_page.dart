// ignore_for_file: avoid_function_literals_in_foreach_calls

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:ibeauty/application/chat/chat_bloc.dart';
import 'package:ibeauty/domain/di/dependency_manager.dart';
import 'package:ibeauty/domain/model/model/message_model.dart';
import 'package:ibeauty/domain/service/helper.dart';
import 'package:ibeauty/domain/service/img_service.dart';
import 'package:ibeauty/domain/service/time_service.dart';
import 'package:ibeauty/domain/service/tr_keys.dart';
import 'package:ibeauty/infrastructure/firebase/firebase_service.dart';
import 'package:ibeauty/infrastructure/local_storage/local_storage.dart';
import 'package:ibeauty/presentation/components/custom_scaffold.dart';
import 'package:ibeauty/presentation/components/loading.dart';
import 'package:ibeauty/presentation/pages/chat/widget/send_button.dart';
import 'package:ibeauty/presentation/style/style.dart';
import 'package:ibeauty/presentation/style/theme/theme.dart';

import 'widget/message_item.dart';

class ChatPage extends StatefulWidget {
  final int senderId;
  final String? chatId;

  const ChatPage({super.key, required this.senderId, this.chatId});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  late TextEditingController messageController;
  final focusNode = FocusNode();
  final GlobalKey sendButtonKey = GlobalKey();
  String? editMessageId;
  MessageModel? replyMessage;

  @override
  void initState() {
    messageController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    messageController.dispose();
    super.dispose();
  }

  readMessage(List<MessageModel> message, String chatId) {
    message.forEach((element) async {
      if (element.senderId != LocalStorage.getUser().id && !element.read) {
        chatRepository.readMessage(chatDocId: chatId, docId: element.doc ?? "");
      }
    });
  }

  editMessage() {
    context.read<ChatBloc>().add(ChatEvent.editMessage(
        context: context,
        message: messageController.text,
        chatId: widget.chatId,
        messageId: editMessageId ?? ""));
    messageController.clear();
    editMessageId = null;
    return;
  }

  deleteMessage(String deleteMessageId) {
    context.read<ChatBloc>().add(ChatEvent.deleteMessage(
          context: context,
          messageId: deleteMessageId,
          chatId: widget.chatId,
        ));
  }

  reply() {
    context.read<ChatBloc>().add(ChatEvent.replyMessage(
          context: context,
          messageId: replyMessage?.doc ?? "",
          chatId: widget.chatId,
          message: messageController.text,
        ));
    replyMessage = null;
    messageController.clear();
    sendButtonKey.currentState?.setState(() {});
  }

  sendMessage({String? chatId}) {
    if (messageController.text.trim().isNotEmpty) {
      if (widget.chatId == null && chatId == null) {
        context.read<ChatBloc>().add(ChatEvent.createAndSendMessage(
            context: context,
            message: messageController.text,
            userId: widget.senderId,
            onSuccess: () {
              context.read<ChatBloc>().add(ChatEvent.sendMessage(
                  context: context,
                  message: messageController.text,
                  chatId: widget.chatId));
              messageController.clear();
            }));
        return;
      }

      context.read<ChatBloc>().add(ChatEvent.sendMessage(
          context: context,
          message: messageController.text,
          chatId: widget.chatId));
      messageController.clear();
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      key: sendButtonKey,
      bgImage: true,
      bgColor: CustomStyle.transparent,
      appBar: (colors) => _appBar(colors),
      body: (colors) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocBuilder<ChatBloc, ChatState>(
            buildWhen: (p, n) {
              return p.chatModel?.docId != n.chatModel?.docId ||
                  p.isMessageLoading != p.isMessageLoading;
            },
            builder: (context, state) {
              if (widget.chatId == null && state.chatModel?.docId == null) {
                return Center(
                    child: Text(
                  TrKeys.noMessagesHereYet,
                  style: CustomStyle.interNormal(
                      color: colors.textBlack, size: 16),
                ));
              }
              return state.isMessageLoading
                  ? const Loading()
                  : StreamBuilder(
                      stream: FirebaseService.store
                          .collection("chat")
                          .doc(widget.chatId ?? state.chatModel?.docId ?? "")
                          .collection("message")
                          .orderBy("time", descending: true)
                          .snapshots(),
                      builder: (context, snapshot) {
                        List<MessageModel> messages = [];
                        for (var element in snapshot.data?.docs ?? []) {
                          messages.add(MessageModel.fromJson(
                              element.data(), element.id));
                        }
                        readMessage(messages,
                            widget.chatId ?? state.chatModel?.docId ?? "");
                        return Expanded(
                          child: GroupedListView<MessageModel, DateTime>(
                            elements: messages,
                            reverse: true,
                            order: GroupedListOrder.DESC,
                            groupBy: (element) => TimeService.dateFormatYMD(
                                element.time ?? DateTime.now()),
                            groupSeparatorBuilder: (DateTime groupByValue) =>
                                Center(
                                    child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 4.r),
                              child: Text(
                                TimeService.dateFormatDM(groupByValue),
                                style: CustomStyle.interNormal(
                                    color: colors.textBlack),
                              ),
                            )),
                            itemBuilder: (context, dynamic element) {
                              return MessageItem(
                                colors: colors,
                                message: element,
                                replyMessage: messages.firstWhere(
                                    (e) => e.doc == element.replyDocId,
                                    orElse: () => MessageModel(
                                        message: "", senderId: 0, doc: "")),
                                edit: (id) {
                                  editMessageId = id;
                                  messageController.text =
                                      element.message ?? "";
                                  focusNode.requestFocus();
                                },
                                reply: (message) {
                                  replyMessage = message;
                                  focusNode.requestFocus();
                                  sendButtonKey.currentState?.setState(() {});
                                },
                                delete: deleteMessage,
                              );
                            },
                            itemComparator: (message, newMessage) =>
                                message.time?.compareTo(
                                    newMessage.time ?? DateTime.now()) ??
                                0,
                          ),
                        );
                      });
            },
          )
        ],
      ),
      bottomNavigationBar: (colors) => BlocBuilder<ChatBloc, ChatState>(
        builder: (context, state) {
          return SendButton(
            focusNode: focusNode,
            colors: colors,
            replyMessage: replyMessage,
            sendMessage: () {
              editMessageId != null
                  ? editMessage()
                  : replyMessage?.doc != null
                      ? reply()
                      : sendMessage(chatId: state.chatModel?.docId);
            },
            controller: messageController,
            removeReplyMessage: () {
              replyMessage = null;
              focusNode.unfocus();
              sendButtonKey.currentState?.setState(() {});
            },
            sendImage: () {
              ImgService.openDialogImagePicker(
                context: context,
                openCamera: () async {
                  String? titleImg = await ImgService.getCamera();
                  if (context.mounted && (titleImg != null)) {
                    context.read<ChatBloc>().add(ChatEvent.sendImage(
                        context: context,
                        file: titleImg,
                        chatId: widget.chatId));
                    Navigator.pop(context);
                  }
                },
                openGallery: () async {
                  String? titleImg = await ImgService.getGallery();
                  if (context.mounted && (titleImg != null)) {
                    context.read<ChatBloc>().add(ChatEvent.sendImage(
                        context: context,
                        file: titleImg,
                        chatId: widget.chatId));
                    Navigator.pop(context);
                  }
                },
              );
            },
          );
        },
      ),
    );
  }

  AppBar _appBar(CustomColorSet colors) {
    return AppBar(
      toolbarHeight: 46.r,
      backgroundColor: colors.backgroundColor,
      automaticallyImplyLeading: false,
      elevation: 0.2,
      leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(FlutterRemix.arrow_left_s_line, color: colors.textBlack)),
      title: Text(
        AppHelper.getTrn(TrKeys.chats),
        style: CustomStyle.interNoSemi(color: colors.textBlack, size: 18),
      ),
    );
  }
}
