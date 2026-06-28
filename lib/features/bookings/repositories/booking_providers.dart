import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../data/repositories/booking_repository.dart';
import '../domain/models/booking_model.dart';

// بروفايدر الـ Repository
final bookingRepositoryProvider = Provider<BookingRepository>((ref) {
  return BookingRepository(Supabase.instance.client);
});

// بروفايدر جلب قائمة الحجوزات
final customerBookingsProvider = FutureProvider<List<BookingModel>>((ref) async {
  final repository = ref.watch(bookingRepositoryProvider);
  return repository.getCustomerBookings();
});