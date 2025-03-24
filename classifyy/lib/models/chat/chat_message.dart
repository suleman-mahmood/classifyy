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
      id: map['id'],
      text: map['text'],
      sentAt: DateTime.parse(map['sent_at']),
      chatMessageType: map['sender_id'] == userId
          ? ChatMessageType.currentUser
          : ChatMessageType.otherUser,
    );
  }
}
