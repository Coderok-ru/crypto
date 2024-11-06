import 'package:flutter/material.dart';

import '../../utils/constants/sizes.dart';
class CrySpacingStyle  {
  static const EdgeInsetsGeometry paddingWithAppBarHeight = EdgeInsets.only(
    top: CrySizes.appBarHeight,
    left: CrySizes.defaultSpace,
    bottom: CrySizes.defaultSpace,
    right: CrySizes.defaultSpace,
  );
}