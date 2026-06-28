import 'package:flutter/material.dart';

class AppColors {
  AppColors._(); // لمنع إنشاء كائن من هذا الكلاس يدوياً

  // 🌟 الألوان الأساسية (Primary & Secondary) المستوحاة من الهوية البصرية
  static const Color primary = Color(0xFF1A237E);      // Indigo عميق يعبر عن الثقة والأمان
  static const Color secondary = Color(0xFFFF9100);    // برتقالي حيوي يعبر عن الخدمات والسرعة
  static const Color accent = Color(0xFF00B0FF);       // أزرق سماوي للروابط واللمسات الخفيفة

  // ☀️ ألوان الثيم المضيء (Light Theme Colors)
  static const Color backgroundLight = Color(0xFFF8F9FA);
  static const Color surfaceLight = Color(0xFFFFFFFF);
  static const Color textPrimaryLight = Color(0xFF212121);
  static const Color textSecondaryLight = Color(0xFF757575);

  // 🌙 ألوان الثيم المظلم (Dark Theme Colors)
  static const Color backgroundDark = Color(0xFF121212);
  static const Color surfaceDark = Color(0xFF1E1E1E);
  static const Color textPrimaryDark = Color(0xFFF5F5F5);
  static const Color textSecondaryDark = Color(0xFFB0BEC5);

  // ⚠️ ألوان الحالات والنظام (System & Status Colors)
  static const Color success = Color(0xFF4CAF50);      // العمليات الناجحة / مقدم خدمة متاح
  static const Color warning = Color(0xFFFFC107);      // التنبيهات والمعاملات المعلقة
  static const Color error = Color(0xFFD32F2F);        // الأخطاء / إلغاء الحجز / الحالات الطارئة
  static const Color info = Color(0xFF2196F3);         // الإرشادات والمعلومات العامة

  // 🩶 ألوان حيادية وتدرجات الرمادي (Greyscale)
  static const Color grey100 = Color(0xFFF5F5F5);
  static const Color grey200 = Color(0xFFEEEEEE);
  static const Color grey300 = Color(0xFFE0E0E0);
  static const Color grey400 = Color(0xFFBDBDBD);
  static const Color grey600 = Color(0xFF757575);
  static const Color grey800 = Color(0xFF424242);
}