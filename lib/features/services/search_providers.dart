import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../data/repositories/search_repository.dart';
import '../domain/models/provider_model.dart';

final searchRepositoryProvider = Provider<SearchRepository>((ref) {
  return SearchRepository(Supabase.instance.client);
});

// بروفايدر الفلترة الديناميكية (يمرر الفئة والولاية كـ Parameters)
final providersSearchResultsProvider = FutureProvider.family<List<ProviderModel>, Map<String, String?>>((ref, filters) async {
  final repository = ref.watch(searchRepositoryProvider);
  return repository.searchProviders(
    category: filters['category'] ?? '',
    wilaya: filters['wilaya'],
    commune: filters['commune'],
  );
});