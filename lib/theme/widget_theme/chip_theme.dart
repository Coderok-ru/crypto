import 'package:flutter/material.dart';

import '../../utils/constants/colors.dart';

class CryChipTheme {
  CryChipTheme._();

  static ChipThemeData lightChipTheme = ChipThemeData(
      disabledColor: CryColors.grey.withOpacity(0.10),
      backgroundColor: CryColors.primary.withOpacity(0.5),
      labelStyle: TextStyle(color: CryColors.black.withOpacity(0.8)),
      selectedColor: CryColors.primary,
      padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
      checkmarkColor: CryColors.white,
      showCheckmark: false,
      side: BorderSide.none);

  static ChipThemeData darkChipTheme = ChipThemeData(
      disabledColor: CryColors.grey.withOpacity(0.10),
      backgroundColor: CryColors.primary.withOpacity(0.5),
      labelStyle: TextStyle(color: CryColors.white),
      selectedColor: CryColors.primary,
      padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
      checkmarkColor: CryColors.white,
      showCheckmark: false,
      side: BorderSide.none);
}
