import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingController extends GetxController {
  var selectedOption = 'THEME'.obs;

  void selectOption(String option) {
    selectedOption.value = option;
  }
}