import 'package:flutter/material.dart';

import '../../utils/constants/colors.dart';

class CrySliderTheme{
  CrySliderTheme._();

  static const lightSliderTheme = SliderThemeData(
    trackHeight: 0.0,
    overlayShape: RoundSliderOverlayShape(overlayRadius: 14.0),
    thumbShape: RoundSliderThumbShape(
        enabledThumbRadius: 14.0,
        elevation: 0.1,
        pressedElevation: 1.0
    ),
    showValueIndicator: ShowValueIndicator.never,
    activeTrackColor: Colors.transparent,
    inactiveTrackColor: Colors.transparent,
    activeTickMarkColor: Colors.transparent,
    inactiveTickMarkColor: Colors.transparent,
    thumbColor: CryColors.primary
  );

  static const darkSliderTheme = SliderThemeData(
      trackHeight: 0.0,
      overlayShape: RoundSliderOverlayShape(overlayRadius: 14.0),
      thumbShape: RoundSliderThumbShape(
          enabledThumbRadius: 14.0,
          elevation: 0.1,
          pressedElevation: 1.0
      ),
      showValueIndicator: ShowValueIndicator.never,
      activeTrackColor: Colors.transparent,
      inactiveTrackColor: Colors.transparent,
      activeTickMarkColor: Colors.transparent,
      inactiveTickMarkColor: Colors.transparent,
      thumbColor: CryColors.primary
  );
}