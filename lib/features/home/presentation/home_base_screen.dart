import 'package:flutter/material.dart';
import '../../../config/theme/app_colors.dart';

class HomeBaseScreen extends StatelessWidget {
  const HomeBaseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // قائمة تجريبية للتصنيفات
    final List<Map<String, dynamic>> categories = [
      {'icon': Icons.bolt, 'label': 'كهرباء'},
      {'icon': Icons.plumbing, 'label': 'سباكة'},
      {'icon': Icons.cleaning_services, 'label': 'تنظيف'},
      {'icon': Icons.computer, 'label': 'برمجة'},
      {'icon': Icons.format_paint, 'label': 'طلاء'},
    ];

    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      appBar: AppBar(
        automaticallyImplyLeading: false, // نزع سهم العودة الافتراضي
        title: Row(
          children: [
            const CircleAvatar(
              backgroundColor: AppColors.grey200,
              child: Icon(Icons.person, color: AppColors.primary),
            ),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'مرحباً بك 👋',
                  style: TextStyle(fontSize: 12, color: AppColors.grey600),
                ),
                const Text(
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
            // 1. البانر الإعلاني (Promo Banner)
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
                  const SizedBox(height: 😎,
                  Text(
                    'احجز الآن أفضل المحترفين في منطقتك بكل سهولة وأمان.',
                    style: TextStyle(color: Colors.white.withOpacity(0.9), fontSize: 13),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // 2. عنوان قسم التصنيفات
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

            // قائمة أفقية للتصنيفات
            SizedBox(
              height: 90,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 28,
                          backgroundColor: AppColors.primary.withOpacity(0.1),
                          child: Icon(categories[index]['icon'], color: AppColors.primary, size: 26),
                        ),
                        const SizedBox(height: 😎,
                        Text(
                          categories[index]['label'],
                          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 24),

            // 3. عنوان مقدمي الخدمات المقترحين
            const Text(
              'أعلى المحترفين تقييماً',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.textPrimaryLight),
            ),
            const SizedBox(height: 12),

            // كروت مقدمي الخدمات (قائمة عمودية مدمجة)
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
                            borderRadius: BorderRadius.circular(😎,
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
                                children: [
                                  const Icon(Icons.star, color: AppColors.warning, size: 16),
                                  const SizedBox(width: 4),
                                  Text('4.9 (45 مراجعة)', style: TextStyle(fontSize: 12, color: AppColors.grey600)),
                                ],
                              ),
                              const SizedBox(height: 4),
                              Text('السعر التقديري: 1500 دج/ساعة', style: TextStyle(fontSize: 12, color: AppColors.primary, fontWeight: FontWeight.w600)),
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