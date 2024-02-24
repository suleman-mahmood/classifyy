part of 'chat_cubit.dart';

@immutable
sealed class ChatState {
  final List<ChatMessage> chatMessages;

  final String errorMessage;

  const ChatState({
    this.chatMessages = const [],
    this.errorMessage = '',
  });
}

final class ChatInitial extends ChatState {
  const ChatInitial();
}

final class ChatLoading extends ChatState {
  const ChatLoading();
}

final class ChatSuccess extends ChatState {
  const ChatSuccess({super.chatMessages});
}

final class ChatFailure extends ChatState {
  const ChatFailure({super.errorMessage});
}