import 'package:supabase_flutter/supabase_flutter.dart';
import '../../domain/models/user_model.dart';

class AuthRepository {
  final SupabaseClient _supabase;

  AuthRepository(this._supabase);

  // 1. دالة إنشاء حساب جديد (Email & Password)
  Future<AuthResponse> signUpWithEmail({
    required String email,
    required String password,
    required String fullName,
  }) async {
    return await _supabase.auth.signUp(
      email: email,
      password: password,
      data: {
        'full_name': fullName,
      },
    );
  }

  // 2. دالة تسجيل الدخول
  Future<AuthResponse> signInWithEmail({
    required String email,
    required String password,
  }) async {
    return await _supabase.auth.signInWithPassword(
      email: email,
      password: password,
    );
  }

  // 3. دالة تسجيل الخروج
  Future<void> signOut() async {
    await _supabase.auth.signOut();
  }

  // 4. جلب بيانات ملف المستخدم الحالي من جدول الـ profiles
  Future<UserModel?> getCurrentUserProfile() async {
    final user = _supabase.auth.currentUser;
    if (user == null) return null;

    final data = await _supabase
        .from('profiles')
        .select()
        .eq('id', user.id)
        .single();

    return UserModel.fromJson(data);
  }

  // 5. تتبع حالة المستخدم الحالية (مُسجل أو لا) بشكل حي ومباشر Stream
  Stream<AuthState> get authStateChanges => _supabase.auth.onAuthStateChange;
}