import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';
import '../../controllers/text_decryption_controller.dart';
import '../../utils/constants/colors.dart';
import '../../utils/helper_function.dart';

class DeTextMainComponent extends StatelessWidget {
  DeTextMainComponent({super.key});
  final TextDecryptionController controller = Get.put(TextDecryptionController());

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
                      children: [
                        TextField(
                          onChanged: (value) => controller.keyText.value = value,
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
                        SizedBox(height: 16),
                        TextField(
                            onChanged: (value) => controller.encryptedText.value = value,
                            decoration: InputDecoration(labelText: 'Введите зашифрованный текст'),
                            maxLines: 5,
                            keyboardType: TextInputType.multiline,
                            scrollController: ScrollController()
                        ),
                        SizedBox(height: 16),
                        SizedBox(
                          width: double.infinity,
                          child: TextButton(
                            style: ButtonStyle(
                              backgroundColor: WidgetStateProperty.all(
                                CryColors.primary.withOpacity(0.1),
                              ),
                              padding: WidgetStateProperty.all(
                                const EdgeInsets.symmetric(
                                  vertical: 18.0,
                                ),
                              ),
                            ),
                            onPressed: () {
                              if (controller.encryptedText.value.isEmpty) {
                                Get.snackbar('Ошибка', 'Пожалуйста, введите текст.');
                                return;
                              }
                              if (controller.keyText.value.isEmpty) {
                                Get.snackbar('Ошибка', 'Пожалуйста, введите ключ для AES шифрования.');
                                return;
                              }
                              controller.decryptText();
                            },
                            child: const Text(
                              'РАСШИФРОВАТЬ',
                              style: TextStyle(
                                color: CryColors.primary,
                              ),
                            ),
                          ),
                        ),
                      ],
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