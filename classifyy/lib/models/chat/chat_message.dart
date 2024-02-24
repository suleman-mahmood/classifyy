enum ChatMessageType { currentUser, otherUser }

class ChatMessage {
  final String id;
  final String message;
  final DateTime sentAt;
  final ChatMessageType chatMessageType;
  // final DateTime deliveredAt;
  // final DateTime receivedAt;

  const ChatMessage({
    required this.id,
    required this.message,
    required this.sentAt,
    required this.chatMessageType
  });
}
