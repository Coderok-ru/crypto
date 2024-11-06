import 'dart:convert';

import 'package:get/get.dart';
import 'package:encrypt/encrypt.dart' as encrypt;
import 'package:crypto/crypto.dart';
import 'package:flutter/services.dart';


class TextEncryptionController extends GetxController {
  final inputText = ''.obs;
  final encryptedText = ''.obs;
  final keyText = ''.obs;

  void encryptText() {
    final keyBytes = sha256.convert(utf8.encode(keyText.value)).bytes;
    final key = encrypt.Key(Uint8List.fromList(keyBytes));
    final iv = encrypt.IV.fromLength(16); // Случайный IV
    final encrypter = encrypt.Encrypter(encrypt.AES(key));
    final encrypted = encrypter.encrypt(inputText.value, iv: iv);
    encryptedText.value = '${iv.base64}:${encrypted.base64}'; // Сохраняем IV вместе с текстом
  }

  void copyToClipboard() {
    Clipboard.setData(ClipboardData(text: encryptedText.value));
  }
}