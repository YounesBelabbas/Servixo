import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../data/repositories/profile_repository.dart';
import '../domain/models/profile_model.dart';

final profileRepositoryProvider = Provider<ProfileRepository>((ref) {
  return ProfileRepository(Supabase.instance.client);
});

// بروفايدر جلب بيانات المستخدم الحالي لعرضها في شاشة الإعدادات والبروفايل
final currentProfileProvider = FutureProvider<ProfileModel?>((ref) async {
  final repository = ref.watch(profileRepositoryProvider);
  return repository.getCurrentProfile();
});