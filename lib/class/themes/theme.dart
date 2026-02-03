import 'package:flutter/material.dart';

import '../colors.dart';

class MyTheme {
  static ThemeData lightTheme = ThemeData(
    appBarTheme: AppBarTheme(centerTitle: true),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      showSelectedLabels: false,
      showUnselectedLabels: false,
    ),
    primaryColor: AppColor.mainColor,
    brightness: Brightness.light,
    colorScheme: ColorScheme(
      brightness: Brightness.light,
      primary: AppColor.mainColor,
      onPrimary: AppColor.mainText,
      secondary: Colors.white,
      onSecondary:  AppColor.mainColor,
      error: Colors.red,
      onError: Colors.red,
      surface: AppColor.bachGroundLight,
      onSurface: Colors.black,
    ),
  );
  static ThemeData DarkTheme = ThemeData(
    appBarTheme: AppBarTheme(centerTitle: true),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      showSelectedLabels: false,
      showUnselectedLabels: false,
    ),
    primaryColor: AppColor.mainColorDark,
    brightness: Brightness.dark,
    colorScheme: ColorScheme(
      brightness: Brightness.dark,
      primary: AppColor.mainColorDark,
      onPrimary: AppColor.mainTextDark,
      secondary: Colors.white,
      onSecondary: Colors.white,
      error: Colors.red,
      onError: Colors.red,
      surface: AppColor.bachGroundDark,
      onSurface: Colors.black,
    ),
  );
}
