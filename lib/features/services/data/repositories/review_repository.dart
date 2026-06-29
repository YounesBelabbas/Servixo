import 'package:supabase_flutter/supabase_flutter.dart';
import '../../domain/models/review_model.dart';

class ReviewRepository {
  final SupabaseClient _supabase;

  ReviewRepository(this._supabase);

  // 1. جلب تقييمات حرفي معين
  Future<List<ReviewModel>> getProviderReviews(String providerId) async {
    final response = await _supabase
        .from('reviews')
        .select()
        .eq('provider_id', providerId)
        .order('created_at', ascending: false);

    return (response as List).map((json) => ReviewModel.fromJson(json)).toList();
  }

  // 2. إضافة تقييم جديد لحرفي بعد انتهاء الخدمة
  Future<void> addReview({
    required String providerId,
    required double rating,
    required String comment,
  }) async {
    final userId = _supabase.auth.currentUser?.id;
    if (userId == null) throw Exception('User not authenticated');

    await _supabase.from('reviews').insert({
      'customer_id': userId,
      'provider_id': providerId,
      'rating': rating,
      'comment': comment,
    });
  }

  // 3. إضافة أو حذف حرفي من المفضلة (Toggle Favorite)
  Future<void> toggleFavorite(String providerId, bool isFavorite) async {
    final userId = _supabase.auth.currentUser?.id;
    if (userId == null) return;

    if (isFavorite) {
      await _supabase.from('favorites').insert({
        'user_id': userId,
        'provider_id': providerId,
      });
    } else {
      await _supabase.from('favorites')
          .delete()
          .eq('user_id', userId)
          .eq('provider_id', providerId);
    }
  }
}