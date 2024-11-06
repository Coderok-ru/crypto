import 'package:flutter/cupertino.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

import '../enums/encryption_enums.dart';
import '../utils/constants/colors.dart';
import '../utils/helper_function.dart';

class EncryptionDescription extends StatelessWidget {
  final EncryptionAlgorithm algorithm;

  const EncryptionDescription({Key? key, required this.algorithm}) : super(key: key);

  String getMarkdownContent() {
    switch (algorithm) {
      case EncryptionAlgorithm.MD5:
        return '''
# MD5
MD5 (Message-Digest Algorithm 5) — устаревший алгоритм хеширования. 

Хеш, полученный от функции, работа которой основана на этом алгоритме, выдает строку в 16 байт (128) бит. И эта строка включает в себя 16 шестнадцатеричных чисел. При этом изменение хотя бы одного ее символа приведет к последующему бесповоротному изменению значений всех остальных битов строки.

Хеши MD5 больше не считаются безопасными, и их не рекомендовано использовать для криптографической аутентификации.

- Используется для проверки целостности данных.
- Не рекомендуется для криптографической безопасности.
        ''';
      case EncryptionAlgorithm.SHA256:
        return '''
# SHA-256
SHA-256 — криптографическая хеш-функция.

SHA-256 (Secure Hash Algorithm 2) — одно из самых популярных семейств алгоритмов хеширования. 

Все, что касается темы хеширования (сокращения данных), напрямую связано с безопасностью и надежностью в цифровом мире. И все семейство SHA-2 в этом плане считается самыми надежными и популярными алгоритмами. 

Алгоритм SHA-256 начинался с биткоина. Или наоборот. Дальше многие другие монеты присоединились именно к этому алгоритму хеширования:

- Bitcoin Cash (BCH);
- Syscoin (SYS);
- Peercoin (PPC);
- DigiByte (DGB);
- Namecoin (NMC).

У алгоритма можно выделить один самый большой плюс и один минус. Первое ― его востребованность (большая часть оборудования работает именно на нем, майнеры его очень любят). Второе ― его подконтрольность (из-за того, что SHA во многом зависит от вычислительной мощности оборудования, крупные майнеры пользуются большими привилегиями в нем, чем одиночки и новички).

- Обеспечивает более высокую безопасность по сравнению с MD5.
- Используется в различных криптографических приложениях.
        ''';
      case EncryptionAlgorithm.AES:
        return '''
# AES
AES (Advanced Encryption Standard) — симметричный алгоритм шифрования.

В основе AES лежит блочный шифр, который использует 128-битный размер блока и 128, 192 или 256-битные ключи для шифрования данных. AES256 - это версия стандарта с 256-битными ключами. Этот стандарт широко считается самым безопасным стандартом цифровой криптографии, который обычно используется для наиболее надежной сквозной шифрованной связи.

Алгоритм AES пользуется высоким доверием и надежностью. Национальный институт стандартов и технологий высоко оценил AES, назвав его "невзламываемым", а правительство США использует его для защиты секретной информации с 2001 года.

Если вы хотите узнать, сколько времени потребуется для взлома зашифрованного AES-256 содержимого - мы не можем точно сказать, что произойдет на практике, поскольку это еще не было сделано. Но теоретически для взлома потребуются миллиарды лет.

- Использует ключи длиной 128, 192 или 256 бит.
- Обеспечивает высокий уровень безопасности.
        ''';
      default:
        return '''
# Добро пожаловать!
Выберите алгоритм шифрования и загрузите файл для продолжения.
        ''';
    }
  }

  @override
  Widget build(BuildContext context) {
    final dark = CryHelperFunctions.isDarkMode(context);
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
          color: dark ? CryColors.dark : CryColors.white,
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Markdown(
                  data: getMarkdownContent(),
                  styleSheet: MarkdownStyleSheet(
                    p: TextStyle(fontSize: 12),
                    h1: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}