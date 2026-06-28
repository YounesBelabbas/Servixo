import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../config/theme/app_colors.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'الحساب الشخصي',
          style: TextStyle(fontWeight: FontWeight.bold, color: AppColors.textPrimaryLight),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(height: 16),
            // 1. صورة المستخدم والمعلومات الأساسية
            Center(
              child: Column(
                children: [
                  Stack(
                    children: [
                      CircleAvatar(
                        radius: 50,
                        backgroundColor: AppColors.primary.withOpacity(0.1),
                        child: const Icon(Icons.person, size: 50, color: AppColors.primary),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: CircleAvatar(
                          radius: 16,
                          backgroundColor: AppColors.primary,
                          child: const Icon(Icons.edit, size: 16, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'يا خويا العزيز',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: AppColors.textPrimaryLight),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    'user@example.com',
                    style: TextStyle(fontSize: 14, color: AppColors.grey600),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),

            // 2. قائمة الخيارات والإعدادات
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: [
                  _buildProfileTile(
                    icon: Icons.person_outline,
                    title: 'تعديل الملف الشخصي',
                    onTap: () {},
                  ),
                  const Divider(height: 1, indent: 50),
                  _buildProfileTile(
                    icon: Icons.notifications_none_outlined,
                    title: 'إعدادات الإشعارات',
                    onTap: () {},
                  ),
                  const Divider(height: 1, indent: 50),
                  _buildProfileTile(
                    icon: Icons.security_outlined,
                    title: 'الأمان وكلمة المرور',
                    onTap: () {},
                  ),
                  const Divider(height: 1, indent: 50),
                  _buildProfileTile(
                    icon: Icons.help_outline,
                    title: 'الدعم والمساعدة',
                    onTap: () {},
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // 3. زر تسجيل الخروج
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: _buildProfileTile(
                icon: Icons.logout,
                title: 'تسجيل الخروج',
                iconColor: Colors.red,
                textColor: Colors.red,
                onTap: () {
                  // لاحقاً: استدعاء دالة تسجيل الخروج من السوبابيس
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileTile({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
    Color iconColor = AppColors.primary,
    Color textColor = AppColors.textPrimaryLight,
  }) {
    return ListTile(
      leading: Icon(icon, color: iconColor),
      title: Text(
        title,
        style: TextStyle(fontWeight: FontWeight.w600, color: textColor, fontSize: 15),
      ),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: AppColors.grey400),
      onTap: onTap,
    );
  }
}