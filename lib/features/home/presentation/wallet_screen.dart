import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../config/theme/app_colors.dart';

class WalletScreen extends ConsumerWidget {
  const WalletScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. كارت المحفظة البنكي (Digital Visa Card Style)
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
                          const Text(
                            '4,500 دج',
                            style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold),
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

            // 2. أزرار العمليات السريعة (شحن / سحب)
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
                    onPressed: () {},
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
                    onPressed: () {},
                  ),
                ),
              ],
            ),
            const SizedBox(height: 32),

            // 3. عنوان قائمة المعاملات الأخيرة
            const Text(
              'آخر المعاملات المالية',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.textPrimaryLight),
            ),
            const SizedBox(height: 12),

            // 4. قائمة المعاملات (تاريخ مالي افتراضي)
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 3,
              itemBuilder: (context, index) {
                final isDeposit = index == 1; // جعل وحدة شحن والباقي دفع
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
                                isDeposit ? 'شحن المحفظة (بريدي ماب)' : index == 0 ? 'دفع مقابل خدمة سباكة' : 'دفع مقابل تصليح كهرباء',
                                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                isDeposit ? '25 جوان 2026' : '20 جوان 2026',
                                style: const TextStyle(fontSize: 11, color: Colors.grey),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Text(
                        isDeposit ? '+2,000 دج' : index == 0 ? '-1,500 دج' : '-1,200 دج',
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
            ),
          ],
        ),
      ),
    );
  }
}