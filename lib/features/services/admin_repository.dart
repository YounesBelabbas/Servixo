import 'package:supabase_flutter/supabase_flutter.dart';
import '../../../services/domain/models/provider_model.dart';

class AdminRepository {
  final SupabaseClient _supabase;

  AdminRepository(this._supabase);

  // 1. جلب قائمة كل الحرفيين المعتمدين أو المنتظرين للمراجعة
  Future<List<ProviderModel>> getAllProviders() async {
    final response = await _supabase
        .from('providers')
        .select()
        .order('created_at', ascending: false);

    return (response as List).map((json) => ProviderModel.fromJson(json)).toList();
  }

  // 2. تحديث حالة توفر الحرفي أو حظره/تفعيله (Approve / Ban)
  Future<void> toggleProviderStatus(String providerId, bool isAvailable) async {
    await _supabase
        .from('providers')
        .update({'is_available': isAvailable})
        .eq('id', providerId);
  }
}