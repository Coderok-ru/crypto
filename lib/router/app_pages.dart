

import 'package:cryptor/router/app_routes.dart';
import 'package:cryptor/screen/app.dart';
import 'package:get/get.dart';

class AppPages {
  static final pages = [
    GetPage(name: Routes.MAIN, page: () => DashboardPage()),
  ];
}