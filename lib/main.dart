import 'package:cryptor/controllers/theme_controller.dart';
import 'package:cryptor/router/app_pages.dart';
import 'package:cryptor/router/app_routes.dart';
import 'package:cryptor/screen/app.dart';
import 'package:cryptor/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'controllers/footer_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final FooterController controller = Get.put(FooterController());
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final CryThemeController controller = Get.put(CryThemeController());
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cryptor',
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('ru', ''), // Русский
        Locale('en', ''), // Английский
      ],
      locale: const Locale('ru', ''),
      initialRoute: Routes.MAIN,
      getPages: AppPages.pages,
      defaultTransition: Transition.noTransition,
      themeMode: controller.currentThemeMode.value,
      theme: CryAppTheme.lightTheme,
      darkTheme: CryAppTheme.darkTheme,
      home: DashboardPage(),
    );
  }
}
