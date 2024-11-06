import 'package:cryptor/components/main_component.dart';
import 'package:cryptor/components/text_crypto/data_text_crypto.dart';
import 'package:cryptor/components/text_crypto/text_main_component.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../components/footer_quote.dart';
import '../components/setting_data_card.dart';
import '../components/setting_main_component.dart';
import '../components/side_menu.dart';
import '../components/data_card.dart';
import '../components/text_decrypto/dedata_text_crypto.dart';
import '../components/text_decrypto/detext_main_component.dart';
import '../controllers/algorithm_controller.dart';
import '../controllers/crypto_controller.dart';
import '../controllers/main_controller.dart';
import '../router/app_routes.dart';
import 'encryption_description.dart';

class DashboardPage extends StatelessWidget {
  DashboardPage({super.key});
  final CsvHasherController csvController = Get.put(CsvHasherController());
  final AlgorithmController encryptionController = Get.put(AlgorithmController());
  final NavigationController navController = Get.put(NavigationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              const SideMenu(),
              const SizedBox(width: 16.0),
              Expanded(
                flex: 6,
                child: Column(
                  children: [
                    Expanded(
                      flex: 4,
                      child: Obx(() {
                        switch (navController.currentRoute.value) {
                          case Routes.MAIN:
                            return Row(
                              children: [
                                MainComponent(),
                                SizedBox(width: 16.0),
                                Obx(() {
                                  if (csvController.fileName.value.isEmpty) {
                                    return Expanded(
                                      flex: 2,
                                      child: EncryptionDescription(
                                        algorithm: encryptionController.selectedAlgorithm.value,
                                      ),
                                    );
                                  } else {
                                    return DataCard();
                                  }
                                }),
                              ],
                            );
                          case Routes.TEXT:
                            return Row(
                              children: [
                                TextMainComponent(),
                                SizedBox(width: 16.0),
                                DataTextCrypto()
                              ],
                            );
                          case Routes.DETEXT:
                            return Row(
                              children: [
                                DeTextMainComponent(),
                                SizedBox(width: 16.0),
                                DeDataTextCrypto()
                              ],
                            );
                          case Routes.SETTINGS:
                            return Row(
                              children: [
                                SettingMainComponent(),
                                SizedBox(width: 16.0),
                                SettingDataCard(),
                              ],
                            );

                          default:
                            return Container();
                        }
                      }),
                    ),
                    const SizedBox(height: 16.0),
                    const FooterQuote()
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
