import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseConfig {
  SupabaseConfig._();

  // ⚠️ ملاحظة: ضع الـ Credentials الحقيقية هنا لاحقاً عندما تربط مع مشروعك
  static const String url = 'https://your-project-url.supabase.co';
  static const String anonKey = 'your-anon-public-key';

  // دالة التهيئة الرئيسية التي يتم استدعاؤها في الـ main
  static Future<void> initialize() async {
    await Supabase.initialize(
      url: url,
      anonKey: anonKey,
      authOptions: const FlutterAuthClientOptions(
        authFlowType: AuthFlowType.pkce, // لضمان أقصى درجات الأمان في الجلسات
      ),
    );
  }

  // Getter لتسهيل الوصول إلى كائن Supabase في أي مكان في الـ Repositories
  static SupabaseClient get client => Supabase.instance.client;
}