// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ChatEvent {
  BuildContext get context => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(BuildContext context, int sellerId) checkChatId,
    required TResult Function(BuildContext context, String file, String? chatId)
        sendImage,
    required TResult Function(
            BuildContext context, String message, String? chatId)
        sendMessage,
    required TResult Function(BuildContext context, String message,
            String messageId, String? chatId)
        editMessage,
    required TResult Function(BuildContext context, String message,
            String messageId, String? chatId)
        replyMessage,
    required TResult Function(
            BuildContext context, String messageId, String? chatId)
        deleteMessage,
    required TResult Function(BuildContext context, String message, int userId,
            Function onSuccess)
        createAndSendMessage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(BuildContext context, int sellerId)? checkChatId,
    TResult? Function(BuildContext context, String file, String? chatId)?
        sendImage,
    TResult? Function(BuildContext context, String message, String? chatId)?
        sendMessage,
    TResult? Function(BuildContext context, String message, String messageId,
            String? chatId)?
        editMessage,
    TResult? Function(BuildContext context, String message, String messageId,
            String? chatId)?
        replyMessage,
    TResult? Function(BuildContext context, String messageId, String? chatId)?
        deleteMessage,
    TResult? Function(BuildContext context, String message, int userId,
            Function onSuccess)?
        createAndSendMessage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BuildContext context, int sellerId)? checkChatId,
    TResult Function(BuildContext context, String file, String? chatId)?
        sendImage,
    TResult Function(BuildContext context, String message, String? chatId)?
        sendMessage,
    TResult Function(BuildContext context, String message, String messageId,
            String? chatId)?
        editMessage,
    TResult Function(BuildContext context, String message, String messageId,
            String? chatId)?
        replyMessage,
    TResult Function(BuildContext context, String messageId, String? chatId)?
        deleteMessage,
    TResult Function(BuildContext context, String message, int userId,
            Function onSuccess)?
        createAndSendMessage,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CheckChatId value) checkChatId,
    required TResult Function(SendImage value) sendImage,
    required TResult Function(SendMessage value) sendMessage,
    required TResult Function(EditMessage value) editMessage,
    required TResult Function(ReplyMessage value) replyMessage,
    required TResult Function(DeleteMessage value) deleteMessage,
    required TResult Function(CreateAndSendMessage value) createAndSendMessage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CheckChatId value)? checkChatId,
    TResult? Function(SendImage value)? sendImage,
    TResult? Function(SendMessage value)? sendMessage,
    TResult? Function(EditMessage value)? editMessage,
    TResult? Function(ReplyMessage value)? replyMessage,
    TResult? Function(DeleteMessage value)? deleteMessage,
    TResult? Function(CreateAndSendMessage value)? createAndSendMessage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CheckChatId value)? checkChatId,
    TResult Function(SendImage value)? sendImage,
    TResult Function(SendMessage value)? sendMessage,
    TResult Function(EditMessage value)? editMessage,
    TResult Function(ReplyMessage value)? replyMessage,
    TResult Function(DeleteMessage value)? deleteMessage,
    TResult Function(CreateAndSendMessage value)? createAndSendMessage,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ChatEventCopyWith<ChatEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatEventCopyWith<$Res> {
  factory $ChatEventCopyWith(ChatEvent value, $Res Function(ChatEvent) then) =
      _$ChatEventCopyWithImpl<$Res, ChatEvent>;
  @useResult
  $Res call({BuildContext context});
}

/// @nodoc
class _$ChatEventCopyWithImpl<$Res, $Val extends ChatEvent>
    implements $ChatEventCopyWith<$Res> {
  _$ChatEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? context = null,
  }) {
    return _then(_value.copyWith(
      context: null == context
          ? _value.context
          : context // ignore: cast_nullable_to_non_nullable
              as BuildContext,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CheckChatIdImplCopyWith<$Res>
    implements $ChatEventCopyWith<$Res> {
  factory _$$CheckChatIdImplCopyWith(
          _$CheckChatIdImpl value, $Res Function(_$CheckChatIdImpl) then) =
      __$$CheckChatIdImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({BuildContext context, int sellerId});
}

/// @nodoc
class __$$CheckChatIdImplCopyWithImpl<$Res>
    extends _$ChatEventCopyWithImpl<$Res, _$CheckChatIdImpl>
    implements _$$CheckChatIdImplCopyWith<$Res> {
  __$$CheckChatIdImplCopyWithImpl(
      _$CheckChatIdImpl _value, $Res Function(_$CheckChatIdImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? context = null,
    Object? sellerId = null,
  }) {
    return _then(_$CheckChatIdImpl(
      context: null == context
          ? _value.context
          : context // ignore: cast_nullable_to_non_nullable
              as BuildContext,
      sellerId: null == sellerId
          ? _value.sellerId
          : sellerId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$CheckChatIdImpl implements CheckChatId {
  const _$CheckChatIdImpl({required this.context, required this.sellerId});

  @override
  final BuildContext context;
  @override
  final int sellerId;

  @override
  String toString() {
    return 'ChatEvent.checkChatId(context: $context, sellerId: $sellerId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CheckChatIdImpl &&
            (identical(other.context, context) || other.context == context) &&
            (identical(other.sellerId, sellerId) ||
                other.sellerId == sellerId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, context, sellerId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CheckChatIdImplCopyWith<_$CheckChatIdImpl> get copyWith =>
      __$$CheckChatIdImplCopyWithImpl<_$CheckChatIdImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(BuildContext context, int sellerId) checkChatId,
    required TResult Function(BuildContext context, String file, String? chatId)
        sendImage,
    required TResult Function(
            BuildContext context, String message, String? chatId)
        sendMessage,
    required TResult Function(BuildContext context, String message,
            String messageId, String? chatId)
        editMessage,
    required TResult Function(BuildContext context, String message,
            String messageId, String? chatId)
        replyMessage,
    required TResult Function(
            BuildContext context, String messageId, String? chatId)
        deleteMessage,
    required TResult Function(BuildContext context, String message, int userId,
            Function onSuccess)
        createAndSendMessage,
  }) {
    return checkChatId(context, sellerId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(BuildContext context, int sellerId)? checkChatId,
    TResult? Function(BuildContext context, String file, String? chatId)?
        sendImage,
    TResult? Function(BuildContext context, String message, String? chatId)?
        sendMessage,
    TResult? Function(BuildContext context, String message, String messageId,
            String? chatId)?
        editMessage,
    TResult? Function(BuildContext context, String message, String messageId,
            String? chatId)?
        replyMessage,
    TResult? Function(BuildContext context, String messageId, String? chatId)?
        deleteMessage,
    TResult? Function(BuildContext context, String message, int userId,
            Function onSuccess)?
        createAndSendMessage,
  }) {
    return checkChatId?.call(context, sellerId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BuildContext context, int sellerId)? checkChatId,
    TResult Function(BuildContext context, String file, String? chatId)?
        sendImage,
    TResult Function(BuildContext context, String message, String? chatId)?
        sendMessage,
    TResult Function(BuildContext context, String message, String messageId,
            String? chatId)?
        editMessage,
    TResult Function(BuildContext context, String message, String messageId,
            String? chatId)?
        replyMessage,
    TResult Function(BuildContext context, String messageId, String? chatId)?
        deleteMessage,
    TResult Function(BuildContext context, String message, int userId,
            Function onSuccess)?
        createAndSendMessage,
    required TResult orElse(),
  }) {
    if (checkChatId != null) {
      return checkChatId(context, sellerId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CheckChatId value) checkChatId,
    required TResult Function(SendImage value) sendImage,
    required TResult Function(SendMessage value) sendMessage,
    required TResult Function(EditMessage value) editMessage,
    required TResult Function(ReplyMessage value) replyMessage,
    required TResult Function(DeleteMessage value) deleteMessage,
    required TResult Function(CreateAndSendMessage value) createAndSendMessage,
  }) {
    return checkChatId(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CheckChatId value)? checkChatId,
    TResult? Function(SendImage value)? sendImage,
    TResult? Function(SendMessage value)? sendMessage,
    TResult? Function(EditMessage value)? editMessage,
    TResult? Function(ReplyMessage value)? replyMessage,
    TResult? Function(DeleteMessage value)? deleteMessage,
    TResult? Function(CreateAndSendMessage value)? createAndSendMessage,
  }) {
    return checkChatId?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CheckChatId value)? checkChatId,
    TResult Function(SendImage value)? sendImage,
    TResult Function(SendMessage value)? sendMessage,
    TResult Function(EditMessage value)? editMessage,
    TResult Function(ReplyMessage value)? replyMessage,
    TResult Function(DeleteMessage value)? deleteMessage,
    TResult Function(CreateAndSendMessage value)? createAndSendMessage,
    required TResult orElse(),
  }) {
    if (checkChatId != null) {
      return checkChatId(this);
    }
    return orElse();
  }
}

abstract class CheckChatId implements ChatEvent {
  const factory CheckChatId(
      {required final BuildContext context,
      required final int sellerId}) = _$CheckChatIdImpl;

  @override
  BuildContext get context;
  int get sellerId;
  @override
  @JsonKey(ignore: true)
  _$$CheckChatIdImplCopyWith<_$CheckChatIdImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SendImageImplCopyWith<$Res>
    implements $ChatEventCopyWith<$Res> {
  factory _$$SendImageImplCopyWith(
          _$SendImageImpl value, $Res Function(_$SendImageImpl) then) =
      __$$SendImageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({BuildContext context, String file, String? chatId});
}

/// @nodoc
class __$$SendImageImplCopyWithImpl<$Res>
    extends _$ChatEventCopyWithImpl<$Res, _$SendImageImpl>
    implements _$$SendImageImplCopyWith<$Res> {
  __$$SendImageImplCopyWithImpl(
      _$SendImageImpl _value, $Res Function(_$SendImageImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? context = null,
    Object? file = null,
    Object? chatId = freezed,
  }) {
    return _then(_$SendImageImpl(
      context: null == context
          ? _value.context
          : context // ignore: cast_nullable_to_non_nullable
              as BuildContext,
      file: null == file
          ? _value.file
          : file // ignore: cast_nullable_to_non_nullable
              as String,
      chatId: freezed == chatId
          ? _value.chatId
          : chatId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$SendImageImpl implements SendImage {
  const _$SendImageImpl(
      {required this.context, required this.file, required this.chatId});

  @override
  final BuildContext context;
  @override
  final String file;
  @override
  final String? chatId;

  @override
  String toString() {
    return 'ChatEvent.sendImage(context: $context, file: $file, chatId: $chatId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SendImageImpl &&
            (identical(other.context, context) || other.context == context) &&
            (identical(other.file, file) || other.file == file) &&
            (identical(other.chatId, chatId) || other.chatId == chatId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, context, file, chatId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SendImageImplCopyWith<_$SendImageImpl> get copyWith =>
      __$$SendImageImplCopyWithImpl<_$SendImageImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(BuildContext context, int sellerId) checkChatId,
    required TResult Function(BuildContext context, String file, String? chatId)
        sendImage,
    required TResult Function(
            BuildContext context, String message, String? chatId)
        sendMessage,
    required TResult Function(BuildContext context, String message,
            String messageId, String? chatId)
        editMessage,
    required TResult Function(BuildContext context, String message,
            String messageId, String? chatId)
        replyMessage,
    required TResult Function(
            BuildContext context, String messageId, String? chatId)
        deleteMessage,
    required TResult Function(BuildContext context, String message, int userId,
            Function onSuccess)
        createAndSendMessage,
  }) {
    return sendImage(context, file, chatId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(BuildContext context, int sellerId)? checkChatId,
    TResult? Function(BuildContext context, String file, String? chatId)?
        sendImage,
    TResult? Function(BuildContext context, String message, String? chatId)?
        sendMessage,
    TResult? Function(BuildContext context, String message, String messageId,
            String? chatId)?
        editMessage,
    TResult? Function(BuildContext context, String message, String messageId,
            String? chatId)?
        replyMessage,
    TResult? Function(BuildContext context, String messageId, String? chatId)?
        deleteMessage,
    TResult? Function(BuildContext context, String message, int userId,
            Function onSuccess)?
        createAndSendMessage,
  }) {
    return sendImage?.call(context, file, chatId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BuildContext context, int sellerId)? checkChatId,
    TResult Function(BuildContext context, String file, String? chatId)?
        sendImage,
    TResult Function(BuildContext context, String message, String? chatId)?
        sendMessage,
    TResult Function(BuildContext context, String message, String messageId,
            String? chatId)?
        editMessage,
    TResult Function(BuildContext context, String message, String messageId,
            String? chatId)?
        replyMessage,
    TResult Function(BuildContext context, String messageId, String? chatId)?
        deleteMessage,
    TResult Function(BuildContext context, String message, int userId,
            Function onSuccess)?
        createAndSendMessage,
    required TResult orElse(),
  }) {
    if (sendImage != null) {
      return sendImage(context, file, chatId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CheckChatId value) checkChatId,
    required TResult Function(SendImage value) sendImage,
    required TResult Function(SendMessage value) sendMessage,
    required TResult Function(EditMessage value) editMessage,
    required TResult Function(ReplyMessage value) replyMessage,
    required TResult Function(DeleteMessage value) deleteMessage,
    required TResult Function(CreateAndSendMessage value) createAndSendMessage,
  }) {
    return sendImage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CheckChatId value)? checkChatId,
    TResult? Function(SendImage value)? sendImage,
    TResult? Function(SendMessage value)? sendMessage,
    TResult? Function(EditMessage value)? editMessage,
    TResult? Function(ReplyMessage value)? replyMessage,
    TResult? Function(DeleteMessage value)? deleteMessage,
    TResult? Function(CreateAndSendMessage value)? createAndSendMessage,
  }) {
    return sendImage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CheckChatId value)? checkChatId,
    TResult Function(SendImage value)? sendImage,
    TResult Function(SendMessage value)? sendMessage,
    TResult Function(EditMessage value)? editMessage,
    TResult Function(ReplyMessage value)? replyMessage,
    TResult Function(DeleteMessage value)? deleteMessage,
    TResult Function(CreateAndSendMessage value)? createAndSendMessage,
    required TResult orElse(),
  }) {
    if (sendImage != null) {
      return sendImage(this);
    }
    return orElse();
  }
}

abstract class SendImage implements ChatEvent {
  const factory SendImage(
      {required final BuildContext context,
      required final String file,
      required final String? chatId}) = _$SendImageImpl;

  @override
  BuildContext get context;
  String get file;
  String? get chatId;
  @override
  @JsonKey(ignore: true)
  _$$SendImageImplCopyWith<_$SendImageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SendMessageImplCopyWith<$Res>
    implements $ChatEventCopyWith<$Res> {
  factory _$$SendMessageImplCopyWith(
          _$SendMessageImpl value, $Res Function(_$SendMessageImpl) then) =
      __$$SendMessageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({BuildContext context, String message, String? chatId});
}

/// @nodoc
class __$$SendMessageImplCopyWithImpl<$Res>
    extends _$ChatEventCopyWithImpl<$Res, _$SendMessageImpl>
    implements _$$SendMessageImplCopyWith<$Res> {
  __$$SendMessageImplCopyWithImpl(
      _$SendMessageImpl _value, $Res Function(_$SendMessageImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? context = null,
    Object? message = null,
    Object? chatId = freezed,
  }) {
    return _then(_$SendMessageImpl(
      context: null == context
          ? _value.context
          : context // ignore: cast_nullable_to_non_nullable
              as BuildContext,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      chatId: freezed == chatId
          ? _value.chatId
          : chatId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$SendMessageImpl implements SendMessage {
  const _$SendMessageImpl(
      {required this.context, required this.message, required this.chatId});

  @override
  final BuildContext context;
  @override
  final String message;
  @override
  final String? chatId;

  @override
  String toString() {
    return 'ChatEvent.sendMessage(context: $context, message: $message, chatId: $chatId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SendMessageImpl &&
            (identical(other.context, context) || other.context == context) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.chatId, chatId) || other.chatId == chatId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, context, message, chatId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SendMessageImplCopyWith<_$SendMessageImpl> get copyWith =>
      __$$SendMessageImplCopyWithImpl<_$SendMessageImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(BuildContext context, int sellerId) checkChatId,
    required TResult Function(BuildContext context, String file, String? chatId)
        sendImage,
    required TResult Function(
            BuildContext context, String message, String? chatId)
        sendMessage,
    required TResult Function(BuildContext context, String message,
            String messageId, String? chatId)
        editMessage,
    required TResult Function(BuildContext context, String message,
            String messageId, String? chatId)
        replyMessage,
    required TResult Function(
            BuildContext context, String messageId, String? chatId)
        deleteMessage,
    required TResult Function(BuildContext context, String message, int userId,
            Function onSuccess)
        createAndSendMessage,
  }) {
    return sendMessage(context, message, chatId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(BuildContext context, int sellerId)? checkChatId,
    TResult? Function(BuildContext context, String file, String? chatId)?
        sendImage,
    TResult? Function(BuildContext context, String message, String? chatId)?
        sendMessage,
    TResult? Function(BuildContext context, String message, String messageId,
            String? chatId)?
        editMessage,
    TResult? Function(BuildContext context, String message, String messageId,
            String? chatId)?
        replyMessage,
    TResult? Function(BuildContext context, String messageId, String? chatId)?
        deleteMessage,
    TResult? Function(BuildContext context, String message, int userId,
            Function onSuccess)?
        createAndSendMessage,
  }) {
    return sendMessage?.call(context, message, chatId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BuildContext context, int sellerId)? checkChatId,
    TResult Function(BuildContext context, String file, String? chatId)?
        sendImage,
    TResult Function(BuildContext context, String message, String? chatId)?
        sendMessage,
    TResult Function(BuildContext context, String message, String messageId,
            String? chatId)?
        editMessage,
    TResult Function(BuildContext context, String message, String messageId,
            String? chatId)?
        replyMessage,
    TResult Function(BuildContext context, String messageId, String? chatId)?
        deleteMessage,
    TResult Function(BuildContext context, String message, int userId,
            Function onSuccess)?
        createAndSendMessage,
    required TResult orElse(),
  }) {
    if (sendMessage != null) {
      return sendMessage(context, message, chatId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CheckChatId value) checkChatId,
    required TResult Function(SendImage value) sendImage,
    required TResult Function(SendMessage value) sendMessage,
    required TResult Function(EditMessage value) editMessage,
    required TResult Function(ReplyMessage value) replyMessage,
    required TResult Function(DeleteMessage value) deleteMessage,
    required TResult Function(CreateAndSendMessage value) createAndSendMessage,
  }) {
    return sendMessage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CheckChatId value)? checkChatId,
    TResult? Function(SendImage value)? sendImage,
    TResult? Function(SendMessage value)? sendMessage,
    TResult? Function(EditMessage value)? editMessage,
    TResult? Function(ReplyMessage value)? replyMessage,
    TResult? Function(DeleteMessage value)? deleteMessage,
    TResult? Function(CreateAndSendMessage value)? createAndSendMessage,
  }) {
    return sendMessage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CheckChatId value)? checkChatId,
    TResult Function(SendImage value)? sendImage,
    TResult Function(SendMessage value)? sendMessage,
    TResult Function(EditMessage value)? editMessage,
    TResult Function(ReplyMessage value)? replyMessage,
    TResult Function(DeleteMessage value)? deleteMessage,
    TResult Function(CreateAndSendMessage value)? createAndSendMessage,
    required TResult orElse(),
  }) {
    if (sendMessage != null) {
      return sendMessage(this);
    }
    return orElse();
  }
}

abstract class SendMessage implements ChatEvent {
  const factory SendMessage(
      {required final BuildContext context,
      required final String message,
      required final String? chatId}) = _$SendMessageImpl;

  @override
  BuildContext get context;
  String get message;
  String? get chatId;
  @override
  @JsonKey(ignore: true)
  _$$SendMessageImplCopyWith<_$SendMessageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$EditMessageImplCopyWith<$Res>
    implements $ChatEventCopyWith<$Res> {
  factory _$$EditMessageImplCopyWith(
          _$EditMessageImpl value, $Res Function(_$EditMessageImpl) then) =
      __$$EditMessageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {BuildContext context, String message, String messageId, String? chatId});
}

/// @nodoc
class __$$EditMessageImplCopyWithImpl<$Res>
    extends _$ChatEventCopyWithImpl<$Res, _$EditMessageImpl>
    implements _$$EditMessageImplCopyWith<$Res> {
  __$$EditMessageImplCopyWithImpl(
      _$EditMessageImpl _value, $Res Function(_$EditMessageImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? context = null,
    Object? message = null,
    Object? messageId = null,
    Object? chatId = freezed,
  }) {
    return _then(_$EditMessageImpl(
      context: null == context
          ? _value.context
          : context // ignore: cast_nullable_to_non_nullable
              as BuildContext,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      messageId: null == messageId
          ? _value.messageId
          : messageId // ignore: cast_nullable_to_non_nullable
              as String,
      chatId: freezed == chatId
          ? _value.chatId
          : chatId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$EditMessageImpl implements EditMessage {
  const _$EditMessageImpl(
      {required this.context,
      required this.message,
      required this.messageId,
      required this.chatId});

  @override
  final BuildContext context;
  @override
  final String message;
  @override
  final String messageId;
  @override
  final String? chatId;

  @override
  String toString() {
    return 'ChatEvent.editMessage(context: $context, message: $message, messageId: $messageId, chatId: $chatId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EditMessageImpl &&
            (identical(other.context, context) || other.context == context) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.messageId, messageId) ||
                other.messageId == messageId) &&
            (identical(other.chatId, chatId) || other.chatId == chatId));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, context, message, messageId, chatId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EditMessageImplCopyWith<_$EditMessageImpl> get copyWith =>
      __$$EditMessageImplCopyWithImpl<_$EditMessageImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(BuildContext context, int sellerId) checkChatId,
    required TResult Function(BuildContext context, String file, String? chatId)
        sendImage,
    required TResult Function(
            BuildContext context, String message, String? chatId)
        sendMessage,
    required TResult Function(BuildContext context, String message,
            String messageId, String? chatId)
        editMessage,
    required TResult Function(BuildContext context, String message,
            String messageId, String? chatId)
        replyMessage,
    required TResult Function(
            BuildContext context, String messageId, String? chatId)
        deleteMessage,
    required TResult Function(BuildContext context, String message, int userId,
            Function onSuccess)
        createAndSendMessage,
  }) {
    return editMessage(context, message, messageId, chatId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(BuildContext context, int sellerId)? checkChatId,
    TResult? Function(BuildContext context, String file, String? chatId)?
        sendImage,
    TResult? Function(BuildContext context, String message, String? chatId)?
        sendMessage,
    TResult? Function(BuildContext context, String message, String messageId,
            String? chatId)?
        editMessage,
    TResult? Function(BuildContext context, String message, String messageId,
            String? chatId)?
        replyMessage,
    TResult? Function(BuildContext context, String messageId, String? chatId)?
        deleteMessage,
    TResult? Function(BuildContext context, String message, int userId,
            Function onSuccess)?
        createAndSendMessage,
  }) {
    return editMessage?.call(context, message, messageId, chatId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BuildContext context, int sellerId)? checkChatId,
    TResult Function(BuildContext context, String file, String? chatId)?
        sendImage,
    TResult Function(BuildContext context, String message, String? chatId)?
        sendMessage,
    TResult Function(BuildContext context, String message, String messageId,
            String? chatId)?
        editMessage,
    TResult Function(BuildContext context, String message, String messageId,
            String? chatId)?
        replyMessage,
    TResult Function(BuildContext context, String messageId, String? chatId)?
        deleteMessage,
    TResult Function(BuildContext context, String message, int userId,
            Function onSuccess)?
        createAndSendMessage,
    required TResult orElse(),
  }) {
    if (editMessage != null) {
      return editMessage(context, message, messageId, chatId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CheckChatId value) checkChatId,
    required TResult Function(SendImage value) sendImage,
    required TResult Function(SendMessage value) sendMessage,
    required TResult Function(EditMessage value) editMessage,
    required TResult Function(ReplyMessage value) replyMessage,
    required TResult Function(DeleteMessage value) deleteMessage,
    required TResult Function(CreateAndSendMessage value) createAndSendMessage,
  }) {
    return editMessage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CheckChatId value)? checkChatId,
    TResult? Function(SendImage value)? sendImage,
    TResult? Function(SendMessage value)? sendMessage,
    TResult? Function(EditMessage value)? editMessage,
    TResult? Function(ReplyMessage value)? replyMessage,
    TResult? Function(DeleteMessage value)? deleteMessage,
    TResult? Function(CreateAndSendMessage value)? createAndSendMessage,
  }) {
    return editMessage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CheckChatId value)? checkChatId,
    TResult Function(SendImage value)? sendImage,
    TResult Function(SendMessage value)? sendMessage,
    TResult Function(EditMessage value)? editMessage,
    TResult Function(ReplyMessage value)? replyMessage,
    TResult Function(DeleteMessage value)? deleteMessage,
    TResult Function(CreateAndSendMessage value)? createAndSendMessage,
    required TResult orElse(),
  }) {
    if (editMessage != null) {
      return editMessage(this);
    }
    return orElse();
  }
}

abstract class EditMessage implements ChatEvent {
  const factory EditMessage(
      {required final BuildContext context,
      required final String message,
      required final String messageId,
      required final String? chatId}) = _$EditMessageImpl;

  @override
  BuildContext get context;
  String get message;
  String get messageId;
  String? get chatId;
  @override
  @JsonKey(ignore: true)
  _$$EditMessageImplCopyWith<_$EditMessageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ReplyMessageImplCopyWith<$Res>
    implements $ChatEventCopyWith<$Res> {
  factory _$$ReplyMessageImplCopyWith(
          _$ReplyMessageImpl value, $Res Function(_$ReplyMessageImpl) then) =
      __$$ReplyMessageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {BuildContext context, String message, String messageId, String? chatId});
}

/// @nodoc
class __$$ReplyMessageImplCopyWithImpl<$Res>
    extends _$ChatEventCopyWithImpl<$Res, _$ReplyMessageImpl>
    implements _$$ReplyMessageImplCopyWith<$Res> {
  __$$ReplyMessageImplCopyWithImpl(
      _$ReplyMessageImpl _value, $Res Function(_$ReplyMessageImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? context = null,
    Object? message = null,
    Object? messageId = null,
    Object? chatId = freezed,
  }) {
    return _then(_$ReplyMessageImpl(
      context: null == context
          ? _value.context
          : context // ignore: cast_nullable_to_non_nullable
              as BuildContext,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      messageId: null == messageId
          ? _value.messageId
          : messageId // ignore: cast_nullable_to_non_nullable
              as String,
      chatId: freezed == chatId
          ? _value.chatId
          : chatId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$ReplyMessageImpl implements ReplyMessage {
  const _$ReplyMessageImpl(
      {required this.context,
      required this.message,
      required this.messageId,
      required this.chatId});

  @override
  final BuildContext context;
  @override
  final String message;
  @override
  final String messageId;
  @override
  final String? chatId;

  @override
  String toString() {
    return 'ChatEvent.replyMessage(context: $context, message: $message, messageId: $messageId, chatId: $chatId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReplyMessageImpl &&
            (identical(other.context, context) || other.context == context) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.messageId, messageId) ||
                other.messageId == messageId) &&
            (identical(other.chatId, chatId) || other.chatId == chatId));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, context, message, messageId, chatId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ReplyMessageImplCopyWith<_$ReplyMessageImpl> get copyWith =>
      __$$ReplyMessageImplCopyWithImpl<_$ReplyMessageImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(BuildContext context, int sellerId) checkChatId,
    required TResult Function(BuildContext context, String file, String? chatId)
        sendImage,
    required TResult Function(
            BuildContext context, String message, String? chatId)
        sendMessage,
    required TResult Function(BuildContext context, String message,
            String messageId, String? chatId)
        editMessage,
    required TResult Function(BuildContext context, String message,
            String messageId, String? chatId)
        replyMessage,
    required TResult Function(
            BuildContext context, String messageId, String? chatId)
        deleteMessage,
    required TResult Function(BuildContext context, String message, int userId,
            Function onSuccess)
        createAndSendMessage,
  }) {
    return replyMessage(context, message, messageId, chatId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(BuildContext context, int sellerId)? checkChatId,
    TResult? Function(BuildContext context, String file, String? chatId)?
        sendImage,
    TResult? Function(BuildContext context, String message, String? chatId)?
        sendMessage,
    TResult? Function(BuildContext context, String message, String messageId,
            String? chatId)?
        editMessage,
    TResult? Function(BuildContext context, String message, String messageId,
            String? chatId)?
        replyMessage,
    TResult? Function(BuildContext context, String messageId, String? chatId)?
        deleteMessage,
    TResult? Function(BuildContext context, String message, int userId,
            Function onSuccess)?
        createAndSendMessage,
  }) {
    return replyMessage?.call(context, message, messageId, chatId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BuildContext context, int sellerId)? checkChatId,
    TResult Function(BuildContext context, String file, String? chatId)?
        sendImage,
    TResult Function(BuildContext context, String message, String? chatId)?
        sendMessage,
    TResult Function(BuildContext context, String message, String messageId,
            String? chatId)?
        editMessage,
    TResult Function(BuildContext context, String message, String messageId,
            String? chatId)?
        replyMessage,
    TResult Function(BuildContext context, String messageId, String? chatId)?
        deleteMessage,
    TResult Function(BuildContext context, String message, int userId,
            Function onSuccess)?
        createAndSendMessage,
    required TResult orElse(),
  }) {
    if (replyMessage != null) {
      return replyMessage(context, message, messageId, chatId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CheckChatId value) checkChatId,
    required TResult Function(SendImage value) sendImage,
    required TResult Function(SendMessage value) sendMessage,
    required TResult Function(EditMessage value) editMessage,
    required TResult Function(ReplyMessage value) replyMessage,
    required TResult Function(DeleteMessage value) deleteMessage,
    required TResult Function(CreateAndSendMessage value) createAndSendMessage,
  }) {
    return replyMessage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CheckChatId value)? checkChatId,
    TResult? Function(SendImage value)? sendImage,
    TResult? Function(SendMessage value)? sendMessage,
    TResult? Function(EditMessage value)? editMessage,
    TResult? Function(ReplyMessage value)? replyMessage,
    TResult? Function(DeleteMessage value)? deleteMessage,
    TResult? Function(CreateAndSendMessage value)? createAndSendMessage,
  }) {
    return replyMessage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CheckChatId value)? checkChatId,
    TResult Function(SendImage value)? sendImage,
    TResult Function(SendMessage value)? sendMessage,
    TResult Function(EditMessage value)? editMessage,
    TResult Function(ReplyMessage value)? replyMessage,
    TResult Function(DeleteMessage value)? deleteMessage,
    TResult Function(CreateAndSendMessage value)? createAndSendMessage,
    required TResult orElse(),
  }) {
    if (replyMessage != null) {
      return replyMessage(this);
    }
    return orElse();
  }
}

abstract class ReplyMessage implements ChatEvent {
  const factory ReplyMessage(
      {required final BuildContext context,
      required final String message,
      required final String messageId,
      required final String? chatId}) = _$ReplyMessageImpl;

  @override
  BuildContext get context;
  String get message;
  String get messageId;
  String? get chatId;
  @override
  @JsonKey(ignore: true)
  _$$ReplyMessageImplCopyWith<_$ReplyMessageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DeleteMessageImplCopyWith<$Res>
    implements $ChatEventCopyWith<$Res> {
  factory _$$DeleteMessageImplCopyWith(
          _$DeleteMessageImpl value, $Res Function(_$DeleteMessageImpl) then) =
      __$$DeleteMessageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({BuildContext context, String messageId, String? chatId});
}

/// @nodoc
class __$$DeleteMessageImplCopyWithImpl<$Res>
    extends _$ChatEventCopyWithImpl<$Res, _$DeleteMessageImpl>
    implements _$$DeleteMessageImplCopyWith<$Res> {
  __$$DeleteMessageImplCopyWithImpl(
      _$DeleteMessageImpl _value, $Res Function(_$DeleteMessageImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? context = null,
    Object? messageId = null,
    Object? chatId = freezed,
  }) {
    return _then(_$DeleteMessageImpl(
      context: null == context
          ? _value.context
          : context // ignore: cast_nullable_to_non_nullable
              as BuildContext,
      messageId: null == messageId
          ? _value.messageId
          : messageId // ignore: cast_nullable_to_non_nullable
              as String,
      chatId: freezed == chatId
          ? _value.chatId
          : chatId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$DeleteMessageImpl implements DeleteMessage {
  const _$DeleteMessageImpl(
      {required this.context, required this.messageId, required this.chatId});

  @override
  final BuildContext context;
  @override
  final String messageId;
  @override
  final String? chatId;

  @override
  String toString() {
    return 'ChatEvent.deleteMessage(context: $context, messageId: $messageId, chatId: $chatId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeleteMessageImpl &&
            (identical(other.context, context) || other.context == context) &&
            (identical(other.messageId, messageId) ||
                other.messageId == messageId) &&
            (identical(other.chatId, chatId) || other.chatId == chatId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, context, messageId, chatId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DeleteMessageImplCopyWith<_$DeleteMessageImpl> get copyWith =>
      __$$DeleteMessageImplCopyWithImpl<_$DeleteMessageImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(BuildContext context, int sellerId) checkChatId,
    required TResult Function(BuildContext context, String file, String? chatId)
        sendImage,
    required TResult Function(
            BuildContext context, String message, String? chatId)
        sendMessage,
    required TResult Function(BuildContext context, String message,
            String messageId, String? chatId)
        editMessage,
    required TResult Function(BuildContext context, String message,
            String messageId, String? chatId)
        replyMessage,
    required TResult Function(
            BuildContext context, String messageId, String? chatId)
        deleteMessage,
    required TResult Function(BuildContext context, String message, int userId,
            Function onSuccess)
        createAndSendMessage,
  }) {
    return deleteMessage(context, messageId, chatId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(BuildContext context, int sellerId)? checkChatId,
    TResult? Function(BuildContext context, String file, String? chatId)?
        sendImage,
    TResult? Function(BuildContext context, String message, String? chatId)?
        sendMessage,
    TResult? Function(BuildContext context, String message, String messageId,
            String? chatId)?
        editMessage,
    TResult? Function(BuildContext context, String message, String messageId,
            String? chatId)?
        replyMessage,
    TResult? Function(BuildContext context, String messageId, String? chatId)?
        deleteMessage,
    TResult? Function(BuildContext context, String message, int userId,
            Function onSuccess)?
        createAndSendMessage,
  }) {
    return deleteMessage?.call(context, messageId, chatId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BuildContext context, int sellerId)? checkChatId,
    TResult Function(BuildContext context, String file, String? chatId)?
        sendImage,
    TResult Function(BuildContext context, String message, String? chatId)?
        sendMessage,
    TResult Function(BuildContext context, String message, String messageId,
            String? chatId)?
        editMessage,
    TResult Function(BuildContext context, String message, String messageId,
            String? chatId)?
        replyMessage,
    TResult Function(BuildContext context, String messageId, String? chatId)?
        deleteMessage,
    TResult Function(BuildContext context, String message, int userId,
            Function onSuccess)?
        createAndSendMessage,
    required TResult orElse(),
  }) {
    if (deleteMessage != null) {
      return deleteMessage(context, messageId, chatId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CheckChatId value) checkChatId,
    required TResult Function(SendImage value) sendImage,
    required TResult Function(SendMessage value) sendMessage,
    required TResult Function(EditMessage value) editMessage,
    required TResult Function(ReplyMessage value) replyMessage,
    required TResult Function(DeleteMessage value) deleteMessage,
    required TResult Function(CreateAndSendMessage value) createAndSendMessage,
  }) {
    return deleteMessage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CheckChatId value)? checkChatId,
    TResult? Function(SendImage value)? sendImage,
    TResult? Function(SendMessage value)? sendMessage,
    TResult? Function(EditMessage value)? editMessage,
    TResult? Function(ReplyMessage value)? replyMessage,
    TResult? Function(DeleteMessage value)? deleteMessage,
    TResult? Function(CreateAndSendMessage value)? createAndSendMessage,
  }) {
    return deleteMessage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CheckChatId value)? checkChatId,
    TResult Function(SendImage value)? sendImage,
    TResult Function(SendMessage value)? sendMessage,
    TResult Function(EditMessage value)? editMessage,
    TResult Function(ReplyMessage value)? replyMessage,
    TResult Function(DeleteMessage value)? deleteMessage,
    TResult Function(CreateAndSendMessage value)? createAndSendMessage,
    required TResult orElse(),
  }) {
    if (deleteMessage != null) {
      return deleteMessage(this);
    }
    return orElse();
  }
}

abstract class DeleteMessage implements ChatEvent {
  const factory DeleteMessage(
      {required final BuildContext context,
      required final String messageId,
      required final String? chatId}) = _$DeleteMessageImpl;

  @override
  BuildContext get context;
  String get messageId;
  String? get chatId;
  @override
  @JsonKey(ignore: true)
  _$$DeleteMessageImplCopyWith<_$DeleteMessageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CreateAndSendMessageImplCopyWith<$Res>
    implements $ChatEventCopyWith<$Res> {
  factory _$$CreateAndSendMessageImplCopyWith(_$CreateAndSendMessageImpl value,
          $Res Function(_$CreateAndSendMessageImpl) then) =
      __$$CreateAndSendMessageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {BuildContext context, String message, int userId, Function onSuccess});
}

/// @nodoc
class __$$CreateAndSendMessageImplCopyWithImpl<$Res>
    extends _$ChatEventCopyWithImpl<$Res, _$CreateAndSendMessageImpl>
    implements _$$CreateAndSendMessageImplCopyWith<$Res> {
  __$$CreateAndSendMessageImplCopyWithImpl(_$CreateAndSendMessageImpl _value,
      $Res Function(_$CreateAndSendMessageImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? context = null,
    Object? message = null,
    Object? userId = null,
    Object? onSuccess = null,
  }) {
    return _then(_$CreateAndSendMessageImpl(
      context: null == context
          ? _value.context
          : context // ignore: cast_nullable_to_non_nullable
              as BuildContext,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      onSuccess: null == onSuccess
          ? _value.onSuccess
          : onSuccess // ignore: cast_nullable_to_non_nullable
              as Function,
    ));
  }
}

/// @nodoc

class _$CreateAndSendMessageImpl implements CreateAndSendMessage {
  const _$CreateAndSendMessageImpl(
      {required this.context,
      required this.message,
      required this.userId,
      required this.onSuccess});

  @override
  final BuildContext context;
  @override
  final String message;
  @override
  final int userId;
  @override
  final Function onSuccess;

  @override
  String toString() {
    return 'ChatEvent.createAndSendMessage(context: $context, message: $message, userId: $userId, onSuccess: $onSuccess)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateAndSendMessageImpl &&
            (identical(other.context, context) || other.context == context) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.onSuccess, onSuccess) ||
                other.onSuccess == onSuccess));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, context, message, userId, onSuccess);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateAndSendMessageImplCopyWith<_$CreateAndSendMessageImpl>
      get copyWith =>
          __$$CreateAndSendMessageImplCopyWithImpl<_$CreateAndSendMessageImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(BuildContext context, int sellerId) checkChatId,
    required TResult Function(BuildContext context, String file, String? chatId)
        sendImage,
    required TResult Function(
            BuildContext context, String message, String? chatId)
        sendMessage,
    required TResult Function(BuildContext context, String message,
            String messageId, String? chatId)
        editMessage,
    required TResult Function(BuildContext context, String message,
            String messageId, String? chatId)
        replyMessage,
    required TResult Function(
            BuildContext context, String messageId, String? chatId)
        deleteMessage,
    required TResult Function(BuildContext context, String message, int userId,
            Function onSuccess)
        createAndSendMessage,
  }) {
    return createAndSendMessage(context, message, userId, onSuccess);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(BuildContext context, int sellerId)? checkChatId,
    TResult? Function(BuildContext context, String file, String? chatId)?
        sendImage,
    TResult? Function(BuildContext context, String message, String? chatId)?
        sendMessage,
    TResult? Function(BuildContext context, String message, String messageId,
            String? chatId)?
        editMessage,
    TResult? Function(BuildContext context, String message, String messageId,
            String? chatId)?
        replyMessage,
    TResult? Function(BuildContext context, String messageId, String? chatId)?
        deleteMessage,
    TResult? Function(BuildContext context, String message, int userId,
            Function onSuccess)?
        createAndSendMessage,
  }) {
    return createAndSendMessage?.call(context, message, userId, onSuccess);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BuildContext context, int sellerId)? checkChatId,
    TResult Function(BuildContext context, String file, String? chatId)?
        sendImage,
    TResult Function(BuildContext context, String message, String? chatId)?
        sendMessage,
    TResult Function(BuildContext context, String message, String messageId,
            String? chatId)?
        editMessage,
    TResult Function(BuildContext context, String message, String messageId,
            String? chatId)?
        replyMessage,
    TResult Function(BuildContext context, String messageId, String? chatId)?
        deleteMessage,
    TResult Function(BuildContext context, String message, int userId,
            Function onSuccess)?
        createAndSendMessage,
    required TResult orElse(),
  }) {
    if (createAndSendMessage != null) {
      return createAndSendMessage(context, message, userId, onSuccess);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CheckChatId value) checkChatId,
    required TResult Function(SendImage value) sendImage,
    required TResult Function(SendMessage value) sendMessage,
    required TResult Function(EditMessage value) editMessage,
    required TResult Function(ReplyMessage value) replyMessage,
    required TResult Function(DeleteMessage value) deleteMessage,
    required TResult Function(CreateAndSendMessage value) createAndSendMessage,
  }) {
    return createAndSendMessage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CheckChatId value)? checkChatId,
    TResult? Function(SendImage value)? sendImage,
    TResult? Function(SendMessage value)? sendMessage,
    TResult? Function(EditMessage value)? editMessage,
    TResult? Function(ReplyMessage value)? replyMessage,
    TResult? Function(DeleteMessage value)? deleteMessage,
    TResult? Function(CreateAndSendMessage value)? createAndSendMessage,
  }) {
    return createAndSendMessage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CheckChatId value)? checkChatId,
    TResult Function(SendImage value)? sendImage,
    TResult Function(SendMessage value)? sendMessage,
    TResult Function(EditMessage value)? editMessage,
    TResult Function(ReplyMessage value)? replyMessage,
    TResult Function(DeleteMessage value)? deleteMessage,
    TResult Function(CreateAndSendMessage value)? createAndSendMessage,
    required TResult orElse(),
  }) {
    if (createAndSendMessage != null) {
      return createAndSendMessage(this);
    }
    return orElse();
  }
}

abstract class CreateAndSendMessage implements ChatEvent {
  const factory CreateAndSendMessage(
      {required final BuildContext context,
      required final String message,
      required final int userId,
      required final Function onSuccess}) = _$CreateAndSendMessageImpl;

  @override
  BuildContext get context;
  String get message;
  int get userId;
  Function get onSuccess;
  @override
  @JsonKey(ignore: true)
  _$$CreateAndSendMessageImplCopyWith<_$CreateAndSendMessageImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ChatState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isButtonLoading => throw _privateConstructorUsedError;
  bool get isMessageLoading => throw _privateConstructorUsedError;
  ChatModel? get chatModel => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ChatStateCopyWith<ChatState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatStateCopyWith<$Res> {
  factory $ChatStateCopyWith(ChatState value, $Res Function(ChatState) then) =
      _$ChatStateCopyWithImpl<$Res, ChatState>;
  @useResult
  $Res call(
      {bool isLoading,
      bool isButtonLoading,
      bool isMessageLoading,
      ChatModel? chatModel});
}

/// @nodoc
class _$ChatStateCopyWithImpl<$Res, $Val extends ChatState>
    implements $ChatStateCopyWith<$Res> {
  _$ChatStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isButtonLoading = null,
    Object? isMessageLoading = null,
    Object? chatModel = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isButtonLoading: null == isButtonLoading
          ? _value.isButtonLoading
          : isButtonLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isMessageLoading: null == isMessageLoading
          ? _value.isMessageLoading
          : isMessageLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      chatModel: freezed == chatModel
          ? _value.chatModel
          : chatModel // ignore: cast_nullable_to_non_nullable
              as ChatModel?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChatStateImplCopyWith<$Res>
    implements $ChatStateCopyWith<$Res> {
  factory _$$ChatStateImplCopyWith(
          _$ChatStateImpl value, $Res Function(_$ChatStateImpl) then) =
      __$$ChatStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      bool isButtonLoading,
      bool isMessageLoading,
      ChatModel? chatModel});
}

/// @nodoc
class __$$ChatStateImplCopyWithImpl<$Res>
    extends _$ChatStateCopyWithImpl<$Res, _$ChatStateImpl>
    implements _$$ChatStateImplCopyWith<$Res> {
  __$$ChatStateImplCopyWithImpl(
      _$ChatStateImpl _value, $Res Function(_$ChatStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isButtonLoading = null,
    Object? isMessageLoading = null,
    Object? chatModel = freezed,
  }) {
    return _then(_$ChatStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isButtonLoading: null == isButtonLoading
          ? _value.isButtonLoading
          : isButtonLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isMessageLoading: null == isMessageLoading
          ? _value.isMessageLoading
          : isMessageLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      chatModel: freezed == chatModel
          ? _value.chatModel
          : chatModel // ignore: cast_nullable_to_non_nullable
              as ChatModel?,
    ));
  }
}

/// @nodoc

class _$ChatStateImpl implements _ChatState {
  const _$ChatStateImpl(
      {this.isLoading = true,
      this.isButtonLoading = false,
      this.isMessageLoading = true,
      this.chatModel = null});

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool isButtonLoading;
  @override
  @JsonKey()
  final bool isMessageLoading;
  @override
  @JsonKey()
  final ChatModel? chatModel;

  @override
  String toString() {
    return 'ChatState(isLoading: $isLoading, isButtonLoading: $isButtonLoading, isMessageLoading: $isMessageLoading, chatModel: $chatModel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isButtonLoading, isButtonLoading) ||
                other.isButtonLoading == isButtonLoading) &&
            (identical(other.isMessageLoading, isMessageLoading) ||
                other.isMessageLoading == isMessageLoading) &&
            (identical(other.chatModel, chatModel) ||
                other.chatModel == chatModel));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, isLoading, isButtonLoading, isMessageLoading, chatModel);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatStateImplCopyWith<_$ChatStateImpl> get copyWith =>
      __$$ChatStateImplCopyWithImpl<_$ChatStateImpl>(this, _$identity);
}

abstract class _ChatState implements ChatState {
  const factory _ChatState(
      {final bool isLoading,
      final bool isButtonLoading,
      final bool isMessageLoading,
      final ChatModel? chatModel}) = _$ChatStateImpl;

  @override
  bool get isLoading;
  @override
  bool get isButtonLoading;
  @override
  bool get isMessageLoading;
  @override
  ChatModel? get chatModel;
  @override
  @JsonKey(ignore: true)
  _$$ChatStateImplCopyWith<_$ChatStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
