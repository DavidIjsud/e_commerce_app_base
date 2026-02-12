import 'package:flutter/material.dart';
import 'package:e_commerce_app_base/config/config.dart';
import 'package:e_commerce_app_base/injector.dart';
import 'package:e_commerce_app_base/features/chat/domain/entities/entities.dart';
import 'package:e_commerce_app_base/features/chat/presentation/widgets/chat_avatar.dart';

/// A single message bubble in a conversation.
///
/// Messages from the other person appear on the left with a person icon.
/// Messages from me appear on the right in the primary orange color.
class ChatMessageBubble extends StatelessWidget {
  final ChatMessageEntity message;

  /// Whether to show the sender's avatar (only for the first message in a group)
  final bool showAvatar;

  const ChatMessageBubble({
    super.key,
    required this.message,
    this.showAvatar = true,
  });

  @override
  Widget build(BuildContext context) {
    return message.isFromMe ? _buildMyMessage(context) : _buildTheirMessage(context);
  }

  Widget _buildMyMessage(BuildContext context) {
    final config = Get.injector<Config>();
    final colors = config.theme.themeColors;
    final typography = config.theme.typography;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width * 0.72,
            ),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: colors.primaryHoverIris,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(18),
                topRight: Radius.circular(18),
                bottomLeft: Radius.circular(18),
                bottomRight: Radius.circular(4),
              ),
            ),
            child: Text(
              message.content,
              style: typography.bodyMediumRegular.copyWith(color: Colors.white),
            ),
          ),
          const SizedBox(height: 4),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                message.timestamp,
                style: typography.bodySmallRegular.copyWith(color: colors.neutral60),
              ),
              const SizedBox(width: 4),
              Icon(
                Icons.done_all,
                size: 16,
                color: message.isRead ? colors.primaryHoverIris : colors.neutral50,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTheirMessage(BuildContext context) {
    final config = Get.injector<Config>();
    final colors = config.theme.themeColors;
    final typography = config.theme.typography;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (showAvatar) ...[
            const ChatAvatar(size: 38),
            const SizedBox(width: 10),
          ] else
            const SizedBox(width: 48),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width * 0.62,
                ),
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                decoration: BoxDecoration(
                  color: colors.neutral30,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(4),
                    topRight: Radius.circular(18),
                    bottomLeft: Radius.circular(18),
                    bottomRight: Radius.circular(18),
                  ),
                ),
                child: Text(
                  message.content,
                  style: typography.bodyMediumRegular.copyWith(
                    color: colors.neutral100,
                  ),
                ),
              ),
              const SizedBox(height: 4),
              Text(
                message.timestamp,
                style: typography.bodySmallRegular.copyWith(color: colors.neutral60),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
