import 'package:flutter/material.dart';

class AppTypography {
  AppTypography._(); // لمنع إنشاء كائن يدوياً

  // 📝 العناوين الكبرى (Headings) - تستعمل لصفحات الترحيب والـ Splash والأقسام الرئيسية
  static const TextStyle h1 = TextStyle(
    fontSize: 28.0,
    fontWeight: FontWeight.bold,
    letterSpacing: -0.5,
    height: 1.3,
  );

  static const TextStyle h2 = TextStyle(
    fontSize: 22.0,
    fontWeight: FontWeight.w700,
    letterSpacing: -0.2,
    height: 1.25,
  );

  static const TextStyle h3 = TextStyle(
    fontSize: 18.0,
    fontWeight: FontWeight.w600,
    height: 1.2,
  );

  // 📄 النصوص الأساسية (Body Text) - للوصف، تفاصيل الخدمات، والقوائم
  static const TextStyle bodyLarge = TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.normal,
    height: 1.5,
  );

  static const TextStyle bodyMedium = TextStyle(
    fontSize: 14.0,
    fontWeight: FontWeight.normal,
    height: 1.45,
  );

  // 🏷️ نصوص العناوين الفرعية والأزرار (Subtitles & Buttons)
  static const TextStyle button = TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.5,
  );

  static const TextStyle subtitle = TextStyle(
    fontSize: 14.0,
    fontWeight: FontWeight.w500,
    color: Colors.grey,
  );

  // 🔍 النصوص الصغيرة (Caption & Small Text) - للتواريخ، المسافات، والأسعار الفرعية
  static const TextStyle caption = TextStyle(
    fontSize: 12.0,
    fontWeight: FontWeight.normal,
    letterSpacing: 0.2,
  );
}