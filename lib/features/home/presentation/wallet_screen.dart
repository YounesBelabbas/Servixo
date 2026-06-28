import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../config/theme/app_colors.dart';
import 'wallet_providers.dart';

class WalletScreen extends ConsumerWidget {
  const WalletScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // مراقبة الرصيد والمعاملات من الـ Providers
    final balanceAsync = ref.watch(walletBalanceProvider);
    final transactionsAsync = ref.watch(walletTransactionsProvider);
    final walletRepo = ref.watch(walletRepositoryProvider);

    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'محفظتي الرقمية',
          style: TextStyle(fontWeight: FontWeight.bold, color: AppColors.textPrimaryLight),
        ),
        centerTitle: true,
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          // إعادة جلب البيانات عند السحب للأسفل
          ref.invalidate(walletBalanceProvider);
          ref.invalidate(walletTransactionsProvider);
        },
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 1. كارت المحفظة الديناميكي
              Container(
                width: double.infinity,
                height: 200,
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [AppColors.primary, Color(0xFF1A237E)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.primary.withOpacity(0.3),
                      blurRadius: 15,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.between,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.between,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'الرصيد المتاح',
                              style: TextStyle(color: Colors.white.withOpacity(0.8), fontSize: 14),
                            ),
                            const SizedBox(height: 4),
                            balanceAsync.when(
                              loading: () => const SizedBox(
                                width: 30,
                                height: 30,
                                child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2),
                              ),
                              error: (err, stack) => const Text('خطأ', style: TextStyle(color: Colors.white)),
                              data: (balance) => Text(
                                '${balance.toStringAsFixed(2)} دج',
                                style: const TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                        const Icon(Icons.account_balance_wallet, color: Colors.white, size: 36),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.between,
                      children: [
                        Text(
                          '**** **** **** 4321',
                          style: TextStyle(color: Colors.white.withOpacity(0.9), fontSize: 16, letterSpacing: 2),
                        ),
                        Text(
                          'SERVIXO PAY',
                          style: TextStyle(color: Colors.white.withOpacity(0.6), fontSize: 12, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // 2. أزرار العمليات السريعة (شحن / سحب تجريبي)
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: AppColors.primary,
                        elevation: 0,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                          side: const BorderSide(color: AppColors.primary, width: 1),
                        ),
                      ),
                      icon: const Icon(Icons.add_circle_outline),
                      label: const Text('شحن الرصيد', style: TextStyle(fontWeight: FontWeight.bold)),
                      onPressed: () async {
                        // شحن تجريبي بـ 1000 دج للتأكد من عمل السوبابيس
                        await walletRepo.updateBalance(
                          amount: 1000,
                          type: 'deposit',
                          description: 'شحن حساب تجريبي',
                        );
                        ref.invalidate(walletBalanceProvider);
                        ref.invalidate(walletTransactionsProvider);
                      },
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        foregroundColor: Colors.white,
                        elevation: 0,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      ),
                      icon: const Icon(Icons.arrow_circle_down_outlined),
                      label: const Text('سحب الأموال', style: TextStyle(fontWeight: FontWeight.bold)),
                      onPressed: () async {
                        // سحب تجريبي بـ 500 دج
                        await walletRepo.updateBalance(
                          amount: 500,
                          type: 'withdrawal',
                          description: 'سحب رصيد تجريبي',
                        );
                        ref.invalidate(walletBalanceProvider);
                        ref.invalidate(walletTransactionsProvider);
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),

              // 3. قائمة المعاملات الحقيقية من السيرفر
              const Text(
                'آخر المعاملات المالية',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.textPrimaryLight),
              ),
              const SizedBox(height: 12),

              transactionsAsync.when(
                loading: () => const Center(child: CircularProgressIndicator(color: AppColors.primary)),
                error: (err, stack) => const Center(child: Text('خطأ في جلب المعاملات المالية')),
                data: (transactions) {
                  if (transactions.isEmpty) {
                    return const Center(
                      child: Padding(
                        padding: EdgeInsets.all(24.0),
                        child: Text('لا توجد معاملات مالية حالياً', style: TextStyle(color: AppColors.grey500)),
                      ),
                    );
                  }
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: transactions.length,
                    itemBuilder: (context, index) {
                      final tx = transactions[index];
                      final isDeposit = tx.type == 'deposit';

                      return Container(
                        margin: const EdgeInsets.only(bottom: 12),
                        padding: const EdgeInsets.all(14),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.between,
                          children: [
                            Row(
                              children: [
                                CircleAvatar(
                                  backgroundColor: isDeposit ? Colors.green.withOpacity(0.1) : Colors.red.withOpacity(0.1),
                                  child: Icon(
                                    isDeposit ? Icons.arrow_downward : Icons.arrow_upward,
                                    color: isDeposit ? Colors.green : Colors.red,
                                  ),
                                ),
                                const SizedBox(width: 14),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      tx.description,
                                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      tx.createdAt.toString().substring(0, 10),
                                      style: const TextStyle(fontSize: 11, color: Colors.grey),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Text(
                              '${isDeposit ? '+' : '-'}${tx.amount.toStringAsFixed(0)} دج',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                color: isDeposit ? Colors.green : Colors.red,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}