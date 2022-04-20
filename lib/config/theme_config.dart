import 'package:flutter/material.dart';
import 'package:sneve/sneve_theme.dart';

class ThemeConfig {
  ThemeConfig();

  static const SneveAppBarStyle appBarStyle = SneveAppBarStyle(
      titleSize: 22,
      titleColor: Colors.deepOrange,
      widthPercent: 0.9,
      height: 60);

  static const SneveAppTheme lightTheme = SneveAppTheme(
      themeColor: Colors.white,
      primaryColor: Colors.deepOrange,
      backgroundColor: Colors.white,
      unselectedColor: Colors.grey,
      themeMode: Brightness.light);

  static const darkTheme = SneveAppTheme(
      themeColor: Colors.black,
      primaryColor: Colors.deepOrange,
      backgroundColor: Colors.black,
      unselectedColor: Colors.grey,
      themeMode: Brightness.dark);

  static const cardComponentStyle = CardComponentStyle(
      widthPercent: 0.9,
      heightPercent: 0.3,
      maxWidth: 500,
      badgeSize: 75,
      badgeColor: Color(0xff000000),
      padding: 20,
      wowButtonMargin: 8,
      titleSize: 16,
      borderRadius: 8,
      wowButtonSize: 35,
      bottomMargin: 12);

  static const cardButtonStyle = CardButtonStyle(textSize: 20);
}
