import 'package:flutter/material.dart';
import 'package:myportfolio/core/theme/app_colors_theme.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.lightBackground,
    fontFamily: 'Inter',
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      foregroundColor: AppColors.lightTextPrimary,
    ),
    colorScheme: ColorScheme.light(
      primary: AppColors.primary,
      background: AppColors.lightBackground,
    ),
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.darkBackground,
    fontFamily: 'Inter',
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      foregroundColor: AppColors.darkTextPrimary,
    ),
    colorScheme: ColorScheme.dark(
      primary: AppColors.primary,
      background: AppColors.darkBackground,
    ),
  );
}
