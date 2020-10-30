import 'package:flutter/material.dart';

// ignore: avoid_classes_with_only_static_members
abstract class DefaultTheme {
  static const _primaryColor = Colors.blue;
  static const _accentColor = Colors.white;
  static const _buttonColor = Colors.blueAccent;

  static final ThemeData themeData = ThemeData(
    brightness: Brightness.light,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    appBarTheme: _appBarTheme,
    bottomNavigationBarTheme: _bottomNavigationBarTheme,
    textTheme: _textTheme,
    inputDecorationTheme: _inputDecorationTheme,
    textButtonTheme: _textButtonTheme,
    elevatedButtonTheme: _elevatedButtonTheme,
    outlinedButtonTheme: _outlinedButtonTheme,
    scaffoldBackgroundColor: Colors.grey,
    primaryColor: _primaryColor,
    accentColor: _accentColor,
    buttonColor: _buttonColor,
  );

  static const AppBarTheme _appBarTheme = AppBarTheme(
    brightness: Brightness.light,
  );

  static const BottomNavigationBarThemeData _bottomNavigationBarTheme =
      BottomNavigationBarThemeData();

  static const TextTheme _textTheme = TextTheme(
    headline1: TextStyle(),
    headline2: TextStyle(),
    headline3: TextStyle(),
    headline4: TextStyle(),
    headline5: TextStyle(),
    headline6: TextStyle(),
    caption: TextStyle(),
    subtitle1: TextStyle(),
    subtitle2: TextStyle(),
    bodyText1: TextStyle(),
    bodyText2: TextStyle(),
  );

  static const InputDecorationTheme _inputDecorationTheme =
      InputDecorationTheme();

  static const TextButtonThemeData _textButtonTheme = TextButtonThemeData();

  static const ElevatedButtonThemeData _elevatedButtonTheme =
      ElevatedButtonThemeData();

  static const OutlinedButtonThemeData _outlinedButtonTheme =
      OutlinedButtonThemeData();
}
