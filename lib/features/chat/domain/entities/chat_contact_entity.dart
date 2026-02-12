import 'package:equatable/equatable.dart';

/// Represents a chat contact / conversation summary
class ChatContactEntity extends Equatable {
  final String id;
  final String name;
  final String lastMessage;
  final String lastMessageTime;
  final bool isOnline;
  final int unreadCount;

  const ChatContactEntity({
    required this.id,
    required this.name,
    required this.lastMessage,
    required this.lastMessageTime,
    required this.isOnline,
    required this.unreadCount,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        lastMessage,
        lastMessageTime,
        isOnline,
        unreadCount,
      ];
}
