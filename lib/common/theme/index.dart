import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'colors.dart';

class ThemeApp {
  static String get fontFamily => 'Urbanist';
  static TextStyle get baseTextStyle =>
      TextStyle(fontSize: 16, fontFamily: fontFamily);

  static ThemeData lightTheme = ThemeData.light().copyWith(
    primaryColor: kPrimaryColor,
    hintColor: const Color(0xFFC5C5C5),
    scaffoldBackgroundColor: kWhiteColor,
    cardColor: Colors.white,
    iconTheme: const IconThemeData(
      color: kPrimaryColor,
    ),
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    hoverColor: Colors.transparent,
    dividerColor: kGray200,
    appBarTheme: AppBarTheme(
        systemOverlayStyle: SystemUiOverlayStyle.light,
        centerTitle: false,
        titleTextStyle: baseTextStyle.copyWith(
          fontSize: 24,
          color: kGray900,
          fontWeight: FontWeight.bold,
        ),
        actionsIconTheme: const IconThemeData(color: kGray900),
        iconTheme: const IconThemeData(
          color: kGray900,
        ),
        elevation: 0,
        backgroundColor: kWhiteColor),
    colorScheme: const ColorScheme.light()
        .copyWith(background: const Color(0xFFFFFFFF), primary: kPrimaryColor)
        .copyWith(error: const Color(0xFFe74c3c)),
    tabBarTheme: TabBarTheme(
        indicatorColor: kPrimaryColor,
        dividerColor: kGray200,
        indicator: const BoxDecoration(
          border: Border(bottom: BorderSide(color: kPrimaryColor, width: 4)),
        ),
        labelColor: kPrimaryColor,
        unselectedLabelColor: kGray500,
        labelPadding: const EdgeInsets.symmetric(horizontal: 8),
        labelStyle: baseTextStyle.copyWith(
            fontSize: 18, fontWeight: FontWeight.w600, color: kPrimaryColor),
        unselectedLabelStyle: baseTextStyle.copyWith(
            fontSize: 18, fontWeight: FontWeight.w600, color: kGray500)),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: kWhiteColor,
      elevation: 0,
      selectedIconTheme: const IconThemeData(size: 28, color: kPrimaryColor),
      unselectedIconTheme: const IconThemeData(size: 24, color: kGray500),
      selectedLabelStyle: baseTextStyle.copyWith(
        fontSize: 12,
        fontWeight: FontWeight.w700,
        color: kPrimaryColor,
      ),
      unselectedLabelStyle: baseTextStyle.copyWith(
        fontSize: 12,
        fontWeight: FontWeight.w500,
        color: kGray500,
      ),
    ),
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: kPrimaryColor,
    ),
    checkboxTheme: CheckboxThemeData(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      fillColor: MaterialStateColor.resolveWith((states) => kPrimaryColor),
      overlayColor: MaterialStateColor.resolveWith((states) => kPrimaryColor),
    ),
    radioTheme: RadioThemeData(
      fillColor: MaterialStateColor.resolveWith((states) => kPrimaryColor),
      overlayColor: MaterialStateColor.resolveWith((states) => kPrimaryColor),
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
  );

  static ThemeData darkTheme = ThemeData.dark().copyWith(
    primaryColor: kPrimaryColor,
    hintColor: const Color(0xFFC5C5C5),
    cardColor: kDark1Color,
    dividerColor: kDark3,
    scaffoldBackgroundColor: kDark1Color,
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: kPrimaryColor,
    ),
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    hoverColor: Colors.transparent,
    appBarTheme: AppBarTheme(
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        centerTitle: false,
        actionsIconTheme: const IconThemeData(
          color: kWhiteColor,
        ),
        elevation: 0,
        titleTextStyle: baseTextStyle.copyWith(
          fontSize: 24,
          color: kWhiteColor,
          fontWeight: FontWeight.bold,
        ),
        backgroundColor: kDark1Color),
    colorScheme: const ColorScheme.dark().copyWith(background: kDark1Color),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: kDark1Color.withOpacity(0.85),
      elevation: 0,
      selectedIconTheme: const IconThemeData(size: 28, color: kPrimaryColor),
      unselectedIconTheme: const IconThemeData(size: 24, color: kGray500),
      selectedLabelStyle: baseTextStyle.copyWith(
        fontSize: 12,
        fontWeight: FontWeight.w700,
        color: kPrimaryColor,
      ),
      unselectedLabelStyle: baseTextStyle.copyWith(
        fontSize: 12,
        fontWeight: FontWeight.w500,
        color: kGray500,
      ),
    ),
    tabBarTheme: TabBarTheme(
        indicatorColor: kPrimaryColor,
        dividerColor: kGray200,
        indicator: const BoxDecoration(
          border: Border(bottom: BorderSide(color: kPrimaryColor, width: 4)),
        ),
        labelColor: kPrimaryColor,
        unselectedLabelColor: kGray500,
        labelPadding: const EdgeInsets.symmetric(horizontal: 8),
        labelStyle: baseTextStyle.copyWith(
            fontSize: 18, fontWeight: FontWeight.w600, color: kPrimaryColor),
        unselectedLabelStyle: baseTextStyle.copyWith(
            fontSize: 18, fontWeight: FontWeight.w600, color: kGray500)),
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
  );
}
