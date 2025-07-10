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
  // TODO: implement errorBorderRed
  Color get errorBorderRed => const Color(0xFFFAC0C0);

  @override
  // TODO: implement errorFocusRed
  Color get errorFocusRed => const Color(0x33F14141);

  @override
  // TODO: implement errorHoverRed
  Color get errorHoverRed => const Color(0xFFD93A3A);

  @override
  // TODO: implement errorMainRed
  Color get errorMainRed => const Color(0xFFF14141);

  @override
  // TODO: implement errorPressedRed
  Color get errorPressedRed => const Color(0xFF802A2A);

  @override
  // TODO: implement errorSurfaceRed
  Color get errorSurfaceRed => const Color(0xFFFFF2F2);

  @override
  // TODO: implement infoBorderBlue
  Color get infoBorderBlue => const Color(0xFFD0BDF8);

  @override
  // TODO: implement infoFocusBlue
  Color get infoFocusBlue => const Color(0x337239EA);

  @override
  // TODO: implement infoHoverBlue
  Color get infoHoverBlue => const Color(0xFF6633D1);

  @override
  // TODO: implement infoMainBlue
  Color get infoMainBlue => const Color(0xFF7239EA);

  @override
  // TODO: implement infoPressedBlue
  Color get infoPressedBlue => const Color(0xFF3F2478);

  @override
  // TODO: implement infoSurfaceBlue
  Color get infoSurfaceBlue => const Color(0xFFF6F2FF);

  @override
  // TODO: implement neutral10
  Color get neutral10 => const Color(0xFFFFFFFF);

  @override
  // TODO: implement neutral100
  Color get neutral100 => const Color(0xFF101010);

  @override
  // TODO: implement neutral20
  Color get neutral20 => const Color(0xFFF5F5F5);

  @override
  // TODO: implement neutral30
  Color get neutral30 => const Color(0xFFEDEDED);

  @override
  // TODO: implement neutral40
  Color get neutral40 => const Color(0xFFD6D6D6);

  @override
  // TODO: implement neutral50
  Color get neutral50 => const Color(0xFFC2C2C2);

  @override
  // TODO: implement neutral60
  Color get neutral60 => const Color(0xFF878787);

  @override
  // TODO: implement neutral70
  Color get neutral70 => const Color(0xFF606060);

  @override
  // TODO: implement neutral80
  Color get neutral80 => const Color(0xFF383838);

  @override
  // TODO: implement neutral90
  Color get neutral90 => const Color(0xFF403A3A);

  @override
  // TODO: implement primaryBorderIris
  Color get primaryBorderIris => const Color(0xFFDFE0F3);

  @override
  // TODO: implement primaryFocusIris
  Color get primaryFocusIris => const Color(0x33DBDBF8);

  @override
  // TODO: implement primaryHoverIris
  Color get primaryHoverIris => const Color(0xFFFE8C00);

  @override
  // TODO: implement primaryMainIris
  Color get primaryMainIris => const Color(0xFF4C4DDC);

  @override
  // TODO: implement primaryPressedIris
  Color get primaryPressedIris => const Color(0xFF085885);

  @override
  // TODO: implement primarySurfaceIris
  Color get primarySurfaceIris => const Color(0xFFF5F5FF);

  @override
  // TODO: implement secondaryBorderYellow
  Color get secondaryBorderYellow => const Color(0xFFFFF0BE);

  @override
  // TODO: implement secondaryFocusYellow
  Color get secondaryFocusYellow => const Color(0xFFFFF6D8);

  @override
  // TODO: implement secondaryHoverYellow
  Color get secondaryHoverYellow => const Color(0xFFD5B032);

  @override
  // TODO: implement secondaryMainYellow
  Color get secondaryMainYellow => const Color(0xFFFFD33C);

  @override
  // TODO: implement secondaryPressedYellow
  Color get secondaryPressedYellow => const Color(0xFF806A1E);

  @override
  // TODO: implement secondarySurfaceYellow
  Color get secondarySurfaceYellow => const Color(0xFFFFF6D8);

  @override
  // TODO: implement successBorderGreen
  Color get successBorderGreen => const Color(0xFFC5EED8);

  @override
  // TODO: implement successFocusGreen
  Color get successFocusGreen => const Color(0x33DCF5E7);

  @override
  // TODO: implement successHoverGreen
  Color get successHoverGreen => const Color(0xFF46B277);

  @override
  // TODO: implement successMainGreen
  Color get successMainGreen => const Color(0xFF50CD89);

  @override
  // TODO: implement successPressedGreen
  Color get successPressedGreen => const Color(0xFF28593F);

  @override
  // TODO: implement successSurfaceGreen
  Color get successSurfaceGreen => const Color(0xFFF2FFF8);
}
