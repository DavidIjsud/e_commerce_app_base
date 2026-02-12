import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_commerce_app_base/config/config.dart';
import 'package:e_commerce_app_base/injector.dart';
import 'package:e_commerce_app_base/features/chat/presentation/blocs/blocs.dart';

/// Bottom input bar for typing and sending messages.
///
/// Contains: emoji icon | text field | attachment icon | send button
class ChatInputBar extends StatefulWidget {
  const ChatInputBar({super.key});

  @override
  State<ChatInputBar> createState() => _ChatInputBarState();
}

class _ChatInputBarState extends State<ChatInputBar> {
  final TextEditingController _controller = TextEditingController();
  bool _hasText = false;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      final hasText = _controller.text.trim().isNotEmpty;
      if (hasText != _hasText) {
        setState(() => _hasText = hasText);
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _sendMessage(BuildContext context) {
    if (_controller.text.trim().isEmpty) return;
    context.read<ChatBloc>().add(ChatMessageSent(_controller.text));
    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    final config = Get.injector<Config>();
    final colors = config.theme.themeColors;
    final typography = config.theme.typography;

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
      child: Row(
        children: [
          // Text field + emoji + attachment
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: colors.neutral10,
                borderRadius: BorderRadius.circular(32),
                border: Border.all(color: colors.neutral40),
              ),
              child: Row(
                children: [
                  // Emoji icon
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.sentiment_satisfied_alt_outlined,
                      color: colors.neutral60,
                      size: 22,
                    ),
                    splashRadius: 20,
                  ),
                  // Text field
                  Expanded(
                    child: TextField(
                      controller: _controller,
                      onSubmitted: (_) => _sendMessage(context),
                      style: typography.bodyMediumRegular.copyWith(
                        color: colors.neutral100,
                      ),
                      decoration: InputDecoration(
                        hintText: 'Type something...',
                        hintStyle: typography.bodyMediumRegular.copyWith(
                          color: colors.neutral50,
                        ),
                        border: InputBorder.none,
                        isDense: true,
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 10,
                        ),
                      ),
                    ),
                  ),
                  // Attachment icon
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.attach_file,
                      color: colors.neutral60,
                      size: 22,
                    ),
                    splashRadius: 20,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 10),
          // Send button
          GestureDetector(
            onTap: () => _sendMessage(context),
            child: Container(
              width: 52,
              height: 52,
              decoration: BoxDecoration(
                color: colors.primaryHoverIris,
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Icon(Icons.send, color: Colors.white, size: 22),
            ),
          ),
        ],
      ),
    );
  }
}
