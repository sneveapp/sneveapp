import 'package:flutter/material.dart';

class SneveTheme {
  const SneveTheme();

  MaterialColor createMaterialColor(Color color) {
    List strengths = <double>[.05];
    Map<int, Color> swatch = {};
    final int r = color.red, g = color.green, b = color.blue;

    for (int i = 1; i < 10; i++) {
      strengths.add(0.1 * i);
    }
    for (var strength in strengths) {
      final double ds = 0.5 - strength;
      swatch[(strength * 1000).round()] = Color.fromRGBO(
        r + ((ds < 0 ? r : (255 - r)) * ds).round(),
        g + ((ds < 0 ? g : (255 - g)) * ds).round(),
        b + ((ds < 0 ? b : (255 - b)) * ds).round(),
        1,
      );
    }
    return MaterialColor(color.value, swatch);
  }
}

class SneveAppTheme extends SneveTheme {
  final Color primaryColor;
  final Color backgroundColor;
  final Color themeColor;
  final Color unselectedColor;
  final Brightness themeMode;
  final Color dividerColor;

  const SneveAppTheme({
    required this.themeColor,
    required this.primaryColor,
    required this.backgroundColor,
    required this.unselectedColor,
    required this.themeMode,
    this.dividerColor = Colors.black12,
  }) : super();

  ThemeData toThemeData() {
    return ThemeData(
        primarySwatch: createMaterialColor(primaryColor),
        primaryColor: themeColor,
        backgroundColor: backgroundColor,
        unselectedWidgetColor: unselectedColor,
        brightness: themeMode,
        dividerColor: dividerColor,
        scaffoldBackgroundColor: themeColor);
    //textTheme: const TextTheme(button: TextStyle(fontSize: 20)));
  }
}

class SneveAppBarStyle extends SneveTheme {
  final double titleSize;
  final Color titleColor;
  final double widthPercent;
  final double height;

  const SneveAppBarStyle(
      {required this.titleSize,
      required this.titleColor,
      required this.widthPercent,
      required this.height})
      : super();
}

class CardComponentStyle extends SneveTheme {
  final double widthPercent;
  final double heightPercent;
  final double maxWidth;
  final double badgeSize;
  final Color badgeColor;
  final double padding;
  final double wowButtonMargin;
  final double titleSize;
  final double borderRadius;
  final double wowButtonSize;
  final double bottomMargin;

  const CardComponentStyle(
      {required this.widthPercent,
      required this.heightPercent,
      required this.maxWidth,
      required this.badgeSize,
      required this.badgeColor,
      required this.padding,
      required this.wowButtonMargin,
      required this.bottomMargin,
      required this.titleSize,
      required this.borderRadius,
      required this.wowButtonSize})
      : super();
}

class CardButtonStyle extends SneveTheme {
  final double textSize;

  const CardButtonStyle({required this.textSize}) : super();
}
