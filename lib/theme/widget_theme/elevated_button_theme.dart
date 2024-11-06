import 'package:flutter/material.dart';

import '../../utils/constants/colors.dart';
import '../../utils/constants/sizes.dart';

/* -- Light & Dark Elevated Button Themes -- */
class CryElevatedButtonTheme {
  CryElevatedButtonTheme._(); //To avoid creating instances


  /* -- Light Theme -- */
  static final lightElevatedButtonTheme  = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: CryColors.light,
      backgroundColor: CryColors.primary,
      disabledForegroundColor: CryColors.darkGrey,
      disabledBackgroundColor: CryColors.buttonDisabled,
      side: const BorderSide(color: CryColors.primary),
      padding: const EdgeInsets.symmetric(vertical: CrySizes.buttonHeight, horizontal: CrySizes.buttonWidth),
      textStyle: const TextStyle(fontSize: 16, color: CryColors.textWhite, fontWeight: FontWeight.w600),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(CrySizes.buttonRadius)),
    ),
  );

  /* -- Dark Theme -- */
  static final darkElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: CryColors.light,
      backgroundColor: CryColors.primary,
      disabledForegroundColor: CryColors.darkGrey,
      disabledBackgroundColor: CryColors.darkerGrey,
      side: const BorderSide(color: CryColors.primary),
      padding: const EdgeInsets.symmetric(vertical: CrySizes.buttonHeight, horizontal: CrySizes.buttonWidth),
      textStyle: const TextStyle(fontSize: 16, color: CryColors.textWhite, fontWeight: FontWeight.w600),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(CrySizes.buttonRadius)),
    ),
  );
}
