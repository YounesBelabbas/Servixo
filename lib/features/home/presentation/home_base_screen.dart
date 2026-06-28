import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../config/theme/app_colors.dart';
import '../../services/data/repositories/services_providers.dart';

class HomeBaseScreen extends ConsumerWidget {
  const HomeBaseScreen({super.key});

  IconData _getIconData(String iconName) {
    switch (iconName) {
      case 'bolt': return Icons.bolt;
      case 'plumbing': return Icons.plumbing;
      case 'cleaning_services': return Icons.cleaning_services;
      case 'computer': return Icons.computer;
      default: return Icons.category_outlined;
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categoriesAsync = ref.watch(categoriesFutureProvider);

    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            const CircleAvatar(
              backgroundColor: AppColors.grey200,
              child: Icon(Icons.person, color: AppColors.primary),
            ),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Welcome',
                  style: TextStyle(fontSize: 12, color: AppColors.grey600),
                ),
                Text(
                  'يا خويا العزيز',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: AppColors.textPrimaryLight),
                ),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none_rounded, color: AppColors.textPrimaryLight),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. البانر الإعلاني
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [AppColors.primary, Color(0xFF3F51B5)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'تخفيض 20% على أول خدمة!',
                    style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'احجز الآن أفضل المحترفين في منطقتك بكل سهولة وأمان.',
                    style: TextStyle(color: Colors.white.withOpacity(0.9), fontSize: 13),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // 2. قسم التصنيفات الرئيسية
            Row(
              mainAxisAlignment: MainAxisAlignment.between,
              children: [
                const Text(
                  'التصنيفات الرئيسية',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.textPrimaryLight),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text('رؤية الكل', style: TextStyle(color: AppColors.secondary)),
                ),
              ],
            ),
            const SizedBox(height: 12),

            categoriesAsync.when(
              loading: () => const SizedBox(
                height: 90,
                child: Center(child: CircularProgressIndicator(color: AppColors.primary)),
              ),
              error: (err, stack) => const SizedBox(
                height: 90,
                child: Center(child: Text('خطأ في جلب البيانات', style: TextStyle(color: Colors.red))),
              ),
              data: (categoriesList) {
                if (categoriesList.isEmpty) {
                  return const SizedBox(
                    height: 90,
                    child: Center(child: Text('لا توجد تصنيفات حالياً')),
                  );
                }
                return SizedBox(
                  height: 90,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: categoriesList.length,
                    itemBuilder: (context, index) {
                      final category = categoriesList[index];
                      return Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: Column(
                          children: [
                            CircleAvatar(
                              radius: 28,
                              backgroundColor: AppColors.primary.withOpacity(0.1),
                              child: Icon(_getIconData(category.iconName), color: AppColors.primary, size: 26),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              category.name,
                              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                );
              },
            ),
            const SizedBox(height: 24),

            // 3. أعلى المحترفين تقييماً
            const Text(
              'أعلى المحترفين تقييماً',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.textPrimaryLight),
            ),
            const SizedBox(height: 12),

            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 3,
              itemBuilder: (context, index) {
                return Card(
                  margin: const EdgeInsets.only(bottom: 16),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  elevation: 0,
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      children: [
                        Container(
                          width: 70,
                          height: 70,
                          decoration: BoxDecoration(
                            color: AppColors.grey200,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Icon(Icons.construction, color: AppColors.grey600),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                index == 0 ? 'أحمد محمد (ميكانيكي)' : index == 1 ? 'ياسين بلعباس (كهربائي)' : 'صالح علي (سباك)',
                                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                              ),
                              const SizedBox(height: 4),
                              Row(
                                children: const [
                                  Icon(Icons.star, color: AppColors.warning, size: 16),
                                  SizedBox(width: 4),
                                  Text('4.9 (45 مراجعة)', style: TextStyle(fontSize: 12, color: AppColors.grey600)),
                                ],
                              ),
                              const SizedBox(height: 4),
                              const Text('السعر التقديري: 1500 دج/ساعة', style: TextStyle(fontSize: 12, color: AppColors.primary, fontWeight: FontWeight.w600)),
                            ],
                          ),
                        ),
                      ],
                    ),
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