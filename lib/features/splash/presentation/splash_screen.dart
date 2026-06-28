import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../config/theme/app_colors.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
 @override
void initState() {
    super.initState();
    
    // إعداد الـ AnimationController للتحكم في وقت الفيد (Fade Duration)
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeIn),
    );

    _animationController.forward();

    // محاكاة وقت التهيئة والانتقال إلى الصفحة التالية (مثلاً صفحة الـ Auth لاحقاً)
    _navigateToNext();
  }

  Future<void> _navigateToNext() async {
    await Future.delayed(const Duration(seconds: 3));
    if (mounted) {
      // ضرك بما أننا مازال ما درناش الـ Routing الكامل لصفحة الـ Auth، نخلوها فارغة أو تطبع رسالة
      debugPrint("Navigate to Authentication Screen");
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundLight, // يتوافق مع الثيم
      body: Center(
        child: FadeTransition(
          opacity: _fadeAnimation,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // 🖼️ مكان اللوغو المطلوب في الوصف
              Image.asset(
                'assets/images/app_logo.png',
                width: 160,
                height: 160,
                errorBuilder: (context, error, stackTrace) {
                  // إذا اللوغو مش محطوط ضرك، يعرض أيقونة افتراضية باش ما يتكراش التطبيق
                  return const Icon(
                    Icons.hive_rounded,
                    size: 100,
                    color: AppColors.primary,
                  );
                },
              ),
              const SizedBox(height: 24),
              // اسم التطبيق بهوية الألوان
              const Text(
                'SERVIXO',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primary,
                  letterSpacing: 2.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}