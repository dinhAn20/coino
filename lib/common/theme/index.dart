import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'colors.dart';

class ThemeApp {
  static String get fontFamily => 'Lato';
  static TextStyle get baseTextStyle =>
      TextStyle(fontSize: 16, fontFamily: fontFamily);

  static ThemeData lightTheme = ThemeData.light().copyWith(
    primaryColor: kPrimaryColor,
    hintColor: const Color(0xFFC5C5C5),
    scaffoldBackgroundColor: kWhiteColor,
    cardColor: Colors.white,
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: kPrimaryColor,
    ),
    textTheme: ThemeData.light().textTheme.copyWith(
          //headline1
          displayLarge: baseTextStyle.copyWith(
            fontSize: 48,
            color: kGray900,
            fontWeight: FontWeight.bold,
          ),
          //headline2
          displayMedium: baseTextStyle.copyWith(
            fontSize: 40,
            color: kGray900,
            fontWeight: FontWeight.bold,
          ),
          //headline3
          displaySmall: baseTextStyle.copyWith(
            fontSize: 32,
            color: kGray900,
            fontWeight: FontWeight.bold,
          ),
          //headline4
          headlineMedium: baseTextStyle.copyWith(
            fontSize: 24,
            color: kGray900,
            fontWeight: FontWeight.bold,
          ),
          //headline5
          headlineSmall: baseTextStyle.copyWith(
            fontSize: 20,
            color: kGray900,
            fontWeight: FontWeight.bold,
          ),
          //headline6
          titleLarge: baseTextStyle.copyWith(
            fontSize: 18,
            color: kGray900,
            fontWeight: FontWeight.bold,
          ),
          //Body XLarge
          titleMedium: baseTextStyle.copyWith(
              fontSize: 18,
              color: kGray900,
              fontWeight: FontWeight.bold,
              letterSpacing: 0.2),
          bodyLarge: baseTextStyle.copyWith(
              fontSize: 16,
              color: kGray900,
              fontWeight: FontWeight.bold,
              letterSpacing: 0.2),
          bodyMedium: baseTextStyle.copyWith(
              fontSize: 14,
              color: kGray900,
              fontWeight: FontWeight.bold,
              letterSpacing: 0.2),
          bodySmall: baseTextStyle.copyWith(
              fontSize: 12,
              color: kGray900,
              fontWeight: FontWeight.bold,
              letterSpacing: 0.2),
          //Body XSmall
          labelSmall: baseTextStyle.copyWith(
              fontSize: 10,
              color: kGray900,
              fontWeight: FontWeight.bold,
              letterSpacing: 0.2),
        ),
    appBarTheme: const AppBarTheme(
        systemOverlayStyle: SystemUiOverlayStyle.light,
        centerTitle: true,
        backgroundColor: kPrimaryColor),
    colorScheme: const ColorScheme.light()
        .copyWith(background: const Color(0xFFFFFFFF), primary: kPrimaryColor)
        .copyWith(error: const Color(0xFFe74c3c)),
  );

  static ThemeData darkTheme = ThemeData.dark().copyWith(
    primaryColor: kPrimaryColor,
    hintColor: const Color(0xFFC5C5C5),
    cardColor: kDark1Color,
    scaffoldBackgroundColor: kDark1Color,
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: kPrimaryColor,
    ),
    textTheme: ThemeData.dark().textTheme.copyWith(
          //headline1
          displayLarge: baseTextStyle.copyWith(
            fontSize: 48,
            color: kWhiteColor,
            fontWeight: FontWeight.bold,
          ),
          //headline2
          displayMedium: baseTextStyle.copyWith(
            fontSize: 40,
            color: kWhiteColor,
            fontWeight: FontWeight.bold,
          ),
          //headline3
          displaySmall: baseTextStyle.copyWith(
            fontSize: 32,
            color: kWhiteColor,
            fontWeight: FontWeight.bold,
          ),
          //headline4
          headlineMedium: baseTextStyle.copyWith(
            fontSize: 24,
            color: kWhiteColor,
            fontWeight: FontWeight.bold,
          ),
          //headline5
          headlineSmall: baseTextStyle.copyWith(
            fontSize: 20,
            color: kWhiteColor,
            fontWeight: FontWeight.bold,
          ),
          //headline6
          titleLarge: baseTextStyle.copyWith(
            fontSize: 18,
            color: kWhiteColor,
            fontWeight: FontWeight.bold,
          ),
          //Body XLarge
          titleMedium: baseTextStyle.copyWith(
              fontSize: 18,
              color: kWhiteColor,
              fontWeight: FontWeight.bold,
              letterSpacing: 0.2),
          bodyLarge: baseTextStyle.copyWith(
              fontSize: 16,
              color: kWhiteColor,
              fontWeight: FontWeight.bold,
              letterSpacing: 0.2),
          bodyMedium: baseTextStyle.copyWith(
              fontSize: 14,
              color: kWhiteColor,
              fontWeight: FontWeight.bold,
              letterSpacing: 0.2),
          bodySmall: baseTextStyle.copyWith(
              fontSize: 12,
              color: kWhiteColor,
              fontWeight: FontWeight.bold,
              letterSpacing: 0.2),
          //Body XSmall
          labelSmall: baseTextStyle.copyWith(
              fontSize: 10,
              color: kWhiteColor,
              fontWeight: FontWeight.bold,
              letterSpacing: 0.2),
        ),
    appBarTheme: const AppBarTheme(
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        centerTitle: true,
        backgroundColor: kPrimaryColor),
    colorScheme: const ColorScheme.dark().copyWith(background: kDark1Color),
  );
}
