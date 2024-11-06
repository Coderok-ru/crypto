import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:encrypt/encrypt.dart' as encrypt;

class TextDecryptionController extends GetxController {
  final encryptedText = ''.obs;
  final decryptedText = ''.obs;
  final keyText = ''.obs;

  void decryptText() {
    try {
      final keyBytes = sha256.convert(utf8.encode(keyText.value)).bytes;
      final key = encrypt.Key(Uint8List.fromList(keyBytes));
      final parts = encryptedText.value.split(':');

      if (parts.length != 2) {
        decryptedText.value = 'Скомпрометированное значение';
        return;
      }

      final iv = encrypt.IV.fromBase64(parts[0]);
      final encryptedData = parts[1];
      final encrypter = encrypt.Encrypter(encrypt.AES(key));
      final decrypted = encrypter.decrypt64(encryptedData, iv: iv);
      decryptedText.value = decrypted;
    } catch (e) {
      decryptedText.value = 'Ошибка расшифровки: $e';
    }
  }

  void copyToClipboard() {
    Clipboard.setData(ClipboardData(text: encryptedText.value));
  }
}