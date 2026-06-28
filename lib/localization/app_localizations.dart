import 'package:flutter/material.dart';

class AppLocalizations {
  final Locale locale;
  AppLocalizations(this.locale);

  // جلب الكلاس من الـ BuildContext بسهولة
  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  // 📂 خريطة الكلمات المترجمة (العربية، الإنجليزية، الفرنسية)
  static final Map<String, Map<String, String>> _localizedValues = {
    'en': {
      'app_name': 'Servixo',
      'welcome_title': 'Find Professional Services Globally',
      'welcome_subtitle': 'Connect with verified experts for local and online jobs instantly.',
      'get_started': 'Get Started',
      'login': 'Login',
      'register': 'Register',
    },
    'ar': {
      'app_name': 'سيرفيكسو',
      'welcome_title': 'ابحث عن الخدمات المهنية عالمياً',
      'welcome_subtitle': 'تواصل مع خبراء موثقين للخدمات المحلية وعبر الإنترنت فوراً.',
      'get_started': 'ابدأ الآن',
      'login': 'تسجيل الدخول',
      'register': 'إنشاء حساب',
    },
    'fr': {
      'app_name': 'Servixo',
      'welcome_title': 'Trouvez des Services Professionnels Globalement',
      'welcome_subtitle': 'Connectez-vous instantanément avec des experts vérifiés pour des travaux locaux et en ligne.',
      'get_started': 'Commencer',
      'login': 'Connexion',
      'register': 'S\'inscrire',
    },
  };

  // دالة لجلب النص المترجم بناءً على مفتاح الكلمة والـ Locale الحالي
  String translate(String key) {
    return _localizedValues[locale.languageCode]?[key] ?? key;
  }

  // الـ Delegate المسؤول عن تهيئة النظام في MaterialApp
  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();
}

// الـ Delegate الفرعي الداخلي للنظام
class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => ['en', 'ar', 'fr'].contains(locale.languageCode);

  @override
  Future<AppLocalizations> load(Locale locale) async {
    return AppLocalizations(locale);
  }

  @override
  bool shouldReload(LocalizationsDelegate<AppLocalizations> old) => false;
}