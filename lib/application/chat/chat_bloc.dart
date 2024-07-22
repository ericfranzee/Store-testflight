// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:bloc/bloc.dart';
import 'package:ibeauty/app_constants.dart';
import 'package:ibeauty/domain/interface/chat.dart';
import 'package:ibeauty/domain/interface/gallery.dart';
import 'package:ibeauty/domain/model/model/chat_model.dart';
import 'package:ibeauty/domain/model/model/message_model.dart';
import 'package:ibeauty/domain/service/helper.dart';
import 'package:ibeauty/infrastructure/local_storage/local_storage.dart';

part 'chat_event.dart';

part 'chat_state.dart';

part 'chat_bloc.freezed.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  final ChatInterface _chatRepo;
  final GalleryInterface _galleryRepo;

  ChatBloc(this._chatRepo, this._galleryRepo) : super(const ChatState()) {
    on<CheckChatId>((event, emit) async {
      emit(state.copyWith(
        isMessageLoading: true,
      ));
      final res = await _chatRepo.getChat(sellerId: event.sellerId);
      res.fold((l) {
        emit(state.copyWith(
          chatModel: l,
          isMessageLoading: false,
        ));
      }, (r) {
        emit(state.copyWith(
          isMessageLoading: false,
        ));
      });
    });

    on<CreateAndSendMessage>((event, emit) async {
      final res = await _chatRepo.createChat(id: event.userId);
      res.fold((l) async {
        emit(state.copyWith(chatModel: l));
        event.onSuccess();
      }, (r) {
        AppHelper.errorSnackBar(context: event.context, message: r);
      });
    });

    on<SendMessage>((event, emit) {
      _chatRepo.sendMessage(
          chatDocId: event.chatId ?? state.chatModel?.docId ?? "",
          message: MessageModel(
              message: event.message,
              senderId: LocalStorage.getUser().id ?? 0,
              doc: ""));
    });

    on<SendImage>((event, emit) async {
      emit(state.copyWith(isButtonLoading: true));
      final res = await _galleryRepo.uploadImage(event.file, UploadType.chats);
      res.fold((image) {
        _chatRepo.sendMessage(
            chatDocId: event.chatId ?? state.chatModel?.docId ?? "",
            message: MessageModel(
                message: image.imageData?.title,
                senderId: LocalStorage.getUser().id ?? 0,
                type: "image",
                doc: ""));
        emit(state.copyWith(isButtonLoading: false));
      }, (r) {
        emit(state.copyWith(isButtonLoading: false));
        AppHelper.errorSnackBar(context: event.context, message: r);
      });
    });

    on<EditMessage>((event, emit) {
      _chatRepo.editMessage(
          chatDocId: event.chatId ?? state.chatModel?.docId ?? "",
          message: event.message,
          docId: event.messageId);
    });

    on<ReplyMessage>((event, emit) {
      _chatRepo.replyMessage(
        chatDocId: event.chatId ?? state.chatModel?.docId ?? "",
        message: MessageModel(
            message: event.message,
            senderId: LocalStorage.getUser().id ?? 0,
            doc: "",
            replyDocId: event.messageId),
      );
    });

    on<DeleteMessage>((event, emit) {
      _chatRepo.deleteMessage(
          chatDocId: event.chatId ?? state.chatModel?.docId ?? "",
          docId: event.messageId);
    });
  }
}
