import 'package:supabase_flutter/supabase_flutter.dart';
import '../../domain/models/notification_model.dart';

class NotificationRepository {
  final SupabaseClient _supabase;

  NotificationRepository(this._supabase);

  // 1. جلب قائمة الإشعارات السابقة للمستخدم
  Future<List<NotificationModel>> getNotifications() async {
    final userId = _supabase.auth.currentUser?.id;
    if (userId == null) return [];

    final response = await _supabase
        .from('notifications')
        .select()
        .eq('user_id', userId)
        .order('created_at', ascending: false);

    return (response as List).map((json) => NotificationModel.fromJson(json)).toList();
  }

  // 2. تحديث الإشعار ليصبح "مقروء" (Mark as Read)
  Future<void> markAsRead(String notificationId) async {
    await _supabase
        .from('notifications')
        .update({'is_read': true})
        .eq('id', notificationId);
  }

  // 3. الستريم الفوري للإشعارات الجديدة
  Stream<List<NotificationModel>> getNotificationStream() {
    final userId = _supabase.auth.currentUser?.id ?? '';

    return _supabase
        .from('notifications')
        .stream(primaryKey: ['id'])
        .order('created_at', ascending: false)
        .map((maps) => maps
            .map((json) => NotificationModel.fromJson(json))
            .where((notif) => notif.userId == userId)
            .toList());
  }
}