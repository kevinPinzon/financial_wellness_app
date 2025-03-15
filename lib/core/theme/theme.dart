import 'package:flutter/material.dart';

import 'colors.dart';

class AppTheme {
  static ThemeData themeData() {
    return ThemeData(
      primaryColor: AppColors.blue,
      scaffoldBackgroundColor: AppColors.white,
      appBarTheme: AppBarTheme(
        color: Colors.grey[700],
      ),
      cardTheme: CardTheme(
        color: Colors.grey[200],
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      textTheme: TextTheme(
        headlineSmall: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
        titleLarge: TextStyle(
          fontSize: 16,
          color: Colors.grey[600],
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all<Color>(AppColors.blue),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          foregroundColor: WidgetStateProperty.all<Color>(AppColors.blue),
        ),
      ),
    );
  }
}

const inputDecorationTheme = InputDecorationTheme(
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: AppColors.blue,
      width: 1,
    ),
  ),
);
