import 'package:equatable/equatable.dart';

abstract class ChatEvent extends Equatable {
  const ChatEvent();

  @override
  List<Object?> get props => [];
}

/// Triggered when the chat list is first loaded
class ChatInitialized extends ChatEvent {
  const ChatInitialized();
}

/// Triggered when the user selects a contact to open a conversation
class ChatContactSelected extends ChatEvent {
  final String contactId;
  const ChatContactSelected(this.contactId);

  @override
  List<Object?> get props => [contactId];
}

/// Triggered when the user closes the conversation and goes back to the list
class ChatConversationClosed extends ChatEvent {
  const ChatConversationClosed();
}

/// Triggered when the user sends a new message
class ChatMessageSent extends ChatEvent {
  final String message;
  const ChatMessageSent(this.message);

  @override
  List<Object?> get props => [message];
}
