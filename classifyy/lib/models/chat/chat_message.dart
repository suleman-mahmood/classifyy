enum ChatMessageType { currentUser, otherUser }

class ChatMessage {
  final String id;
  final String text;
  final DateTime sentAt;
  final ChatMessageType chatMessageType;
  // final DateTime deliveredAt;
  // final DateTime receivedAt;

  const ChatMessage(
      {required this.id,
      required this.text,
      required this.sentAt,
      required this.chatMessageType});

  static List<ChatMessage> fromMapList(List<dynamic> data, String userId) {
    return data
        .map<ChatMessage>((d) => ChatMessage.fromMap(d, userId))
        .toList();
  }

  factory ChatMessage.fromMap(Map<String, dynamic> map, String userId) {
    return ChatMessage(
      id: 'dummy-chat-msg-id',
      text: map['message'],
      sentAt: DateTime.parse(map['created_at']),
      chatMessageType: map['sender_user_id'] == userId
          ? ChatMessageType.currentUser
          : ChatMessageType.otherUser,
    );
  }
}
