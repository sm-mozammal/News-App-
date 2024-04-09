import 'package:news_app/constants/app_constants.dart';
import 'package:news_app/helper/di.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import 'package:intl/intl.dart';

void setLanguage({String? languageCode, String? countryCode}) {
  box.write(kKeyLanguage, languageCode);
  box.write(kKeyCountry, countryCode);
  box.write(language, 'English');
}

void setLanguageCode(String language) {
  switch (language) {
    case 'English':
      box.write(kKeyLanguage, 'en');
      box.write(kKeyCountry, 'US');
      var local = const Locale(kKeyLanguage, kKeyCountry);
      Get.updateLocale(local);
      break;
    case 'Bangla':
      box.write(kKeyLanguage, 'bn');
      box.write(kKeyCountry, 'BD');
      var local = const Locale(kKeyLanguage, kKeyCountry);
      Get.updateLocale(local);
      break;
  }
}

String formatedDateTime(DateTime time) {
  return DateFormat('d MMMM yyyy  HH:mm').format(time);
}
