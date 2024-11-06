import 'package:cryptor/controllers/footer_controller.dart';
import 'package:cryptor/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/time_controller.dart';
import '../utils/helper_function.dart';

class FooterQuote extends StatelessWidget {
  const FooterQuote({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TimeController timeController = Get.put(TimeController());
    final dark = CryHelperFunctions.isDarkMode(context);
    final FooterController controller = Get.put(FooterController());
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.0),
          image: DecorationImage(
            image: AssetImage(
              dark ? 'assets/footerD.jpg' : 'assets/footerL.jpg',
            ),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.96),
              BlendMode.dstATop,
            ),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Obx(() => Text(
                          timeController.currentTime.value,
                        )),
                    Obx(() => Text(
                          timeController.currentDate.value,
                        )),
                  ],
                ),
              ),
              VerticalDivider(
                  color: dark ? Colors.white : CryColors.darkerGrey),
              Expanded(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.all(1.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Opacity(opacity: 0.6,
                          child: Text('* Место для вашей рекламы', style: TextTheme().labelSmall)),
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
