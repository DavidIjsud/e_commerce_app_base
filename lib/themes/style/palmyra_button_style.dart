import 'package:flutter/material.dart';

abstract class PalmyraButtonStyle {
  const PalmyraButtonStyle();

  ButtonStyle buttonStyle();
}

class PalmyraButtonStyleDefault extends PalmyraButtonStyle {
  const PalmyraButtonStyleDefault();

  @override
  ButtonStyle buttonStyle() {
    return ElevatedButton.styleFrom();
  }
}
