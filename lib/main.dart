import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'config/theme/app_theme.dart';
import 'features/home/presentation/main_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // إذا عندك إعدادات السوبابيس أو الـ Hive تقدر تخليهم هنا
  // await Supabase.initialize(...);

  runApp(
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
      
      // نظام الثيمات المضيء والمظلم المجهّز سابقاً
      theme: AppTheme.lightTheme,
      
      // جعل شاشة التنقل الرئيسية هي الواجهة الأولى للتطبيق
      home: const MainScreen(),
    );
  }
}