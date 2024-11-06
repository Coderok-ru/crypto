import 'package:get/get.dart';
import 'dart:async';

class TimeController extends GetxController {
  var currentTime = ''.obs;
  var currentDate = ''.obs;
  Timer? timer;

  @override
  void onInit() {
    super.onInit();
    _updateTime();
    timer = Timer.periodic(Duration(seconds: 1), (Timer t) => _updateTime());
  }

  void _updateTime() {
    final now = DateTime.now();
    currentTime.value = '${_padZero(now.hour)}:${_padZero(now.minute)}:${_padZero(now.second)}';
    currentDate.value = '${now.day}.${now.month}.${now.year}';
  }

  String _padZero(int number) => number.toString().padLeft(2, '0');

  @override
  void onClose() {
    timer?.cancel();
    super.onClose();
  }
}