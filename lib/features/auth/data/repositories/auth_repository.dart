import 'package:supabase_flutter/supabase_flutter.dart';
import '../../domain/models/user_model.dart';

class AuthRepository {
  final SupabaseClient _supabase;

  AuthRepository(this._supabase);

  // 1. تسجيل الدخول
  Future<AuthResponse> signIn({required String email, required String password}) async {
    return await _supabase.auth.signInWithPassword(email: email, password: password);
  }

  // 2. إنشاء حساب جديد (زبون أو حرفي)
  Future<void> signUp({
    required String email,
    required String password,
    required String fullName,
    required String userType, // 'customer' أو 'provider'
  }) async {
    final response = await _supabase.auth.signUp(email: email, password: password);
    final userId = response.user?.id;

    if (userId != null) {
      // حفظ بيانات المستخدم الإضافية في جدول profiles داخل قاعدة البيانات
      await _supabase.from('profiles').insert({
        'id': userId,
        'email': email,
        'full_name': fullName,
        'user_type': userType,
      });
    }
  }

  // 3. تسجيل الخروج
  Future<void> signOut() async {
    await _supabase.auth.signOut();
  }
}