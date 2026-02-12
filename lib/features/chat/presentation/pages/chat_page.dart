import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_commerce_app_base/config/config.dart';
import 'package:e_commerce_app_base/injector.dart';
import 'package:e_commerce_app_base/features/chat/presentation/blocs/blocs.dart';
import 'package:e_commerce_app_base/features/chat/presentation/widgets/widgets.dart';

/// Entry-point widget for the Chat tab.
///
/// Dispatches [ChatInitialized] on first mount, then listens to [ChatBloc]
/// and switches between:
/// - [_ChatListView]         — when no contact is selected
/// - [_ChatConversationView] — when a contact is selected
class ChatPageContent extends StatefulWidget {
  const ChatPageContent({super.key});

  @override
  State<ChatPageContent> createState() => _ChatPageContentState();
}

class _ChatPageContentState extends State<ChatPageContent> {
  @override
  void initState() {
    super.initState();
    context.read<ChatBloc>().add(const ChatInitialized());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatBloc, ChatState>(
      builder: (context, state) {
        if (state.selectedContact != null) {
          return const _ChatConversationView();
        }
        return const _ChatListView();
      },
    );
  }
}

// ---------------------------------------------------------------------------
// Chat list view — shows all conversations
// ---------------------------------------------------------------------------

class _ChatListView extends StatelessWidget {
  const _ChatListView();

  @override
  Widget build(BuildContext context) {
    final colors = Get.injector<Config>().theme.themeColors;

    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          const ChatListHeader(),
          const SizedBox(height: 8),
          Divider(color: colors.neutral30, thickness: 1),
          BlocBuilder<ChatBloc, ChatState>(
            builder: (context, state) {
              final contacts = state.contacts;
              if (contacts.isEmpty) {
                return const Expanded(child: SizedBox.shrink());
              }
              return Expanded(
                child: ListView.separated(
                  itemCount: contacts.length,
                  separatorBuilder: (_, __) =>
                      Divider(color: colors.neutral30, thickness: 1, height: 0),
                  itemBuilder: (context, index) {
                    final contact = contacts[index];
                    return ChatContactCard(
                      contact: contact,
                      onTap: () {
                        context
                            .read<ChatBloc>()
                            .add(ChatContactSelected(contact.id));
                      },
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Conversation view — shows messages for the selected contact
// ---------------------------------------------------------------------------

class _ChatConversationView extends StatelessWidget {
  const _ChatConversationView();

  @override
  Widget build(BuildContext context) {
    final colors = Get.injector<Config>().theme.themeColors;

    return SafeArea(
      child: Column(
        children: [
          // Header with back + avatar + name
          const ChatConversationHeader(),
          Divider(color: colors.neutral30, thickness: 1, height: 0),
          // Messages
          const ChatMessagesList(),
          // Input bar
          const ChatInputBar(),
        ],
      ),
    );
  }
}
