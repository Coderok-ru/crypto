
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../utils/constants/colors.dart';
import '../../utils/constants/sizes.dart';

class CryAppBarTheme{
  CryAppBarTheme._();

  static const lightAppBarTheme = AppBarTheme(
    elevation: 0,
    centerTitle: true,
    scrolledUnderElevation: 0,
    backgroundColor: Colors.white,
    surfaceTintColor: Colors.transparent,
    iconTheme: IconThemeData(color: CryColors.black, size: CrySizes.iconMd),
    actionsIconTheme: IconThemeData(color: CryColors.black, size: CrySizes.iconMd),
    titleTextStyle: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600, color: CryColors.black),
  );
  static const darkAppBarTheme = AppBarTheme(
    elevation: 0,
    centerTitle: false,
    scrolledUnderElevation: 0,
    backgroundColor: Colors.transparent,
    surfaceTintColor: Colors.transparent,
    iconTheme: IconThemeData(color: CryColors.black, size: CrySizes.iconMd),
    actionsIconTheme: IconThemeData(color: CryColors.white, size: CrySizes.iconMd),
    titleTextStyle: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600, color: CryColors.white),
  );
}