import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_commerce_app_base/features/chat/presentation/blocs/blocs.dart';
import 'package:e_commerce_app_base/features/chat/presentation/widgets/chat_message_bubble.dart';

/// Scrollable list of message bubbles for the current conversation.
/// Auto-scrolls to the bottom when new messages arrive.
class ChatMessagesList extends StatefulWidget {
  const ChatMessagesList({super.key});

  @override
  State<ChatMessagesList> createState() => _ChatMessagesListState();
}

class _ChatMessagesListState extends State<ChatMessagesList> {
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ChatBloc, ChatState>(
      listenWhen: (prev, curr) =>
          prev.currentMessages.length != curr.currentMessages.length,
      listener: (context, state) => _scrollToBottom(),
      builder: (context, state) {
        final messages = state.currentMessages;

        if (messages.isEmpty) {
          return const Expanded(child: SizedBox.shrink());
        }

        return Expanded(
          child: ListView.builder(
            controller: _scrollController,
            padding: const EdgeInsets.symmetric(vertical: 12),
            itemCount: messages.length,
            itemBuilder: (context, index) {
              final message = messages[index];
              // Show avatar only on the first message from them in a group
              final showAvatar = !message.isFromMe &&
                  (index == 0 || messages[index - 1].isFromMe);
              return ChatMessageBubble(
                message: message,
                showAvatar: showAvatar,
              );
            },
          ),
        );
      },
    );
  }
}
