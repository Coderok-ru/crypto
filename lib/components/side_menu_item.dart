import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:auto_size_text/auto_size_text.dart';
import '../controllers/main_controller.dart';
import '../models/menu_item.dart';
import '../utils/constants/colors.dart';
import '../utils/helper_function.dart';

class SideMenuItem extends StatelessWidget {
  final MenuItem item;
  const SideMenuItem({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final NavigationController navController = Get.find<NavigationController>();
    final dark = CryHelperFunctions.isDarkMode(context);

    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: () {
            navController.setRoute(item.route);
          },
          child: Obx(() {
            final isSelected = navController.currentRoute.value == item.route;
            final Color bgColor = isSelected ? CryColors.primary : Colors.transparent;
            final Color iconColor = isSelected ? Colors.white : Colors.grey;
            final Color textColor = isSelected
                ? Colors.white
                : (dark ? Colors.white : Colors.black);

            return Container(
              padding: const EdgeInsets.only(left: 8.0),
              decoration: BoxDecoration(
                color: bgColor,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: ListTile(
                leading: Icon(
                  item.icon,
                  color: iconColor,
                ),
                title: AutoSizeText(
                  item.name,
                  maxLines: 1,
                  style: TextStyle(
                    color: textColor,
                  ),
                ),
                contentPadding: EdgeInsets.zero,
              ),
            );
          }),
        ),
      ),
    );
  }
}