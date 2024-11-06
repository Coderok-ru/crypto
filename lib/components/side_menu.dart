import 'package:cryptor/utils/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:auto_size_text/auto_size_text.dart';
import '../components/side_menu_item.dart';
import '../models/menu_item.dart';
import '../utils/constants/colors.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dark = CryHelperFunctions.isDarkMode(context);
    return Expanded(
      flex: 2,
      child: Container(
        decoration: BoxDecoration(
          color: dark ? CryColors.dark : CryColors.white,
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Stack(
          children: [
            Positioned(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: CryColors.primary,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(16.0),
                          topRight: Radius.circular(16.0),
                          bottomLeft: Radius.circular(16.0),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AutoSizeText(
                              'CRYPTOR',
                              style: Theme.of(context).textTheme.headlineLarge,
                              maxLines: 1,
                            ),
                            AutoSizeText(
                              'Защищает ваши данные',
                              style: Theme.of(context).textTheme.bodyMedium,
                              maxLines: 1,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 6,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: menuItems.map((item) => SideMenuItem(item: item)).toList(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              child: Align(
                alignment: FractionalOffset.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 30.0),
                  child: SvgPicture.asset(
                    'assets/undraw_secure_files_re_6vdh.svg',
                    width: 140,
                  ),
                ),
              ),
            ),
            Positioned(
              child: Align(
                alignment: FractionalOffset.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Opacity(opacity: 0.5,
                  child: Text('v 1.0.4 (4)', style: Theme.of(context).textTheme.labelSmall,)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
