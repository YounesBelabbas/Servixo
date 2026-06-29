import 'package:supabase_flutter/supabase_flutter.dart';
import '../../domain/models/profile_model.dart';

class ProfileRepository {
  final SupabaseClient _supabase;

  ProfileRepository(this._supabase);

  // 1. جلب بيانات البروفايل للمستخدم الحالي
  Future<ProfileModel?> getCurrentProfile() async {
    final userId = _supabase.auth.currentUser?.id;
    if (userId == null) return null;

    final response = await _supabase
        .from('profiles')
        .select()
        .eq('id', userId)
        .single();

    return ProfileModel.fromJson(response);
  }

  // 2. تحديث بيانات البروفايل (الاسم ورقم الهاتف)
  Future<void> updateProfile({required String fullName, String? phoneNumber}) async {
    final userId = _supabase.auth.currentUser?.id;
    if (userId == null) return;

    await _supabase.from('profiles').update({
      'full_name': fullName,
      'phone_number': phoneNumber,
    }).eq('id', userId);
  }
}
