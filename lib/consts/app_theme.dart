import 'package:flutter/material.dart';

class AppTheme {

  static ThemeData mainTheme = ThemeData(
    fontFamily: 'Yekan',
    textTheme: TextTheme(
      // Headlines
      headlineLarge: TextStyle(
        fontSize: 32,
        fontFamily: 'Yekan',
        fontWeight: FontWeight.w900,
      ),
      headlineMedium: TextStyle(
        fontSize: 24,
        fontFamily: 'Yekan',
        fontWeight: FontWeight.w800,
      ),
      headlineSmall: TextStyle(
        fontSize: 18,
        fontFamily: 'Yekan',
        fontWeight: FontWeight.w700,
      ),

      // Bodies
      bodyLarge: TextStyle(
        fontSize: 20,
        fontFamily: 'Yekan',
        fontWeight: FontWeight.w500,
      ),
      bodyMedium: TextStyle(
        fontSize: 18,
        fontFamily: 'Yekan',
        fontWeight: FontWeight.w400,
      ),
      bodySmall: TextStyle(
        fontSize: 16,
        fontFamily: 'Yekan',
        fontWeight: FontWeight.w300,
      ),
    ),
  );

}