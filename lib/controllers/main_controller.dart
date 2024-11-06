import 'package:get/get.dart';

import '../router/app_routes.dart';

class NavigationController extends GetxController {
  var currentRoute = Routes.MAIN.obs;

  void setRoute(String route) {
    currentRoute.value = route;
  }
}