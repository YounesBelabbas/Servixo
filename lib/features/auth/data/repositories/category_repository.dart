import 'package:supabase_flutter/supabase_flutter.dart';
import '../../domain/models/category_model.dart';

class CategoryRepository {
  final SupabaseClient _supabase;

  CategoryRepository(this._supabase);

  // جلب جميع الفئات من قاعدة البيانات
  Future<List<CategoryModel>> getCategories() async {
    final response = await _supabase
        .from('categories')
        .select()
        .order('name', ascending: true);

    return (response as List).map((json) => CategoryModel.fromJson(json)).toList();
  }
}