import 'package:cryptor/components/setting/about_component.dart';
import 'package:cryptor/components/setting/instruction_component.dart';
import 'package:cryptor/components/setting/license_component.dart';
import 'package:cryptor/components/setting/theme_component.dart';
import 'package:cryptor/utils/constants/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/crypto_controller.dart';
import '../controllers/setting_controller.dart';
import '../utils/helper_function.dart';

class SettingDataCard extends StatelessWidget {
  SettingDataCard({Key? key}) : super(key: key);
  final SettingController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    final dark = CryHelperFunctions.isDarkMode(context);
    return Expanded(
      flex: 3,
      child: Container(
        decoration: BoxDecoration(
          color: dark ? CryColors.dark : CryColors.white,
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Obx(() {
            switch (controller.selectedOption.value) {
              case 'THEME':
                return ThemeComponent();
              case 'LICENSE':
                return LicenseComponent();
              case 'INSTRUCTION':
                return InstructionComponent();
              case 'ABOUT':
                return AboutComponent();
              default:
                return Container();
            }
          }),
        ),
      ),
    );
  }
}
