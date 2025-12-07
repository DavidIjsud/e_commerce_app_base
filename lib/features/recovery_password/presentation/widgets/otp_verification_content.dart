import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:e_commerce_app_base/l10n/app_localizations.dart';
import 'package:e_commerce_app_base/injector.dart';
import 'package:e_commerce_app_base/config/config.dart';

/// Content widget for OTP verification page
///
/// Displays title, email, and OTP input fields
class OTPVerificationContent extends StatefulWidget {
  const OTPVerificationContent({
    super.key,
    required this.email,
    required this.otpCode,
    required this.onCodeChanged,
  });

  final String email;
  final String otpCode;
  final ValueChanged<String> onCodeChanged;

  @override
  State<OTPVerificationContent> createState() => _OTPVerificationContentState();
}

class _OTPVerificationContentState extends State<OTPVerificationContent> {
  final List<TextEditingController> _controllers = List.generate(
    4,
    (_) => TextEditingController(),
  );
  final List<FocusNode> _focusNodes = List.generate(
    4,
    (_) => FocusNode(),
  );

  @override
  void initState() {
    super.initState();
    _updateControllers();
  }

  @override
  void didUpdateWidget(OTPVerificationContent oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.otpCode != widget.otpCode) {
      _updateControllers();
    }
  }

  void _updateControllers() {
    for (int i = 0; i < 4; i++) {
      if (i < widget.otpCode.length) {
        _controllers[i].text = widget.otpCode[i];
      } else {
        _controllers[i].text = '';
      }
    }
  }

  void _onDigitChanged(int index, String value) {
    if (value.isNotEmpty) {
      // Build new code by setting digit at index
      final currentCode = widget.otpCode;
      String newCode;
      
      if (currentCode.length <= index) {
        // Append to end
        newCode = currentCode + value;
      } else {
        // Replace at index
        newCode = currentCode.substring(0, index) +
            value +
            (index + 1 < currentCode.length
                ? currentCode.substring(index + 1)
                : '');
      }
      
      // Limit to 4 digits
      if (newCode.length <= 4) {
        widget.onCodeChanged(newCode);
        
        // Auto-focus next field
        if (index < 3 && newCode.length == index + 1) {
          _focusNodes[index + 1].requestFocus();
        }
      }
    } else {
      // Handle backspace - remove digit at index
      final currentCode = widget.otpCode;
      if (currentCode.isNotEmpty) {
        String newCode;
        if (index < currentCode.length) {
          // Remove digit at index
          newCode = currentCode.substring(0, index) +
              currentCode.substring(index + 1);
        } else {
          // Remove last digit
          newCode = currentCode.substring(0, currentCode.length - 1);
        }
        widget.onCodeChanged(newCode);
      }
      
      // Focus previous field
      if (index > 0) {
        _focusNodes[index - 1].requestFocus();
      }
    }
  }

  @override
  void dispose() {
    for (final controller in _controllers) {
      controller.dispose();
    }
    for (final focusNode in _focusNodes) {
      focusNode.dispose();
    }
    super.dispose();
  }

  /// Masks email address for display
  String _maskEmail(String email) {
    if (email.isEmpty) return '';
    
    final parts = email.split('@');
    if (parts.length != 2) return email;
    
    final username = parts[0];
    final domain = parts[1];
    
    if (username.length <= 2) {
      return '${username[0]}******@$domain';
    }
    
    final visibleChars = username.substring(0, 2);
    return '$visibleChars******@$domain';
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final config = Get.injector<Config>();
    final colors = config.theme.themeColors;
    final typography = config.theme.typography;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Title
        Text(
          l10n.otp_verification_page_title,
          style: typography.heading3Bold.copyWith(
            color: colors.neutral100,
          ),
        ),
        const SizedBox(height: 16),
        // Instruction text
        Text(
          l10n.otp_verification_instruction,
          style: typography.bodyMediumRegular.copyWith(
            color: colors.neutral60,
          ),
        ),
        const SizedBox(height: 8),
        // Masked email
        Text(
          _maskEmail(widget.email),
          style: typography.bodyMediumRegular.copyWith(
            color: colors.neutral60,
          ),
        ),
        const SizedBox(height: 32),
        // OTP input fields
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(4, (index) {
            return _OTPInputField(
              controller: _controllers[index],
              focusNode: _focusNodes[index],
              onChanged: (value) => _onDigitChanged(index, value),
            );
          }),
        ),
      ],
    );
  }
}

/// Individual OTP input field
class _OTPInputField extends StatelessWidget {
  const _OTPInputField({
    required this.controller,
    required this.focusNode,
    required this.onChanged,
  });

  final TextEditingController controller;
  final FocusNode focusNode;
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    final config = Get.injector<Config>();
    final colors = config.theme.themeColors;
    final typography = config.theme.typography;

    return SizedBox(
      width: 64,
      height: 64,
      child: TextFormField(
        controller: controller,
        focusNode: focusNode,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        maxLength: 1,
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
        ],
        style: typography.heading4Bold.copyWith(
          color: colors.neutral100,
        ),
        decoration: InputDecoration(
          counterText: '',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: colors.neutral40),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: colors.neutral40),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: colors.primaryHoverIris, width: 2),
          ),
          filled: true,
          fillColor: Colors.white,
          contentPadding: EdgeInsets.zero,
        ),
        onChanged: onChanged,
      ),
    );
  }
}

