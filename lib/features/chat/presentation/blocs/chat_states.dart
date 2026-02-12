import 'package:equatable/equatable.dart';
import 'package:e_commerce_app_base/features/chat/domain/entities/entities.dart';

enum ChatStatus { initial, loaded }

class ChatState extends Equatable {
  final ChatStatus status;
  final List<ChatContactEntity> contacts;
  final ChatContactEntity? selectedContact;

  /// Messages keyed by contactId
  final Map<String, List<ChatMessageEntity>> messagesByContact;

  const ChatState({
    this.status = ChatStatus.initial,
    this.contacts = const [],
    this.selectedContact,
    this.messagesByContact = const {},
  });

  /// Messages for the currently selected conversation
  List<ChatMessageEntity> get currentMessages {
    if (selectedContact == null) return [];
    return messagesByContact[selectedContact!.id] ?? [];
  }

  ChatState copyWith({
    ChatStatus? status,
    List<ChatContactEntity>? contacts,
    ChatContactEntity? selectedContact,
    bool clearSelectedContact = false,
    Map<String, List<ChatMessageEntity>>? messagesByContact,
  }) {
    return ChatState(
      status: status ?? this.status,
      contacts: contacts ?? this.contacts,
      selectedContact: clearSelectedContact ? null : (selectedContact ?? this.selectedContact),
      messagesByContact: messagesByContact ?? this.messagesByContact,
    );
  }

  @override
  List<Object?> get props => [status, contacts, selectedContact, messagesByContact];
}
