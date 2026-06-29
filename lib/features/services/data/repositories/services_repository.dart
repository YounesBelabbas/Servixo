import 'package:supabase_flutter/supabase_flutter.dart';
import '../../domain/models/provider_model.dart';

class SearchRepository {
  final SupabaseClient _supabase;

  SearchRepository(this._supabase);

  // البحث عن الحرفيين حسب الفئة، الولاية، أو البلدية
  Future<List<ProviderModel>> searchProviders({
    required String category,
    String? wilaya,
    String? commune,
  }) async {
    var query = _supabase
        .from('providers')
        .select()
        .eq('category_name', category)
        .eq('is_available', true);

    // فلترة اختيارية حسب الولاية والبلدية في الجزائر
    if (wilaya != null && wilaya.isNotEmpty) {
      query = query.eq('wilaya', wilaya);
    }
    if (commune != null && commune.isNotEmpty) {
      query = query.eq('commune', commune);
    }

    final response = await query.order('rating_average', ascending: false);
    
    return (response as List).map((json) => ProviderModel.fromJson(json)).toList();
  }
}
