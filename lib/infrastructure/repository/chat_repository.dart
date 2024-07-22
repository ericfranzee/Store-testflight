// ignore_for_file: avoid_function_literals_in_foreach_calls, void_checks

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:ibeauty/domain/di/dependency_manager.dart';
import 'package:ibeauty/domain/interface/chat.dart';
import 'package:ibeauty/domain/model/model/chat_model.dart';
import 'package:ibeauty/domain/model/model/message_model.dart';
import 'package:ibeauty/domain/model/model/user_model.dart';
import 'package:ibeauty/domain/model/response/profile_response.dart';
import 'package:ibeauty/domain/service/helper.dart';
import 'package:ibeauty/infrastructure/firebase/firebase_service.dart';
import 'package:ibeauty/infrastructure/local_storage/local_storage.dart';

class ChatRepository implements ChatInterface {
  @override
  void deleteMessage({required String chatDocId, required String docId}) {
    FirebaseService.store
        .collection("chat")
        .doc(chatDocId)
        .collection("message")
        .doc(docId)
        .delete();
  }

  @override
  void readMessage({required String chatDocId, required String docId}) {
    FirebaseService.store
        .collection("chat")
        .doc(chatDocId)
        .collection("message")
        .doc(docId)
        .update({"read": true});
  }

  @override
  void editMessage(
      {required String message,
      required String chatDocId,
      required String docId}) {
    FirebaseService.store
        .collection("chat")
        .doc(chatDocId)
        .collection("message")
        .doc(docId)
        .update({"message": message});
  }

  @override
  Future<Either<List<ChatModel>, dynamic>> getChatList(
      {String? lastDocId}) async {
    try {
      List<ChatModel> list = [];
      final QuerySnapshot<Map<String, dynamic>> res;
      if (lastDocId != null) {
        final lastDoc =
            await FirebaseService.store.collection("chat").doc(lastDocId).get();
        res = await FirebaseService.store
            .collection("chat")
            .where("ids", arrayContainsAny: [LocalStorage.getUser().id])
            .startAfterDocument(lastDoc)
            .limit(10)
            .get();
      } else {
        res = await FirebaseService.store
            .collection("chat")
            .where("ids", arrayContainsAny: [LocalStorage.getUser().id])
            .limit(10)
            .get();
      }

      for (var element in res.docs) {
        final user = await showChatUser(
            sellerId: ChatModel.fromJson(
                  chat: element.data(),
                  doc: element.id,
                ).senderId ??
                0);
        user.fold((l) {
          list.add(ChatModel.fromJson(
              chat: element.data(), doc: element.id, user: l));
        }, (r) {
          list.add(ChatModel.fromJson(
            chat: element.data(),
            doc: element.id,
          ));
        });
      }
      return left(list);
    } catch (e) {
      return right(e.toString());
    }
  }

  @override
  Future<Either<MessageModel, dynamic>> sendMessage(
      {required MessageModel message, required String chatDocId}) async {
    FirebaseService.store
        .collection("chat")
        .doc(chatDocId)
        .update({"time": Timestamp.now(), "lastMessage": message.message});
    final res = await FirebaseService.store
        .collection("chat")
        .doc(chatDocId)
        .collection("message")
        .add(message.toJson());
    final messageRes = await res.get();
    return left(MessageModel.fromJson(messageRes.data(), messageRes.id));
  }

  @override
  Future<Either<ChatModel, dynamic>> createChat({required int id}) async {
    try {
      final res = await FirebaseService.store
          .collection("chat")
          .add(ChatModel().toJson(senderId: id, message: ''));
      final chatRes = await res.get();
      return left(ChatModel.fromJson(
        chat: chatRes.data(),
        doc: chatRes.id,
      ));
    } catch (e) {
      return right(e.toString());
    }
  }

  @override
  void replyMessage(
      {required String chatDocId, required MessageModel message}) {
    FirebaseService.store
        .collection("chat")
        .doc(chatDocId)
        .collection("message")
        .add(message.toJson());
  }

  @override
  Future<Either<ChatModel, dynamic>> getChat({required int sellerId}) async {
    try {
      List<ChatModel> list = [];

      final res = await FirebaseService.store.collection("chat").where("ids",
          arrayContainsAny: [LocalStorage.getUser().id, sellerId]).get();
      for (var element in res.docs) {
        list.add(ChatModel.fromJson(
          chat: element.data(),
          doc: element.id,
        ));
      }
      if (list.isEmpty) {
        return right("");
      }
      for (var element in list) {
        if (element.ownerId == LocalStorage.getUser().id &&
            element.senderId == sellerId) {
          return left(element);
        }
      }

      return right("");
    } catch (e) {
      return right(e.toString());
    }
  }

  @override
  Future<Either<UserModel, dynamic>> showChatUser(
      {required int sellerId}) async {
    try {
      final data = {
        if (LocalStorage.getSelectedCurrency()?.id != null)
          'currency_id': LocalStorage.getSelectedCurrency()?.id,
        "lang": LocalStorage.getLanguage()?.locale ?? "en"
      };
      final client = dioHttp.client(requireAuth: true);
      final response = await client.get(
          '/api/v1/dashboard/user/chat/users/$sellerId',
          queryParameters: data);
      return left(ProfileResponse.fromJson(response.data).data ?? UserModel());
    } catch (e) {
      debugPrint('==> get user chat details failure: $e');
      return right(AppHelper.errorHandler(e));
    }
  }
}
