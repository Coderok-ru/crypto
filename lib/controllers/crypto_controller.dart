import 'package:get/get.dart';
import 'package:file_picker/file_picker.dart';
import 'package:encrypt/encrypt.dart' as encrypt;
import 'package:crypto/crypto.dart';
import 'package:intl/intl.dart';
import 'dart:convert';
import 'package:path_provider/path_provider.dart';
import 'package:csv/csv.dart';
import 'package:share_plus/share_plus.dart';
import 'dart:io';

import '../enums/encryption_enums.dart';

class CsvHasherController extends GetxController {
  var csvData = <List<String>>[].obs;
  var headers = <String>[].obs;
  var selectedColumns = <String>[].obs;
  var fileName = ''.obs;
  var includedColumns = <String>[].obs;
  // interface
  RxBool visibleSaveButton = false.obs;
  RxBool visibleMainButton = false.obs;

  Future<void> pickFile() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['csv'],
      );
      if (result != null && result.files.isNotEmpty) {
        final filePath = result.files.single.path;
        fileName.value = result.files.single.name;
        if (filePath != null) {
          final file = File(filePath);
          final content = await file.readAsString();
          if (content.isNotEmpty) {
            visibleMainButton.value = true;
            String cleanContent = content.replaceAll('"', '');
            String preprocessContent(String content) {
              final regex = RegExp(r'\"(.*?)\"', dotAll: true);
              return content.replaceAllMapped(regex, (match) {
                final replaced = match.group(0)!.replaceAll('\n', ' ').replaceAll('\r', ' ');
                return replaced;
              });
            }
            String processedContent = preprocessContent(content);
            List<List<dynamic>> rows = const CsvToListConverter(eol: '\n', fieldDelimiter: ';', textDelimiter: '"').convert(processedContent);
            if (rows.isNotEmpty) {
              headers.value = rows.first.map((e) => e.toString()).toList();
              csvData.value = rows.skip(1).map((row) => row.map((value) => value.toString()).toList()).toList();
            }
          }
        }
      }
    } catch (e) {
      Get.snackbar("Oшибка","Ошибка при выборе файла: $e");
    }
  }

  String encryptData(String input, EncryptionAlgorithm algorithm, String key) {
    switch (algorithm) {
      case EncryptionAlgorithm.MD5:
        return md5.convert(utf8.encode(input)).toString();
      case EncryptionAlgorithm.SHA256:
        return sha256.convert(utf8.encode(input)).toString();
      case EncryptionAlgorithm.AES:
        final aesKey = encrypt.Key.fromUtf8(key.padRight(32, ' '));
        final iv = encrypt.IV.fromLength(16);
        final encrypter = encrypt.Encrypter(encrypt.AES(aesKey));
        final encrypted = encrypter.encrypt(input, iv: iv);
        return encrypted.base64;
      default:
        return input;
    }
  }

  Future<void> encryptCsvData(EncryptionAlgorithm algorithm, String key) async {
    try {
      csvData.value = csvData.map((row) {
        return headers.asMap().entries.map((entry) {
          int index = entry.key;
          String header = entry.value;
          if (index < row.length) {
            String value = row[index];
            if (selectedColumns.contains(header)) {
              return encryptData(value, algorithm, key);
            } else {
              return value;
            }
          } else {
            return '';
          }
        }).toList();
      }).toList();
      visibleSaveButton.value = true;
      Get.snackbar('Успех', 'Выбранные данные зашифрованы.');
    } catch (e) {
      Get.snackbar('Ошибка', "Ошибка при шифровании данных: $e");
      print("Ошибка при шифровании данных: $e");
    }
  }
  String generateFileName(String originalFileName) {
    final now = DateTime.now();
    final formatter = DateFormat('yyyyMMdd_HHmmss');
    final formattedDate = formatter.format(now);
    return 'crypto_${formattedDate}_$originalFileName';
  }
  Future<void> saveFile() async {
    final now = DateTime.now();
    final formatter = DateFormat('yyyyMMdd_HHmmss');
    final formattedDate = formatter.format(now);
    String filename = 'crypto_${formattedDate}_$fileName';
    try {
      String? selectedDirectory = await FilePicker.platform.getDirectoryPath();
      if (selectedDirectory != null) {
        String filePath = '$selectedDirectory/$filename';
        await _saveToFile(csvData, filePath);
        Get.snackbar('Успешно', 'Данные успешно сохранены в $filePath');
      }
    } catch (e) {
      print("Ошибка при сохранении данных: $e");
      Get.snackbar('Ошибка', 'Ошибка при сохранении данных: $e');
    }
  }

  Future<void> shareFile() async {
    String filename = 'crypto_$fileName';
    try {
      final tempDir = await getTemporaryDirectory();
      final filePath = '${tempDir.path}/$filename';
      await _saveToFile(csvData, filePath);
      XFile xFile = XFile(filePath);
      Share.shareXFiles([xFile], text: 'Crypto data');
    } catch (e) {
      print("Ошибка при передаче данных: $e");
      Get.snackbar('Ошибка', 'Ошибка при передаче данных: $e');
    }
  }

  Future<void> _saveToFile(List<List<String>> data, String filePath) async {
    try {
      List<List<String>> filteredData = [];
      List<String> filteredHeaders = headers.where((header) => includedColumns.contains(header)).toList();
      filteredData.add(filteredHeaders);

      for (var row in data) {
        List<String> newRow = [];
        for (var header in filteredHeaders) {
          int index = headers.indexOf(header);
          if (index < row.length) {
            newRow.add(row[index]);
          }
        }
        if (newRow.isNotEmpty && newRow.any((element) => element.isNotEmpty)) {
          filteredData.add(newRow);
        }
      }

      String csv = const ListToCsvConverter(
        textDelimiter: '',
        fieldDelimiter: ';',
        eol: '\n',
      ).convert(filteredData);

      final file = File(filePath);
      await file.writeAsString(csv);
      print("Файл сохранён по пути: $filePath");
    } catch (e) {
      print("Ошибка при записи в файл: $e");
      throw e;
    }
  }

  void clearData() {
    csvData.clear();
    headers.clear();
    selectedColumns.clear();
    includedColumns.clear();
    fileName.value = '';
    Get.snackbar('Успешно', 'Данные очищены.');
  }

}