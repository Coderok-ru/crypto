import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/text_decryption_controller.dart';
import '../../utils/constants/colors.dart';
import '../../utils/helper_function.dart';

class DeDataTextCrypto extends StatelessWidget {
  final TextDecryptionController controller = Get.find();

  DeDataTextCrypto({super.key});

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
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Flexible(
                child: Obx(() {
                  return Column(
                    children: [
                      SizedBox(height: 6),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Opacity(
                            opacity: 0.5,
                            child: IconButton(
                              onPressed: controller.copyToClipboard,
                              icon: Icon(CupertinoIcons.doc_on_doc),
                            ),
                          ),
                          Opacity(
                            opacity: 0.5,
                            child: IconButton(
                              onPressed: () {
                                controller.decryptedText.value = '';
                              },
                              icon: Icon(CupertinoIcons.trash),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 18),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.55,
                        child: TextField(
                            controller: TextEditingController(text: controller.decryptedText.value),
                            decoration: InputDecoration(labelText: 'Результат'),
                            readOnly: true,
                            maxLines: null,
                            keyboardType: TextInputType.multiline,
                            scrollController: ScrollController()
                        ),
                      ),
                    ],
                  );
                }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
