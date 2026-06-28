import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

class AppTheme {
  // ثيم الوضع الفاتح
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      primaryColor: AppColors.primaryLight,
      scaffoldBackgroundColor: AppColors.backgroundLight,
      colorScheme: const ColorScheme.light(
        primary: AppColors.primaryLight,
        secondary: AppColors.secondaryLight,
        surface: AppColors.surfaceLight,
      ),
      textTheme: GoogleFonts.poppinsTextTheme().copyWith(
        bodyLarge: GoogleFonts.poppins(color: AppColors.textPrimaryLight),
        bodyMedium: GoogleFonts.poppins(color: AppColors.textSecondaryLight),
      ),
    );
  }

  // ثيم الوضع المظلم
  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      primaryColor: AppColors.primaryDark,
      scaffoldBackgroundColor: AppColors.backgroundDark,
      colorScheme: const ColorScheme.dark(
        primary: AppColors.primaryDark,
        secondary: AppColors.secondaryDark,
        surface: AppColors.surfaceDark,
      ),
      textTheme: GoogleFonts.poppinsTextTheme(ThemeData.dark().textTheme).copyWith(
        bodyLarge: GoogleFonts.poppins(color: AppColors.textPrimaryDark),
        bodyMedium: GoogleFonts.poppins(color: AppColors.textSecondaryDark),
      ),
    );
  }
}