import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/core_providers.dart';
import 'services_repository.dart';
import '../../domain/models/category_model.dart';

// Provider الخاص بـ ServicesRepository
final servicesRepositoryProvider = Provider<ServicesRepository>((ref) {
  final supabaseClient = ref.watch(supabaseClientProvider);
  return ServicesRepository(supabaseClient);
});

// FutureProvider لجلب التصنيفات تلقائياً وتحديث الواجهة بناءً عليها
final categoriesFutureProvider = FutureProvider<List<CategoryModel>>((ref) async {
  final repository = ref.watch(servicesRepositoryProvider);
  return repository.getCategories();
});
