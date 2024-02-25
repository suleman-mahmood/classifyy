import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:classifyy/models/chat/chat_message.dart';
import 'package:classifyy/repositories/repository.dart';
import 'package:meta/meta.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  final Repository repository;

  ChatCubit(this.repository) : super(const ChatInitial());

  Future<void> fetchChatMessages() async {
    emit(const ChatLoading());

    final chatMessages = await repository.fetchChatMessages();

    emit(ChatSuccess(chatMessages: chatMessages));
  }

  Future<void> sendMessage(String message) async {
    final chatMessages = state.chatMessages;

    final newMessage = ChatMessage(
      id: '1',
      text: message,
      sentAt: DateTime.now(),
      chatMessageType: ChatMessageType.currentUser,
    );

    chatMessages.add(newMessage);

    emit(ChatSuccess(chatMessages: chatMessages));
  }
}
