part of 'chat_bloc.dart';

@freezed
abstract class ChatEvent with _$ChatEvent {

  const factory ChatEvent.checkChatId(
      {required BuildContext context,required int sellerId}) = CheckChatId;

  const factory ChatEvent.sendImage(
      {required BuildContext context,
        required String file,
        required String? chatId}) = SendImage;

  const factory ChatEvent.sendMessage(
      {required BuildContext context,
      required String message,
      required String? chatId}) = SendMessage;

  const factory ChatEvent.editMessage(
      {required BuildContext context,
      required String message,
      required String messageId,
      required String? chatId}) = EditMessage;



  const factory ChatEvent.replyMessage(
      {required BuildContext context,
        required String message,
        required String messageId,
        required String? chatId}) = ReplyMessage;


  const factory ChatEvent.deleteMessage(
      {required BuildContext context,
      required String messageId,
      required String? chatId}) = DeleteMessage;

  const factory ChatEvent.createAndSendMessage(
      {required BuildContext context,
      required String message,
      required int userId,
      required Function onSuccess}) = CreateAndSendMessage;
}
