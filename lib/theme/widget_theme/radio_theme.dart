
import 'package:cryptor/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class CryRadioTheme {
  CryRadioTheme._();

  static RadioThemeData lightRadioTheme = RadioThemeData(
    fillColor: WidgetStateProperty.resolveWith<Color>((states) {
      if (states.contains(WidgetState.selected)) {
        return CryColors.primary; // Цвет для выбранного состояния
      }
      return Colors.grey; // Цвет для невыбранного состояния
    }),
  );

  static RadioThemeData darkRadioTheme = RadioThemeData(
    fillColor: WidgetStateProperty.resolveWith<Color>((states) {
      if (states.contains(WidgetState.selected)) {
        return CryColors.primary; // Цвет для выбранного состояния
      }
      return Colors.grey; // Цвет для невыбранного состояния
    }),
  );
}