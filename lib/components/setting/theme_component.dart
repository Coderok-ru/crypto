import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/theme_controller.dart';

class ThemeComponent extends StatelessWidget {
  const ThemeComponent({super.key});

  @override
  Widget build(BuildContext context) {
    final CryThemeController controller = Get.put(CryThemeController());
    return Column(
      children: [
        Obx(() => RadioListTile<ThemeMode>(
          title: const Text('Системная тема'),
          value: ThemeMode.system,
          groupValue: controller.currentThemeMode.value,
          onChanged: (ThemeMode? value) {
            if (value != null) {
              controller.switchTheme(value);
            }
          },
        )),
        Obx(() => RadioListTile<ThemeMode>(
          title: const Text('Светлая тема'),
          value: ThemeMode.light,
          groupValue: controller.currentThemeMode.value,
          onChanged: (ThemeMode? value) {
            if (value != null) {
              controller.switchTheme(value);
            }
          },
        )),
        Obx(() => RadioListTile<ThemeMode>(
          title: const Text('Темная тема'),
          value: ThemeMode.dark,
          groupValue: controller.currentThemeMode.value,
          onChanged: (ThemeMode? value) {
            if (value != null) {
              controller.switchTheme(value);
            }
          },
        )),
      ],
    );
  }
}
