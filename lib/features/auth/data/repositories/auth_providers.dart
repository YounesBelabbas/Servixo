import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/core_providers.dart';
import 'auth_repository.dart';

// Provider الخاص بـ AuthRepository
final authRepositoryProvider = Provider<AuthRepository>((ref) {
  final supabaseClient = ref.watch(supabaseClientProvider);
  return AuthRepository(supabaseClient);
});

// StreamProvider لتتبع حالة تسجيل دخول المستخدم في كامل التطبيق
final authStateProvider = StreamProvider((ref) {
  final authRepo = ref.watch(authRepositoryProvider);
  return authRepo.authStateChanges;
});
