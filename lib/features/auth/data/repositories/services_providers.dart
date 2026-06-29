import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../repositories/category_repository.dart';
import '../domain/models/category_model.dart';

final categoryRepositoryProvider = Provider<CategoryRepository>((ref) {
  return CategoryRepository(Supabase.instance.client);
});

// بروفايدر جلب الفئات لاستعماله مباشرة في شاشة الرئيسية والخدمات (FutureProvider)
final categoriesListProvider = FutureProvider<List<CategoryModel>>((ref) async {
  final repository = ref.watch(categoryRepositoryProvider);
  return repository.getCategories();
});