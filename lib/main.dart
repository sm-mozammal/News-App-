import 'package:news_app/constants/app_constants.dart';
import 'package:news_app/features/news/bloc/bloc.dart';
import 'package:news_app/features/news/presentation/news_screen.dart';
import 'package:news_app/helper/di.dart';
import 'package:news_app/helper/helper_method.dart';
import 'package:news_app/helper/language.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  diSetUp();
  setLanguage(languageCode: 'en', countryCode: 'US');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    rotation();
    String language = box.read(kKeyLanguage);
    String country = box.read(kKeyCountry);
    return ScreenUtilInit(
        designSize: const Size(360, 890),
        builder: (_, child) {
          return MultiBlocProvider(
            providers: [
              BlocProvider<NewsBloc>(
                create: (_) => NewsBloc(),
              ),
            ],
            child: GetMaterialApp(
              translations: LocalString(),
              locale: Locale(language, country),
              debugShowCheckedModeBanner: false,
              title: 'Flutter Demo',
              theme: ThemeData(
                primaryColor: Colors.blue,
                buttonTheme: ButtonThemeData(
                    hoverColor: Colors.red,
                    buttonColor: Colors.amber[100],
                    textTheme: ButtonTextTheme.accent),
                appBarTheme: AppBarTheme(
                    scrolledUnderElevation: 0,
                    backgroundColor: Colors.amber[100]),
                colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
                useMaterial3: true,
              ),
              home: const NewsScreen(),
            ),
          );
        });
  }
}

void rotation() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
  ));

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
}
