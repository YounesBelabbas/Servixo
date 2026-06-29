import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../data/repositories/admin_repository.dart';
import '../../../services/domain/models/provider_model.dart';

final adminRepositoryProvider = Provider<AdminRepository>((ref) {
  return AdminRepository(Supabase.instance.client);
});

// بروفايدر جلب الحرفيين للإدارة
final adminProvidersListProvider = FutureProvider<List<ProviderModel>>((ref) async {
  final repository = ref.watch(adminRepositoryProvider);
  return repository.getAllProviders();
});