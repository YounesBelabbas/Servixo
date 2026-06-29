import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'location_service.dart';
import 'package:geolocator/geolocator.dart';

final locationServiceProvider = Provider<LocationService>((ref) {
  return LocationService();
});

// بروفايدر جلب إحداثيات الموقع الحالي ديناميكياً
final currentUserLocationProvider = FutureProvider<Position?>((ref) async {
  final service = ref.watch(locationServiceProvider);
  return service.getCurrentLocation();
});