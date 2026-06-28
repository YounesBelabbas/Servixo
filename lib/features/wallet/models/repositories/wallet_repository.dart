import 'package:supabase_flutter/supabase_flutter.dart';
import '../../domain/models/transaction_model.dart';

class WalletRepository {
  final SupabaseClient _supabase;

  WalletRepository(this._supabase);

  // 1. جلب رصيد المحفظة الحالي
  Future<double> getWalletBalance() async {
    final userId = _supabase.auth.currentUser?.id;
    if (userId == null) return 0.0;

    final response = await _supabase
        .from('wallets')
        .select('balance')
        .eq('id', userId)
        .maybeSingle();

    if (response == null) return 0.0;
    return (response['balance'] as num).toDouble();
  }

  // 2. جلب قائمة المعاملات الأخيرة للمستخدم
  Future<List<TransactionModel>> getTransactions() async {
    final userId = _supabase.auth.currentUser?.id;
    if (userId == null) return [];

    final response = await _supabase
        .from('transactions')
        .select()
        .eq('wallet_id', userId)
        .order('created_at', ascending: false);

    return (response as List).map((json) => TransactionModel.fromJson(json)).toList();
  }

  // 3. إضافة معاملة جديدة وتحديث الرصيد (شحن أو سحب)
  Future<void> updateBalance({required double amount, required String type, required String description}) async {
    final userId = _supabase.auth.currentUser?.id;
    if (userId == null) return;

    // جلب الرصيد الحالي أولاً
    final currentBalance = await getWalletBalance();
    final newBalance = type == 'deposit' ? currentBalance + amount : currentBalance - amount;

    // تحديث جدول المحفظة
    await _supabase.from('wallets').upsert({
      'id': userId,
      'balance': newBalance,
      'updated_at': DateTime.now().toIso8601String(),
    });

    // تسجيل المعاملة في جدول المعاملات
    await _supabase.from('transactions').insert({
      'wallet_id': userId,
      'amount': amount,
      'type': type,
      'description': description,
    });
  }
}