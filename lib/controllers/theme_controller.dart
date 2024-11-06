import 'package:cryptor/screen/app.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:cryptor/theme/theme.dart';

class CryThemeController extends GetxController {
  final _box = GetStorage();
  final _key = 'themeMode';

  var currentThemeMode = ThemeMode.system.obs;

  @override
  void onInit() {
    super.onInit();
    currentThemeMode.value = _loadThemeFromBox();
    // Отложить изменение темы после завершения фазы построения
    Future.delayed(Duration.zero, () {
      Get.changeThemeMode(currentThemeMode.value);
    });
  }

  ThemeMode _loadThemeFromBox() {
    final storedValue = _box.read(_key);
    if (storedValue == null) return ThemeMode.system;
    return ThemeMode.values[storedValue];
  }

  void _saveThemeToBox(ThemeMode themeMode) {
    _box.write(_key, themeMode.index);
  }

  void switchTheme(ThemeMode themeMode) {
    currentThemeMode.value = themeMode;
    Get.changeThemeMode(themeMode);
    _saveThemeToBox(themeMode);
  }
}