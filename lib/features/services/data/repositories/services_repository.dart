import 'package:supabase_flutter/supabase_flutter.dart';
import '../../domain/models/category_model.dart';

class ServicesRepository {
  final SupabaseClient _supabase;

  ServicesRepository(this._supabase);

  // جلب جميع التصنيفات المتوفرة من قاعدة البيانات
  Future<List<CategoryModel>> getCategories() async {
    final response = await _supabase
        .from('categories')
        .select()
        .order('name', ascending: true);

    return (response as List)
        .map((category) => CategoryModel.fromJson(category))
        .toList();
  }
}
