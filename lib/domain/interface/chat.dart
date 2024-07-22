import 'package:dartz/dartz.dart';
import 'package:ibeauty/domain/model/model/chat_model.dart';
import 'package:ibeauty/domain/model/model/message_model.dart';
import 'package:ibeauty/domain/model/model/user_model.dart';

abstract class ChatInterface {

  Future<Either<List<ChatModel>,dynamic>> getChatList({String? lastDocId});

  Future<Either<MessageModel,dynamic>> sendMessage({required MessageModel message,required String chatDocId});

  Future<Either<ChatModel,dynamic>> createChat({required int id});

  Future<Either<ChatModel,dynamic>> getChat({required int sellerId});

  Future<Either<UserModel,dynamic>> showChatUser({required int sellerId});

  void deleteMessage({required String chatDocId,required String docId});

  void readMessage({required String chatDocId,required String docId});

  void replyMessage({required String chatDocId,required MessageModel message});

  void editMessage({required String message, required String chatDocId, required String docId});
}
