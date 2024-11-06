import 'package:get/get.dart';

import '../enums/encryption_enums.dart';

class AlgorithmController extends GetxController {
  var selectedAlgorithm = EncryptionAlgorithm.MD5.obs;
  void selectAlgorithm(EncryptionAlgorithm algorithm) {
    selectedAlgorithm.value = algorithm;
  }
}