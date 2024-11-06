
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/setting_controller.dart';
import '../utils/constants/colors.dart';
import '../utils/helper_function.dart';

class SettingMainComponent extends StatelessWidget {
  SettingMainComponent({super.key});
  final SettingController controller = Get.put(SettingController());

  final List<Map<String, String>> options = [
    {'title': 'Темная тема', 'value': 'THEME'},
    {'title': 'Инструкция', 'value': 'INSTRUCTION'},
    {'title': 'О приложении', 'value': 'ABOUT'},
    {'title': 'Лицензия', 'value': 'LICENSE'},
  ];


  @override
  Widget build(BuildContext context) {
    final dark = CryHelperFunctions.isDarkMode(context);
    return Expanded(
      flex: 2,
      child: Container(
        decoration: BoxDecoration(
          color: dark ? CryColors.dark : CryColors.white,
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    flex: 12,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: options.map((option) {
                        return Obx(() {
                          final isSelected = option['value'] == controller.selectedOption.value;
                          return Container(
                            margin: const EdgeInsets.only(bottom: 8.0),
                            decoration: BoxDecoration(
                              color: isSelected ? CryColors.primary : CryColors.primary.withOpacity(.20),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: ListTile(
                              title: Text(option['title']!, style: TextStyle(color: isSelected ? Colors.white : Colors.grey),),
                              onTap: () => controller.selectOption(option['value']!),
                            ),
                          );
                        });
                      }).toList(),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
