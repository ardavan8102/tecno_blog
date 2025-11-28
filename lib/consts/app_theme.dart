import 'package:flutter/material.dart';
import 'package:tecno_blog/consts/colors.dart';

class AppTheme {

  static ThemeData mainTheme = ThemeData(
    fontFamily: 'Yekan',
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        padding: WidgetStateProperty.all(EdgeInsets.fromLTRB(40, 14, 40, 14)),
        elevation: WidgetStateProperty.all(0),
        backgroundColor: WidgetStateProperty.resolveWith(
          (states) {
            if (states.contains(WidgetState.pressed)) {
              return AppSolidColors.accent;
            }

            return AppSolidColors.accent.withValues(alpha: 0.7);
          },
        ),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(6),
          ),
        ),
        textStyle: WidgetStateProperty.resolveWith(
          (states) {
            if (states.contains(WidgetState.pressed)) {
              return mainTheme.textTheme.labelLarge;
            }

            return mainTheme.textTheme.labelSmall;
          },
        )
      ),
    ),
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

      // Titles
      titleLarge: TextStyle(
        fontSize: 26,
        fontFamily: 'Yekan',
        fontWeight: FontWeight.w700,
      ),
      titleMedium: TextStyle(
        fontSize: 24,
        fontFamily: 'Yekan',
        fontWeight: FontWeight.w500,
      ),
      titleSmall: TextStyle(
        fontSize: 22,
        fontFamily: 'Yekan',
        fontWeight: FontWeight.w400,
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

      // Labels
      labelSmall: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: AppSolidColors.textLight
      ),
      labelMedium: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: AppSolidColors.textLight
      ),
      labelLarge: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w700,
        color: AppSolidColors.textLight
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(
          width: 1,
        ),
      ),
      filled: true,
      fillColor: Colors.grey.shade200,
    ),
  );

}