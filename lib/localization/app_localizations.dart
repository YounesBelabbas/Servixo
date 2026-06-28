import 'package:flutter/material.dart';

class AppLocalizations {
  final Locale locale;
  AppLocalizations(this.locale);

  static const List<String> supportedLanguages = ['en', 'ar', 'fr'];

  static final Map<String, Map<String, String>> _localizedValues = {
    'en': {
      'app_name': 'Servixo',
      'welcome': 'Welcome to Servixo',
      'login': 'Login',
      'register': 'Register',
      'home': 'Home',
      'services': 'Services',
    },
    'ar': {
      'app_name': 'سيرفيكسو',
      'welcome': 'مرحباً بك في سيرفيكسو',
      'login': 'تسجيل الدخول',
      'register': 'إنشاء حساب',
      'home': 'الرئيسية',
      'services': 'الخدمات',
    },
    'fr': {
      'app_name': 'Servixo',
      'welcome': 'Bienvenue sur Servixo',
      'login': 'Connexion',
      'register': 'S\'inscrire',
      'home': 'Accueil',
      'services': 'Services',
    },
  };

  String translate(String key) {
    return _localizedValues[locale.languageCode]?[key] ?? key;
  }
}