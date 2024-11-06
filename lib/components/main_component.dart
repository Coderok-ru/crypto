import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/algorithm_controller.dart';
import '../controllers/crypto_controller.dart';
import '../enums/encryption_enums.dart';
import '../utils/constants/colors.dart';
import '../utils/helper_function.dart';

class MainComponent extends StatelessWidget {
  MainComponent({super.key});
  final CsvHasherController csvController = Get.put(CsvHasherController());
  final AlgorithmController controller = Get.put(AlgorithmController());
  final encryptionAlgorithm = EncryptionAlgorithm.MD5.obs;
  final keyController = TextEditingController();

  String shortenFileName(String fileName, {int maxLength = 30}) {
    if (fileName.length <= maxLength) return fileName;
    int keepLength = maxLength ~/ 2 - 2;
    return '${fileName.substring(0, keepLength)}...${fileName.substring(fileName.length - keepLength)}';
  }

  bool isKeyRequired(EncryptionAlgorithm algorithm) {
    switch (algorithm) {
      case EncryptionAlgorithm.AES:
        return true;
      default:
        return false;
    }
  }

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
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Obx(() {
                    return Expanded(
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: EncryptionAlgorithm.values.map((algorithm) {
                          return Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 4.0),
                            child: ChoiceChip(
                              label: Text(algorithm.toString().split('.').last),
                              selected: controller.selectedAlgorithm.value == algorithm,
                              onSelected: (bool selected) {
                                if (selected) {
                                  controller.selectedAlgorithm.value = algorithm;
                                }
                              },
                            ),
                          );
                        }).toList(),
                      ),
                    );
                  }),
                ],
              ),
              const SizedBox(height: 24),
              Row(
                children: [
                  Expanded(
                    flex: 12,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: CryColors.primary.withOpacity(.10),
                            borderRadius: BorderRadius.circular(
                              10,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Выбирите .csv файл',
                                      style: TextStyle(
                                        color: CryColors.primary,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 10),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        TextButton(
                                          onPressed: csvController.pickFile,
                                          child: const Text(
                                            'ОТКРЫТЬ',
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        ),
                                        const SizedBox(width: 8.0),
                                        Row(
                                          children: [
                                            Obx(() => Text(
                                                  csvController.fileName.value
                                                          .isEmpty
                                                      ? 'Файл не выбран'
                                                      : '${shortenFileName(csvController.fileName.value)}',
                                                  style: const TextStyle(
                                                      fontSize: 12),
                                                )),
                                          ],
                                        ),
                                      ],
                                    ),
                                    Obx(() {
                                      return csvController.fileName.value.isNotEmpty
                                          ? IconButton(
                                              onPressed:
                                                  csvController.clearData,
                                              icon: Icon(CupertinoIcons.delete,
                                                  size: 16, color: Colors.red.withOpacity(0.4),),
                                            )
                                          : SizedBox();
                                    })
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Obx(() {
                          return isKeyRequired(controller.selectedAlgorithm.value)
                              ? Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextField(
                              controller: keyController,
                              decoration: InputDecoration(
                                labelText: 'Введите ключ',
                                suffixIcon: const Tooltip(
                                    message: 'По ключевому слову шифруются все данные и так же по нему можно расшифровать эти данные. Ключ шифрования не хранится в системе, поэтому вам следует его записать и передать лично тому, кто будет расшифровывать.',
                                    child: Opacity(
                                      opacity: 0.5,
                                      child: Icon(
                                          CupertinoIcons.question_circle,
                                          size: 20),
                                    )),
                              ),
                            ),
                          ) : Container();
                        }),
                        SizedBox(
                          height: 16,
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: TextButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                CryColors.primary.withOpacity(0.1),
                              ),
                              padding: MaterialStateProperty.all(
                                const EdgeInsets.symmetric(
                                  vertical: 18.0,
                                ),
                              ),
                            ),
                            onPressed: () {
                              final selectedAlgorithm = encryptionAlgorithm.value;
                              final key = keyController.text.trim();
                              if (csvController.fileName.value.isEmpty) {
                                Get.snackbar('Ошибка', 'Пожалуйста, загрузите csv файл.');
                                return;
                              }
                              if (isKeyRequired(selectedAlgorithm) && key.isEmpty) {
                                Get.snackbar('Ошибка', 'Пожалуйста, введите ключ для выбранного шифрования.');
                                return;
                              }
                              csvController.encryptCsvData(selectedAlgorithm, key);
                            },
                            child: const Text(
                              'ЗАШИФРОВАТЬ',
                              style: TextStyle(
                                color: CryColors.primary,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 16.0),
                        Obx(() {
                          return csvController.visibleSaveButton.value ?
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: TextButton(
                                  onPressed: csvController.saveFile,
                                  child: const Text(
                                    'СОХРАНИТЬ',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 16.0),
                              Expanded(
                                child: TextButton(
                                  onPressed: csvController.shareFile,
                                  child: const Text(
                                    'ПОДЕЛИТСЯ',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            ],
                          ) : SizedBox();
                        })

                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
