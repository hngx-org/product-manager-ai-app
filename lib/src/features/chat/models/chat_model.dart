class ChatMessage {
  final String text;
  final MessageType type;
  final DateTime timestamp;
  final bool isHistory;

  ChatMessage({
    required this.text,
    required this.type,
    required this.timestamp,
    this.isHistory = false,
  });
}

enum MessageType { ai, user }
