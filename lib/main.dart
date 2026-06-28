import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'config/theme/app_theme.dart';
import 'core/supabase_config.dart';
import 'features/splash/presentation/splash_screen.dart';
import 'localization/app_localizations.dart';

void main() async {
  // لضمان تهيئة الـ Plugins قبل إقلاع الواجهات
  WidgetsFlutterBinding.ensureInitialized();

  try {
    // ⚡ تهيئة السيرفر والخلفية بنجاح
    await SupabaseConfig.initialize();
  } catch (e) {
    debugPrint("Supabase Initialization Error: $e");
    // نتركو التطبيق يكمل الإقلاع حتى لو لم يربط بالإنترنت لتفادي شاشة الموت البيضاء
  }

  runApp(
    // تغليف التطبيق بالـ ProviderScope لتمكين الـ Riverpod DI
    const ProviderScope(
      child: ServixoApp(),
    ),
  );
}

class ServixoApp extends StatelessWidget {
  const ServixoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Servixo',
      debugShowCheckedModeBanner: false,
      
      // 🌗 تفعيل نظام الثيمات المضيء والمظلم اللي خدمناهم
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system, // يتبع نظام الهاتف تلقائياً

      // 🌍 إعدادات نظام اللغات العالمي (العربية، الإنجليزية، الفرنسية)
      supportedLocales: const [
        Locale('en', ''),
        Locale('ar', ''),
        Locale('fr', ''),
      ],
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      // تحديد اتجاه النصوص تلقائياً حسب اللغة (RTL للعربية)
      localeResolutionCallback: (locale, supportedLocales) {
        for (var supportedLocale in supportedLocales) {
          if (supportedLocale.languageCode == locale?.languageCode) {
            return supportedLocale;
          }
        }
        return supportedLocales.first; // الإنجليزية كإصدار افتراضي
      },

      // 🏁 نقطة البداية الرسمية للتطبيق
      home: const SplashScreen(),
    );
  }
}