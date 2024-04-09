import 'package:bloc_practice/constants/app_constants.dart';
import 'package:bloc_practice/helper/di.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

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
