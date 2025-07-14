import 'dart:ui';

import 'package:e_commerce_app_base/themes/typography/palmyrasoft_typography.dart';
import 'package:flutter/src/painting/text_style.dart';

class EcommerceTypography extends PalmyrasoftTypography {
  const EcommerceTypography();

  @override
  TextStyle get bodyLargeBold =>
      const TextStyle(fontFamily: 'Inter', height: 24 / 16, fontSize: 16, fontWeight: FontWeight.w700);

  @override
  TextStyle get bodyLargeMedium =>
      const TextStyle(fontFamily: 'Inter', height: 24 / 16, fontSize: 16, fontWeight: FontWeight.w500);

  @override
  TextStyle get bodyLargeRegular =>
      const TextStyle(fontFamily: 'Inter', fontSize: 16, fontWeight: FontWeight.w400, height: 24 / 16);

  @override
  TextStyle get bodyLargeSemibold =>
      const TextStyle(fontFamily: 'Inter', height: 24 / 16, fontSize: 16, fontWeight: FontWeight.w600);

  @override
  TextStyle get bodyMediumBold =>
      const TextStyle(fontFamily: 'Inter', height: 20 / 14, fontSize: 14, fontWeight: FontWeight.w700);

  @override
  TextStyle get bodyMediumMedium =>
      const TextStyle(fontFamily: 'Inter', height: 20 / 14, fontSize: 14, fontWeight: FontWeight.w500);

  @override
  TextStyle get bodyMediumRegular =>
      const TextStyle(fontFamily: 'Inter', fontSize: 14, fontWeight: FontWeight.w400, height: 20 / 14);

  @override
  TextStyle get bodyMediumSemibold =>
      const TextStyle(fontFamily: 'Inter', height: 20 / 14, fontSize: 14, fontWeight: FontWeight.w600);

  @override
  TextStyle get bodySmallBold =>
      const TextStyle(fontFamily: 'Inter', height: 16 / 12, fontSize: 12, fontWeight: FontWeight.w700);

  @override
  TextStyle get bodySmallMedium =>
      const TextStyle(fontFamily: 'Inter', height: 16 / 12, fontSize: 12, fontWeight: FontWeight.w500);

  @override
  TextStyle get bodySmallRegular =>
      const TextStyle(fontFamily: 'Inter', fontSize: 12, fontWeight: FontWeight.w400, height: 16 / 12);

  @override
  TextStyle get bodySmallSemibold =>
      const TextStyle(fontFamily: 'Inter', height: 16 / 12, fontSize: 12, fontWeight: FontWeight.w600);
  @override
  TextStyle get heading1Bold =>
      const TextStyle(fontFamily: 'Inter', height: 72 / 64, fontSize: 64, fontWeight: FontWeight.w700);

  @override
  TextStyle get heading1Medium =>
      const TextStyle(fontFamily: 'Inter', height: 72 / 64, fontSize: 64, fontWeight: FontWeight.w500);

  @override
  TextStyle get heading1Regular => const TextStyle(fontFamily: 'Inter', fontSize: 64, fontWeight: FontWeight.w400);

  @override
  TextStyle get heading1Semibold =>
      const TextStyle(fontFamily: 'Inter', height: 72 / 64, fontSize: 64, fontWeight: FontWeight.w600);

  @override
  TextStyle get heading2Bold =>
      const TextStyle(fontFamily: 'Inter', height: 56 / 48, fontSize: 48, fontWeight: FontWeight.w700);

  @override
  TextStyle get heading2Medium =>
      const TextStyle(fontFamily: 'Inter', height: 56 / 48, fontSize: 48, fontWeight: FontWeight.w500);

  @override
  TextStyle get heading2Regular =>
      const TextStyle(fontFamily: 'Inter', height: 56 / 48, fontSize: 48, fontWeight: FontWeight.w400);

  @override
  TextStyle get heading2Semibold =>
      const TextStyle(fontFamily: 'Inter', height: 56 / 48, fontSize: 48, fontWeight: FontWeight.w600);

  @override
  TextStyle get heading3Bold =>
      const TextStyle(fontFamily: 'Inter', height: 48 / 40, fontSize: 40, fontWeight: FontWeight.w700);

  @override
  TextStyle get heading3Medium =>
      const TextStyle(fontFamily: 'Inter', height: 48 / 40, fontSize: 40, fontWeight: FontWeight.w500);

  @override
  TextStyle get heading3Regular =>
      const TextStyle(fontFamily: 'Inter', height: 48 / 40, fontSize: 40, fontWeight: FontWeight.w400);

  @override
  TextStyle get heading3Semibold =>
      const TextStyle(fontFamily: 'Inter', height: 48 / 40, fontSize: 40, fontWeight: FontWeight.w600);

  @override
  TextStyle get heading4Bold =>
      const TextStyle(fontFamily: 'Inter', height: 40 / 32, fontSize: 32, fontWeight: FontWeight.w700);

  @override
  TextStyle get heading4Medium =>
      const TextStyle(fontFamily: 'Inter', height: 40 / 32, fontSize: 32, fontWeight: FontWeight.w500);

  @override
  TextStyle get heading4Regular =>
      const TextStyle(fontFamily: 'Inter', height: 40 / 32, fontSize: 32, fontWeight: FontWeight.w400);

  @override
  TextStyle get heading4Semibold =>
      const TextStyle(fontFamily: 'Inter', height: 40 / 32, fontSize: 32, fontWeight: FontWeight.w600);

  @override
  TextStyle get heading5Bold =>
      const TextStyle(fontFamily: 'Inter', height: 32 / 24, fontSize: 24, fontWeight: FontWeight.w700);

  @override
  TextStyle get heading5Medium =>
      const TextStyle(fontFamily: 'Inter', height: 32 / 24, fontSize: 24, fontWeight: FontWeight.w500);

  @override
  TextStyle get heading5Regular =>
      const TextStyle(fontFamily: 'Inter', fontSize: 24, fontWeight: FontWeight.w400, height: 32 / 24);

  @override
  TextStyle get heading5Semibold =>
      const TextStyle(fontFamily: 'Inter', height: 32 / 24, fontSize: 24, fontWeight: FontWeight.w600);

  @override
  TextStyle get heading6Bold =>
      const TextStyle(fontFamily: 'Inter', height: 26 / 18, fontSize: 18, fontWeight: FontWeight.w700);

  @override
  TextStyle get heading6Medium =>
      const TextStyle(fontFamily: 'Inter', height: 26 / 18, fontSize: 18, fontWeight: FontWeight.w500);

  @override
  TextStyle get heading6Regular =>
      const TextStyle(fontFamily: 'Inter', fontSize: 18, fontWeight: FontWeight.w400, height: 26 / 18);

  @override
  TextStyle get heading6Semibold =>
      const TextStyle(fontFamily: 'Inter', height: 26 / 18, fontSize: 18, fontWeight: FontWeight.w600);
}
