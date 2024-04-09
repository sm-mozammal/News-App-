// ignore_for_file: prefer_interpolation_to_compose_strings

import 'dart:developer';
import 'package:bloc_practice/constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../helper/di.dart';

class LanguageSetting extends StatefulWidget {
  const LanguageSetting({super.key});

  @override
  State<LanguageSetting> createState() => _LanguageSettingState();
}

class _LanguageSettingState extends State<LanguageSetting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text('Language Setting'.tr),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            DropdownButton<String>(
                value: box.read(language),
                items: kLanguages.map<DropdownMenuItem<String>>((String value) {
                  log(value);
                  return DropdownMenuItem(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    log(value!);
                    setState(() {
                      box.write(kKeyLanguage, languagesCode[value]);
                      box.write(language, value);
                      box.write(kKeyCountry, countriesCode[value]);
                    });
                    log('language' + languagesCode[value]);
                    log('country' + countriesCode[value]);
                    var local =
                        Locale(languagesCode[value], countriesCode[value]);
                    Get.updateLocale(local);
                  });
                }),
            Text(
              "body".tr,
              style: TextStyle(fontSize: 16.sp),
              textAlign: TextAlign.justify,
            )
          ],
        ),
      ),
    );
  }
}
