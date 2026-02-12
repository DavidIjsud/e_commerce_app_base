import 'package:equatable/equatable.dart';

/// Represents a single chat message
class ChatMessageEntity extends Equatable {
  final String id;
  final String contactId;
  final String content;
  final String timestamp;
  final bool isFromMe;
  final bool isRead;

  const ChatMessageEntity({
    required this.id,
    required this.contactId,
    required this.content,
    required this.timestamp,
    required this.isFromMe,
    required this.isRead,
  });

  ChatMessageEntity copyWith({
    String? id,
    String? contactId,
    String? content,
    String? timestamp,
    bool? isFromMe,
    bool? isRead,
  }) {
    return ChatMessageEntity(
      id: id ?? this.id,
      contactId: contactId ?? this.contactId,
      content: content ?? this.content,
      timestamp: timestamp ?? this.timestamp,
      isFromMe: isFromMe ?? this.isFromMe,
      isRead: isRead ?? this.isRead,
    );
  }

  @override
  List<Object?> get props => [id, contactId, content, timestamp, isFromMe, isRead];
}
