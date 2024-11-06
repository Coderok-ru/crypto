import 'package:flutter/material.dart';

import '../../utils/constants/colors.dart';
import '../../utils/constants/sizes.dart';

class CryTextFormFieldTheme {
  CryTextFormFieldTheme._();

  static InputDecorationTheme lightInputDecorationTheme = InputDecorationTheme(
    errorMaxLines: 3,
    prefixIconColor: CryColors.darkGrey,
    suffixIconColor: CryColors.darkGrey,
    // constraints: const BoxConstraints.expand(height: TSizes.inputFieldHeight),
    labelStyle: const TextStyle().copyWith(fontSize: CrySizes.fontSizeMd, color: CryColors.black.withOpacity(0.7)),
    hintStyle: const TextStyle().copyWith(fontSize: CrySizes.fontSizeSm, color: CryColors.black.withOpacity(0.7)),
    errorStyle: const TextStyle().copyWith(fontStyle: FontStyle.normal),
    floatingLabelStyle: const TextStyle().copyWith(color: CryColors.black.withOpacity(0.8)),
    border: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(CrySizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: CryColors.primary),
    ),
    enabledBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(CrySizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: CryColors.grey),
    ),
    focusedBorder:const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(CrySizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: CryColors.dark),
    ),
    errorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(CrySizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: CryColors.warning),
    ),
    focusedErrorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(CrySizes.inputFieldRadius),
      borderSide: const BorderSide(width: 2, color: CryColors.warning),
    ),
  );

  static InputDecorationTheme darkInputDecorationTheme = InputDecorationTheme(
    errorMaxLines: 2,
    prefixIconColor: CryColors.darkGrey,
    suffixIconColor: CryColors.darkGrey,
    // constraints: const BoxConstraints.expand(height: TSizes.inputFieldHeight),
    labelStyle: const TextStyle().copyWith(fontSize: CrySizes.fontSizeSm, color: CryColors.white.withOpacity(0.7)),
    hintStyle: const TextStyle().copyWith(fontSize: CrySizes.fontSizeSm, color: CryColors.white.withOpacity(0.7)),
    floatingLabelStyle: const TextStyle().copyWith(color: CryColors.white.withOpacity(0.8)),
    border: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(CrySizes.inputFieldRadius),
      borderSide: BorderSide(width: 1, color: CryColors.primary),
    ),
    enabledBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(CrySizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: CryColors.darkGrey),
    ),
    focusedBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(CrySizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: CryColors.white),
    ),
    errorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(CrySizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: CryColors.warning),
    ),
    focusedErrorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(CrySizes.inputFieldRadius),
      borderSide: const BorderSide(width: 2, color: CryColors.warning),
    ),
  );
}
