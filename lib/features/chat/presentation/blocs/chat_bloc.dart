import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_commerce_app_base/features/chat/domain/entities/entities.dart';
import 'package:e_commerce_app_base/features/chat/presentation/blocs/chat_events.dart';
import 'package:e_commerce_app_base/features/chat/presentation/blocs/chat_states.dart';

/// BLoC for managing the chat feature state.
///
/// Handles the contacts list and conversation messages using dummy data.
/// Designed to be replaced with real API calls in the future.
class ChatBloc extends Bloc<ChatEvent, ChatState> {
  ChatBloc() : super(const ChatState()) {
    on<ChatInitialized>(_onInitialized);
    on<ChatContactSelected>(_onContactSelected);
    on<ChatConversationClosed>(_onConversationClosed);
    on<ChatMessageSent>(_onMessageSent);
  }

  void _onInitialized(ChatInitialized event, Emitter<ChatState> emit) {
    final contacts = _dummyContacts();
    final messagesByContact = {
      for (final contact in contacts) contact.id: _dummyMessages(contact.id),
    };

    emit(state.copyWith(
      status: ChatStatus.loaded,
      contacts: contacts,
      messagesByContact: messagesByContact,
    ));
  }

  void _onContactSelected(ChatContactSelected event, Emitter<ChatState> emit) {
    final contact = state.contacts.firstWhere(
      (c) => c.id == event.contactId,
      orElse: () => state.contacts.first,
    );
    emit(state.copyWith(selectedContact: contact));
  }

  void _onConversationClosed(ChatConversationClosed event, Emitter<ChatState> emit) {
    emit(state.copyWith(clearSelectedContact: true));
  }

  void _onMessageSent(ChatMessageSent event, Emitter<ChatState> emit) {
    if (state.selectedContact == null || event.message.trim().isEmpty) return;

    final contactId = state.selectedContact!.id;
    final existing = List<ChatMessageEntity>.from(
      state.messagesByContact[contactId] ?? [],
    );

    final newMessage = ChatMessageEntity(
      id: 'msg_${DateTime.now().millisecondsSinceEpoch}',
      contactId: contactId,
      content: event.message.trim(),
      timestamp: _currentTimeString(),
      isFromMe: true,
      isRead: false,
    );

    existing.add(newMessage);

    final updated = Map<String, List<ChatMessageEntity>>.from(state.messagesByContact);
    updated[contactId] = existing;

    emit(state.copyWith(messagesByContact: updated));
  }

  // ---------------------------------------------------------------------------
  // Dummy data helpers
  // ---------------------------------------------------------------------------

  List<ChatContactEntity> _dummyContacts() {
    return const [
      ChatContactEntity(
        id: 'contact_1',
        name: 'Stevano Clirover',
        lastMessage: 'Okay, Wait a minute 🙏',
        lastMessageTime: '09.15',
        isOnline: true,
        unreadCount: 0,
      ),
      ChatContactEntity(
        id: 'contact_2',
        name: 'Maria Gonzalez',
        lastMessage: 'Your order is on the way!',
        lastMessageTime: '08.45',
        isOnline: false,
        unreadCount: 2,
      ),
      ChatContactEntity(
        id: 'contact_3',
        name: 'James Kitchen',
        lastMessage: 'We have a new spicy menu 🌶️',
        lastMessageTime: 'Yesterday',
        isOnline: true,
        unreadCount: 1,
      ),
      ChatContactEntity(
        id: 'contact_4',
        name: 'Sophie Baker',
        lastMessage: 'Thank you for your order!',
        lastMessageTime: 'Yesterday',
        isOnline: false,
        unreadCount: 0,
      ),
      ChatContactEntity(
        id: 'contact_5',
        name: 'Carlos Delivery',
        lastMessage: 'I\'m 5 minutes away.',
        lastMessageTime: 'Mon',
        isOnline: false,
        unreadCount: 0,
      ),
    ];
  }

  List<ChatMessageEntity> _dummyMessages(String contactId) {
    switch (contactId) {
      case 'contact_1':
        return const [
          ChatMessageEntity(
            id: 'msg_1',
            contactId: 'contact_1',
            content: 'Just to order',
            timestamp: '09.00',
            isFromMe: false,
            isRead: true,
          ),
          ChatMessageEntity(
            id: 'msg_2',
            contactId: 'contact_1',
            content: 'Okay, for what level of spiciness?',
            timestamp: '09.15',
            isFromMe: true,
            isRead: true,
          ),
          ChatMessageEntity(
            id: 'msg_3',
            contactId: 'contact_1',
            content: 'Okay, Wait a minute 🙏',
            timestamp: '09.00',
            isFromMe: false,
            isRead: true,
          ),
          ChatMessageEntity(
            id: 'msg_4',
            contactId: 'contact_1',
            content: 'Okay, I\'m waiting 🙌',
            timestamp: '09.15',
            isFromMe: true,
            isRead: true,
          ),
        ];
      case 'contact_2':
        return const [
          ChatMessageEntity(
            id: 'msg_5',
            contactId: 'contact_2',
            content: 'Hi! I placed an order 10 minutes ago.',
            timestamp: '08.30',
            isFromMe: true,
            isRead: true,
          ),
          ChatMessageEntity(
            id: 'msg_6',
            contactId: 'contact_2',
            content: 'Your order is on the way!',
            timestamp: '08.45',
            isFromMe: false,
            isRead: false,
          ),
          ChatMessageEntity(
            id: 'msg_7',
            contactId: 'contact_2',
            content: 'Estimated delivery in 20 minutes 🚴',
            timestamp: '08.45',
            isFromMe: false,
            isRead: false,
          ),
        ];
      case 'contact_3':
        return const [
          ChatMessageEntity(
            id: 'msg_8',
            contactId: 'contact_3',
            content: 'We have a new spicy menu 🌶️',
            timestamp: 'Yesterday',
            isFromMe: false,
            isRead: false,
          ),
          ChatMessageEntity(
            id: 'msg_9',
            contactId: 'contact_3',
            content: 'Check it out on the app!',
            timestamp: 'Yesterday',
            isFromMe: false,
            isRead: false,
          ),
        ];
      default:
        return const [
          ChatMessageEntity(
            id: 'msg_default',
            contactId: 'default',
            content: 'Hello! How can I help you?',
            timestamp: '10.00',
            isFromMe: false,
            isRead: true,
          ),
        ];
    }
  }

  String _currentTimeString() {
    final now = DateTime.now();
    final hour = now.hour.toString().padLeft(2, '0');
    final minute = now.minute.toString().padLeft(2, '0');
    return '$hour.$minute';
  }
}
