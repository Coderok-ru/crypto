import 'package:flutter/material.dart';

import '../../utils/constants/colors.dart';
import '../../utils/constants/sizes.dart';


/* -- Light & Dark Outlined Button Themes -- */
class CryOutlinedButtonTheme {
  CryOutlinedButtonTheme._(); //To avoid creating instances


  /* -- Light Theme -- */
  static final lightOutlinedButtonTheme  = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      elevation: 0,
      foregroundColor: CryColors.dark,
      side: const BorderSide(color: CryColors.borderPrimary),
      textStyle: const TextStyle(fontSize: 12, color: CryColors.black, fontWeight: FontWeight.w600),
      padding: const EdgeInsets.symmetric(vertical: CrySizes.buttonHeight, horizontal: 20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(CrySizes.borderRadiusLg)),
    ),
  );

  /* -- Dark Theme -- */
  static final darkOutlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      foregroundColor: CryColors.primary,
      side: const BorderSide(color: CryColors.borderPrimary, width: 0),
      textStyle: const TextStyle(fontSize: 12, color: CryColors.primary, fontWeight: FontWeight.w300),
      padding: const EdgeInsets.symmetric(vertical: CrySizes.buttonHeight, horizontal: 20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(CrySizes.borderRadiusLg)),
    ),
  );
}
