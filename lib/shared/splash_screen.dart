
import 'dart:async';
import 'package:flutter/material';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
void initState() {
    super.initState();
    // هنا نحدد وقت الانتظار (3 ثوانٍ) ثم الانتقال للشاشة التالية
    Timer(const Duration(seconds: 3), () {
      // مؤقتاً سنتركه يذهب للشاشة البيضاء السابقة لنتأكد من عمله
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const Scaffold(
            body: Center(child: Text("Servixo Architecture Ready! 🚀")),
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // لون الخلفية الأزرق الداكن الفخم
      backgroundColor: const Color(0xFF0F172A), 
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // تصميم شعار مؤقت شبابي بالدائرة وأيقونة الخدمات
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.blueAccent.withOpacity(0.1),
                shape: BoxShape.circle,
                border: Border.all(color: Colors.blueAccent, width: 2),
              ),
              child: const Icon(
                Icons.home_repair_service_rounded, // أيقونة تعبر عن الخدمات
                size: 80,
                color: Colors.blueAccent,
              ),
            ),
            const SizedBox(height: 24),
            // اسم التطبيق بخط عريض وأنيق
            const Text(
              "SERVIXO",
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                letterSpacing: 3,
              ),
            ),
            const SizedBox(height: 😎,
            // شعار فرعي صغير
            Text(
              "Your Service Hub",
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[400],
                letterSpacing: 1,
              ),
            ),
            const SizedBox(height: 48),
            // مؤشر تحميل أنيق ومتناسق مع الألوان
            const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.blueAccent),
            ),
          ],
        ),
      ),
    );
  }
}
