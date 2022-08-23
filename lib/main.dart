import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:tecblog/view/article_list_screen.dart';
import 'package:tecblog/view/main_screen/main_screen.dart';
import 'package:tecblog/view/register_intro.dart';
import 'package:tecblog/view/single_screen.dart';
import 'package:tecblog/view/splash_screen.dart';
import '../components/my_colors.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: SolidColors.statusbarColor,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: SolidColors.systemNavigationBarColor,
      systemNavigationBarIconBrightness: Brightness.dark));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      locale: const Locale('fa'),
      title: 'Techblog ',
      theme: ThemeData(
        inputDecorationTheme: const InputDecorationTheme(
            // hintStyle: textTheme.headline5,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(16)),
                borderSide: BorderSide(width: 2.0))),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            textStyle: MaterialStateProperty.resolveWith((states) {
              if (states.contains(MaterialState.pressed)) {
                return textTheme.headline1;
              }
              // return textTheme.headline1;
              return textTheme.subtitle1;
            }),
            backgroundColor: MaterialStateProperty.resolveWith((states) {
              if (states.contains(MaterialState.pressed)) {
                return SolidColors.onPressedButton;
              }
              return SolidColors.primaryColor;
            }),
          ),
        ),
        textTheme: const TextTheme(
          headline1: TextStyle(
            fontFamily: 'dana',
            fontSize: 16,
            color: SolidColors.posterTitle,
            fontWeight: FontWeight.w700,
          ),
          subtitle1: TextStyle(
            fontFamily: 'dana',
            fontSize: 14,
            color: SolidColors.posterSubTitle,
            fontWeight: FontWeight.w300,
          ),
          headline2: TextStyle(
            fontFamily: 'dana',
            fontSize: 14,
            color: SolidColors.tag,
            fontWeight: FontWeight.w300,
          ),
          headline3: TextStyle(
            fontFamily: 'dana',
            fontSize: 14,
            color: SolidColors.seeMore,
            fontWeight: FontWeight.w700,
          ),
          headline4: TextStyle(
              fontFamily: 'dana',
              fontSize: 14,
              color: SolidColors.title,
              fontWeight: FontWeight.w700),
          subtitle2: TextStyle(
              fontFamily: 'dana',
              fontSize: 14,
              color: SolidColors.title,
              fontWeight: FontWeight.w300),
          headline5: TextStyle(
              fontFamily: 'dana',
              fontSize: 14,
              color: SolidColors.hintText,
              fontWeight: FontWeight.w700),
          headline6: TextStyle(
              fontFamily: 'dana',
              fontSize: 16,
              color: SolidColors.primaryColor,
              fontWeight: FontWeight.w300),
          caption: TextStyle(
              fontFamily: 'dana',
              fontSize: 16,
              color: SolidColors.subtitleArticle,
              fontWeight: FontWeight.w300),
          headlineLarge: TextStyle(
              fontFamily: 'dana',
              fontSize: 20,
              color: SolidColors.title,
              fontWeight: FontWeight.w700),
        ),
      ),
      // home: const SplashScreen(),
      // home: const RegisterIntro(),
      // home: MainScreen(),
      home: ArticleListScreen(),
      // home: SingleScreen(),
    );
  }
}
