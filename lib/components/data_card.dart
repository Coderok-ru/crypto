import 'package:cryptor/utils/constants/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/crypto_controller.dart';
import '../utils/helper_function.dart';

class DataCard extends StatelessWidget {
  DataCard({Key? key}) : super(key: key);
  final CsvHasherController csvController = Get.put(CsvHasherController());

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
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Зашифровать все данные'),
                  Obx(() => Row(
                    children: [
                      Transform.scale(
                        scale: 0.6,
                        child: CupertinoSwitch(
                          activeColor: CryColors.primary,
                          value: csvController.headers.every((header) =>
                              csvController.selectedColumns.contains(header)),
                          onChanged: (bool? value) {
                            if (value == true) {
                              csvController.selectedColumns
                                  .assignAll(csvController.headers);
                              csvController.includedColumns
                                  .assignAll(csvController.headers);
                            } else {
                              csvController.selectedColumns.clear();
                            }
                          },
                        ),
                      ),
                      const Tooltip(
                          message: 'Шифрует все данные в каждой колонке.',
                          child: Opacity(
                            opacity: 0.5, // Уровень прозрачности от 0.0 до 1.0
                            child: Icon(CupertinoIcons.question_circle,
                                size: 16),
                          )),
                    ],
                  ),)
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Экспортировать все колонки'),
                  Obx(() => Row(
                    children: [
                      Transform.scale(
                        scale: 0.6,
                        child: CupertinoSwitch(
                          activeColor: CryColors.primary,
                          value: csvController.headers.every((header) =>
                              csvController.includedColumns.contains(header)),
                          onChanged: (bool? value) {
                            if (value == true) {
                              csvController.includedColumns
                                  .assignAll(csvController.headers);
                            } else {
                              csvController.includedColumns.clear();
                              csvController.selectedColumns.clear();
                            }
                          },
                        ),
                      ),
                      const Tooltip(
                          message:
                          'Импортирует из исходного файла все колонки и вставляет в итоговый файл.',
                          child: Opacity(
                            opacity: 0.5, // Уровень прозрачности от 0.0 до 1.0
                            child: Icon(CupertinoIcons.question_circle,
                                size: 16),
                          )),
                    ],
                  ),)
                ],
              ),
              const SizedBox(height: 16.0),
              Align(
                alignment: Alignment.topLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Заголовок',
                        ),
                        Row(
                          children: [
                            const Tooltip(
                              message:
                              'Отметьте колонки которые необходимо зашифровать.',
                              child: Icon(CupertinoIcons.pencil_outline,
                                  size: 16),),
                            SizedBox(width: 16,),
                            const Tooltip(
                                message:
                                'Отметьте колонки которые будут экспортированы в итоговый файл.',
                                child: Icon(CupertinoIcons.share,
                                    size: 16),),
                            SizedBox(width: 8,)
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Obx(() => ListView(
                      shrinkWrap: true,
                      children: csvController.headers.map((header) {
                        return Opacity(
                          opacity: 0.7,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                header,
                                softWrap: true,
                                overflow: TextOverflow.visible,
                              ),
                              Row(
                                children: [
                                  Checkbox(
                                    value: csvController.selectedColumns
                                        .contains(header),
                                    onChanged: (bool? value) {
                                      if (value == true) {
                                        csvController.selectedColumns.add(header);
                                        csvController.includedColumns.add(header);
                                      } else {
                                        csvController.selectedColumns
                                            .remove(header);
                                      }
                                    },
                                  ),
                                  Checkbox(
                                    value: csvController.includedColumns
                                        .contains(header),
                                    onChanged: (bool? value) {
                                      if (value == true) {
                                        csvController.includedColumns.add(header);
                                      } else {
                                        csvController.includedColumns
                                            .remove(header);
                                        csvController.selectedColumns
                                            .remove(header);
                                      }
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      }).toList(),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
