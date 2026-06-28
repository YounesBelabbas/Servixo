import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../config/theme/app_colors.dart';
import '../data/repositories/services_providers.dart';

class ServicesScreen extends ConsumerWidget {
  const ServicesScreen({super.key});

  // دالة تحويل المسميات لأيقونات
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
        title: const Text(
          'جميع الخدمات والتصنيفات',
          style: TextStyle(fontWeight: FontWeight.bold, color: AppColors.textPrimaryLight),
        ),
        centerTitle: true,
      ),
      body: categoriesAsync.when(
        loading: () => const Center(child: CircularProgressIndicator(color: AppColors.primary)),
        error: (err, stack) => Center(child: Text('خطأ في جلب الخدمات: $err', style: const TextStyle(color: Colors.red))),
        data: (categoriesList) {
          if (categoriesList.isEmpty) {
            return const Center(child: Text('لا توجد خدمات متاحة حالياً.'));
          }

          return GridView.builder(
            padding: const EdgeInsets.all(16.0),
            itemCount: categoriesList.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // عرض كرتين في كل سطر
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 1.1, // أبعاد الكرت
            ),
            itemBuilder: (context, index) {
              final category = categoriesList[index];
              return InkWell(
                onTap: () {
                  // لاحقاً: الانتقال لصفحة مقدمي هذه الخدمة بالتحديد
                },
                borderRadius: BorderRadius.circular(16),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.04),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: AppColors.primary.withOpacity(0.1),
                        child: Icon(_getIconData(category.iconName), color: AppColors.primary, size: 30),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        category.name,
                        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: AppColors.textPrimaryLight),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}