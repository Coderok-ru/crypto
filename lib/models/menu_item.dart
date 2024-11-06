import 'package:cryptor/utils/constants/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../router/app_routes.dart';


class MenuItem {
  final String name;
  final IconData icon;
  final Color? bgColor;
  final String route;

  MenuItem(this.name, this.icon, this.route, {this.bgColor});
}

final List<MenuItem> menuItems = [
  MenuItem('Шифрование CSV', CupertinoIcons.table, Routes.MAIN),
  MenuItem('Шифрование текста', CupertinoIcons.doc_text, Routes.TEXT),
  MenuItem('Расшифровка текста', CupertinoIcons.doc_checkmark, Routes.DETEXT),
  MenuItem('Настройки', CupertinoIcons.settings, Routes.SETTINGS),
];
