import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../data/repositories/wallet_repository.dart';
import '../../domain/models/transaction_model.dart';

// 1. بروفايدر الـ Repository الأساسي
final walletRepositoryProvider = Provider<WalletRepository>((ref) {
  return WalletRepository(Supabase.instance.client);
});

// 2. بروفايدر جلب الرصيد الحالي (يتحدث تلقائياً عند الحاجة)
final walletBalanceProvider = FutureProvider<double>((ref) async {
  final repository = ref.watch(walletRepositoryProvider);
  return repository.getWalletBalance();
});

// 3. بروفايدر جلب قائمة المعاملات المالية
final walletTransactionsProvider = FutureProvider<List<TransactionModel>>((ref) async {
  final repository = ref.watch(walletRepositoryProvider);
  return repository.getTransactions();
});