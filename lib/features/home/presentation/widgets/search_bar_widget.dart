import 'package:flutter/material.dart';
import 'package:e_commerce_app_base/config/config.dart';
import 'package:e_commerce_app_base/injector.dart';

class SearchBarWidget extends StatefulWidget {
  const SearchBarWidget({
    super.key,
    required this.onQueryChanged,
    required this.onFilterTap,
  });

  final ValueChanged<String> onQueryChanged;
  final VoidCallback onFilterTap;

  @override
  State<SearchBarWidget> createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidget> {
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    // Auto-focus on page load
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _focusNode.requestFocus();
    });
    // Listen to text changes to rebuild clear button
    _controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final config = Get.injector<Config>();
    final colors = config.theme.themeColors;
    final typography = config.theme.typography;

    return Container(
      height: 56,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: colors.neutral20, width: 1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          // Leading search icon
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 12),
            child: Icon(
              Icons.search,
              color: colors.neutral60,
              size: 24,
            ),
          ),

          // Text field
          Expanded(
            child: TextField(
              controller: _controller,
              focusNode: _focusNode,
              onChanged: widget.onQueryChanged,
              style: typography.bodyMediumRegular.copyWith(
                color: colors.neutral100,
              ),
              decoration: InputDecoration(
                hintText: 'Ayam Jago',
                hintStyle: typography.bodyMediumRegular.copyWith(
                  color: colors.neutral40,
                ),
                border: InputBorder.none,
                contentPadding: EdgeInsets.zero,
              ),
            ),
          ),

          // Clear button (shown when text is present)
          if (_controller.text.isNotEmpty)
            IconButton(
              onPressed: () {
                _controller.clear();
                widget.onQueryChanged('');
              },
              icon: Icon(
                Icons.close,
                color: colors.neutral60,
                size: 20,
              ),
            ),

          // Trailing filter icon
          Padding(
            padding: const EdgeInsets.only(left: 8, right: 16),
            child: IconButton(
              onPressed: widget.onFilterTap,
              icon: Icon(
                Icons.tune,
                color: colors.neutral60,
                size: 24,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
