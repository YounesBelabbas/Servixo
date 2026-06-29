import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../data/repositories/notification_repository.dart';
import '../domain/models/notification_model.dart';

final notificationRepositoryProvider = Provider<NotificationRepository>((ref) {
  return NotificationRepository(Supabase.instance.client);
});

// بروفايدر الـ Stream للاستماع المباشر للإشعارات وتحديث الـ UI فوراً
final notificationStreamProvider = StreamProvider<List<NotificationModel>>((ref) {
  final repository = ref.watch(notificationRepositoryProvider);
  return repository.getNotificationStream();
});