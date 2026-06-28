import 'package:supabase_flutter/supabase_flutter.dart';
import '../../domain/models/booking_model.dart';

class BookingRepository {
  final SupabaseClient _supabase;

  BookingRepository(this._supabase);

  // 1. جلب قائمة الحجوزات الخاصة بالمستخدم الحالي
  Future<List<BookingModel>> getCustomerBookings() async {
    final userId = _supabase.auth.currentUser?.id;
    if (userId == null) return [];

    final response = await _supabase
        .from('bookings')
        .select()
        .eq('customer_id', userId)
        .order('created_at', ascending: false);

    return (response as List).map((json) => BookingModel.fromJson(json)).toList();
  }

  // 2. إنشاء حجز جديد لخدمة معينة
  Future<void> createBooking({
    required String providerId,
    required String serviceId,
    required DateTime bookingDate,
    required double totalPrice,
  }) async {
    final userId = _supabase.auth.currentUser?.id;
    if (userId == null) throw Exception('User not authenticated');

    await _supabase.from('bookings').insert({
      'customer_id': userId,
      'provider_id': providerId,
      'service_id': serviceId,
      'status': 'pending',
      'booking_date': bookingDate.toIso8601String(),
      'total_price': totalPrice,
    });
  }

  // 3. تحديث حالة الحجز (قبول، إلغاء، إكمال)
  Future<void> updateBookingStatus(String bookingId, String newStatus) async {
    await _supabase
        .from('bookings')
        .update({'status': newStatus})
        .eq('id', bookingId);
  }
}