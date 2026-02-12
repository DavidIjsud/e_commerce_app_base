import 'package:flutter/material.dart';
import 'package:e_commerce_app_base/config/config.dart';
import 'package:e_commerce_app_base/injector.dart';
import 'package:e_commerce_app_base/features/chat/domain/entities/entities.dart';
import 'package:e_commerce_app_base/features/chat/presentation/widgets/chat_avatar.dart';

/// Card displaying a contact's conversation summary in the chat list
class ChatContactCard extends StatelessWidget {
  final ChatContactEntity contact;
  final VoidCallback onTap;

  const ChatContactCard({
    super.key,
    required this.contact,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final config = Get.injector<Config>();
    final colors = config.theme.themeColors;
    final typography = config.theme.typography;

    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        child: Row(
          children: [
            ChatAvatar(isOnline: contact.isOnline),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    contact.name,
                    style: typography.bodyLargeBold.copyWith(
                      color: colors.neutral100,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 2),
                  Text(
                    contact.lastMessage,
                    style: typography.bodySmallRegular.copyWith(
                      color: colors.neutral60,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  contact.lastMessageTime,
                  style: typography.bodySmallRegular.copyWith(
                    color: contact.unreadCount > 0 ? colors.primaryHoverIris : colors.neutral60,
                  ),
                ),
                if (contact.unreadCount > 0) ...[
                  const SizedBox(height: 4),
                  Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: colors.primaryHoverIris,
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      '${contact.unreadCount}',
                      style: typography.bodySmallBold.copyWith(
                        color: Colors.white,
                        fontSize: 10,
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ],
        ),
      ),
    );
  }
}
