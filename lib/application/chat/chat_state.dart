part of 'chat_bloc.dart';

@freezed
class ChatState with _$ChatState {
  const factory ChatState({
    @Default(true) bool isLoading,
    @Default(false) bool isButtonLoading,
    @Default(true) bool isMessageLoading,
    @Default(null) ChatModel? chatModel,
  }) = _ChatState;
}
