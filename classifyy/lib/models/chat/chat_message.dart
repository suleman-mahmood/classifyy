enum ChatMessageType { currentUser, otherUser }

class ChatMessage {
  final String id;
  final String text;
  final DateTime sentAt;
  final ChatMessageType chatMessageType;
  // final DateTime deliveredAt;
  // final DateTime receivedAt;

  const ChatMessage({
    required this.id,
    required this.text,
    required this.sentAt,
    required this.chatMessageType
  });
}
