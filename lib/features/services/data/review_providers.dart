import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../data/repositories/review_repository.dart';
import '../domain/models/review_model.dart';

final reviewRepositoryProvider = Provider<ReviewRepository>((ref) {
  return ReviewRepository(Supabase.instance.client);
});

// بروفايدر جلب التقييمات الخاص بحرفي معين
final providerReviewsProvider = FutureProvider.family<List<ReviewModel>, String>((ref, providerId) async {
  final repository = ref.watch(reviewRepositoryProvider);
  return repository.getProviderReviews(providerId);
});
