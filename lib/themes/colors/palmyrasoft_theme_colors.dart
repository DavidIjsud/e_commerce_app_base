import 'dart:ui';

abstract class PalmyrasoftThemeColors {
  const PalmyrasoftThemeColors();

  // Primary Colors
  Color get primaryMainIris;
  Color get primarySurfaceIris;
  Color get primaryBorderIris;
  Color get primaryHoverIris;
  Color get primaryPressedIris;
  Color get primaryFocusIris;

  // Secondary Colors
  Color get secondaryMainYellow;
  Color get secondarySurfaceYellow;
  Color get secondaryBorderYellow;
  Color get secondaryHoverYellow;
  Color get secondaryPressedYellow;
  Color get secondaryFocusYellow;

  //Success Colors
  Color get successMainGreen;
  Color get successSurfaceGreen;
  Color get successBorderGreen;
  Color get successHoverGreen;
  Color get successPressedGreen;
  Color get successFocusGreen;

  //Error Colors
  Color get errorMainRed;
  Color get errorSurfaceRed;
  Color get errorBorderRed;
  Color get errorHoverRed;
  Color get errorPressedRed;
  Color get errorFocusRed;

  //Info Colors
  Color get infoMainBlue;
  Color get infoSurfaceBlue;
  Color get infoBorderBlue;
  Color get infoHoverBlue;
  Color get infoPressedBlue;
  Color get infoFocusBlue;

  //NEutral Colors
  Color get neutral10;
  Color get neutral20;
  Color get neutral30;
  Color get neutral40;
  Color get neutral50;
  Color get neutral60;
  Color get neutral70;
  Color get neutral80;
  Color get neutral90;
  Color get neutral100;
}

class PalmyrasoftThemeColorsDefault extends PalmyrasoftThemeColors {
  const PalmyrasoftThemeColorsDefault();

  @override
  Color get errorBorderRed => const Color(0xFFFAC0C0);

  @override
  Color get errorFocusRed => const Color(0x33F14141);

  @override
  Color get errorHoverRed => const Color(0xFFD93A3A);

  @override
  Color get errorMainRed => const Color(0xFFF14141);

  @override
  Color get errorPressedRed => const Color(0xFF802A2A);

  @override
  Color get errorSurfaceRed => const Color(0xFFFFF2F2);

  @override
  Color get infoBorderBlue => const Color(0xFFD0BDF8);

  @override
  Color get infoFocusBlue => const Color(0x337239EA);

  @override
  Color get infoHoverBlue => const Color(0xFF6633D1);

  @override
  Color get infoMainBlue => const Color(0xFF7239EA);

  @override
  Color get infoPressedBlue => const Color(0xFF3F2478);

  @override
  Color get infoSurfaceBlue => const Color(0xFFF6F2FF);

  @override
  Color get neutral10 => const Color(0xFFFFFFFF);

  @override
  Color get neutral100 => const Color(0xFF101010);

  @override
  Color get neutral20 => const Color(0xFFF5F5F5);

  @override
  Color get neutral30 => const Color(0xFFEDEDED);

  @override
  Color get neutral40 => const Color(0xFFD6D6D6);

  @override
  Color get neutral50 => const Color(0xFFC2C2C2);

  @override
  Color get neutral60 => const Color(0xFF878787);

  @override
  Color get neutral70 => const Color(0xFF606060);

  @override
  Color get neutral80 => const Color(0xFF383838);

  @override
  Color get neutral90 => const Color(0xFF403A3A);

  @override
  Color get primaryBorderIris => const Color(0xFFDFE0F3);

  @override
  Color get primaryFocusIris => const Color(0x33DBDBF8);

  @override
  Color get primaryHoverIris => const Color(0xFFFE8C00);

  @override
  Color get primaryMainIris => const Color(0xFF4C4DDC);

  @override
  Color get primaryPressedIris => const Color(0xFF085885);

  @override
  Color get primarySurfaceIris => const Color(0xFFF5F5FF);

  @override
  Color get secondaryBorderYellow => const Color(0xFFFFF0BE);

  @override
  Color get secondaryFocusYellow => const Color(0xFFFFF6D8);

  @override
  Color get secondaryHoverYellow => const Color(0xFFD5B032);

  @override
  Color get secondaryMainYellow => const Color(0xFFFFD33C);

  @override
  Color get secondaryPressedYellow => const Color(0xFF806A1E);

  @override
  Color get secondarySurfaceYellow => const Color(0xFFFFF6D8);

  @override
  Color get successBorderGreen => const Color(0xFFC5EED8);

  @override
  Color get successFocusGreen => const Color(0x33DCF5E7);

  @override
  Color get successHoverGreen => const Color(0xFF46B277);

  @override
  Color get successMainGreen => const Color(0xFF50CD89);

  @override
  Color get successPressedGreen => const Color(0xFF28593F);

  @override
  Color get successSurfaceGreen => const Color(0xFFF2FFF8);
}
