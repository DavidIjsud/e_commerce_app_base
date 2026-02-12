import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_commerce_app_base/config/config.dart';
import 'package:e_commerce_app_base/injector.dart';
import 'package:e_commerce_app_base/features/chat/presentation/blocs/blocs.dart';
import 'package:e_commerce_app_base/features/chat/presentation/widgets/chat_avatar.dart';

/// Top header for the conversation view.
/// Shows a back arrow, the contact's avatar + name.
class ChatConversationHeader extends StatelessWidget {
  const ChatConversationHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final config = Get.injector<Config>();
    final colors = config.theme.themeColors;
    final typography = config.theme.typography;

    return BlocBuilder<ChatBloc, ChatState>(
      builder: (context, state) {
        final contact = state.selectedContact;
        if (contact == null) return const SizedBox.shrink();

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          child: Row(
            children: [
              // Back button
              IconButton(
                onPressed: () {
                  context.read<ChatBloc>().add(const ChatConversationClosed());
                },
                icon: Icon(Icons.arrow_back_ios, color: colors.neutral100, size: 20),
              ),
              // Avatar + name (centered)
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ChatAvatar(isOnline: contact.isOnline, size: 38),
                    const SizedBox(width: 10),
                    Text(
                      contact.name,
                      style: typography.heading6Bold.copyWith(
                        color: colors.neutral100,
                      ),
                    ),
                  ],
                ),
              ),
              // Placeholder to balance the back button
              const SizedBox(width: 48),
            ],
          ),
        );
      },
    );
  }
}
