import 'package:flutter/material.dart';

import '../../utils/constants/colors.dart';
import '../../utils/constants/sizes.dart';


/* -- Light & Dark Text Button Themes -- */
class CryTextButtonTheme {
  CryTextButtonTheme._(); //To avoid creating instances


  /* -- Light Theme -- */
  static final lightTextButtonTheme  = TextButtonThemeData(
    style: TextButton.styleFrom(
      backgroundColor: CryColors.primary.withOpacity(0.6),
      textStyle: const TextStyle(fontSize: 12, color: CryColors.white, fontWeight: FontWeight.w600),
      padding: const EdgeInsets.symmetric(vertical: CrySizes.buttonHeight, horizontal: 20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(CrySizes.borderRadiusLg)),
    ),
  );

  /* -- Dark Theme -- */
  static final darkTextButtonTheme = TextButtonThemeData(
    style: TextButton.styleFrom(
      backgroundColor: CryColors.primary.withOpacity(0.6),
      textStyle: TextStyle(fontSize: 12, color: Colors.black, fontWeight: FontWeight.w600),
      padding: const EdgeInsets.symmetric(vertical: CrySizes.buttonHeight, horizontal: 20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(CrySizes.borderRadiusLg)),
    ),
  );
}
