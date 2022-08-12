import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:tecblog/my_colors.dart';
import 'package:tecblog/view/register_intro.dart';

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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('fa', ''), // farsi/persion
      ],
      title: 'Techblog ',
      theme: ThemeData(
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
        //headline5: ,
      )),
      // home: const SplashScreen(),
      home: const RegisterIntro(),
    );
  }
}
