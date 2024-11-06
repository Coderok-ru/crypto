import 'package:cryptor/theme/widget_theme/radio_theme.dart';
import 'package:cryptor/theme/widget_theme/text_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cryptor/theme/widget_theme/appbar_theme.dart';
import 'package:cryptor/theme/widget_theme/bottom_app_bar_theme.dart';
import 'package:cryptor/theme/widget_theme/bottom_navigation_%20theme.dart';
import 'package:cryptor/theme/widget_theme/bottom_sheet_theme.dart';
import 'package:cryptor/theme/widget_theme/checkbox_theme.dart';
import 'package:cryptor/theme/widget_theme/chip_theme.dart';
import 'package:cryptor/theme/widget_theme/elevated_button_theme.dart';
import 'package:cryptor/theme/widget_theme/outlined_button_theme.dart';
import 'package:cryptor/theme/widget_theme/slider_theme.dart';
import 'package:cryptor/theme/widget_theme/text_field_theme.dart';
import 'package:cryptor/theme/widget_theme/text_theme.dart';

import '../utils/constants/colors.dart';

class CryAppTheme {
  CryAppTheme._();

  static ThemeData get lightTheme {

    return ThemeData(
      useMaterial3: true,
      fontFamily: 'Roboto',
      disabledColor: CryColors.grey,
      canvasColor: CryColors.lightBottomAppBar.withOpacity(1.0),
      brightness: Brightness.light,
      primaryColor: CryColors.primary,
      textTheme: CryTextTheme.lightTextTheme,
      chipTheme: CryChipTheme.lightChipTheme,
      scaffoldBackgroundColor: CryColors.light,
      appBarTheme: CryAppBarTheme.lightAppBarTheme,
      checkboxTheme: CryCheckboxTheme.lightCheckboxTheme,
      bottomSheetTheme: CryBottomSheetTheme.lightBottomSheetTheme,
      elevatedButtonTheme: CryElevatedButtonTheme.lightElevatedButtonTheme,
      outlinedButtonTheme: CryOutlinedButtonTheme.lightOutlinedButtonTheme,
      textButtonTheme: CryTextButtonTheme.lightTextButtonTheme,
      inputDecorationTheme: CryTextFormFieldTheme.lightInputDecorationTheme,
      bottomAppBarTheme: CryBottomAppBar.lightBottomAppTheme,
      bottomNavigationBarTheme: CryBottomNavigationBar.lightBottomNavigationTheme,
      sliderTheme: CrySliderTheme.lightSliderTheme,
      radioTheme: CryRadioTheme.lightRadioTheme,
    );
  }

  static ThemeData get darkTheme {

    return ThemeData(
      useMaterial3: true,
      fontFamily: 'Roboto',
      disabledColor: CryColors.grey,
      brightness: Brightness.dark,
      primaryColor: CryColors.primary,
      textTheme: CryTextTheme.darkTextTheme,
      chipTheme: CryChipTheme.darkChipTheme,
      scaffoldBackgroundColor: CryColors.tetriaryDark,
      appBarTheme: CryAppBarTheme.darkAppBarTheme,
      checkboxTheme: CryCheckboxTheme.darkCheckboxTheme,
      bottomSheetTheme: CryBottomSheetTheme.darkBottomSheetTheme,
      elevatedButtonTheme: CryElevatedButtonTheme.darkElevatedButtonTheme,
      outlinedButtonTheme: CryOutlinedButtonTheme.darkOutlinedButtonTheme,
      textButtonTheme: CryTextButtonTheme.darkTextButtonTheme,
      inputDecorationTheme: CryTextFormFieldTheme.darkInputDecorationTheme,
      sliderTheme: CrySliderTheme.darkSliderTheme,
      radioTheme: CryRadioTheme.darkRadioTheme
    );
  }
}