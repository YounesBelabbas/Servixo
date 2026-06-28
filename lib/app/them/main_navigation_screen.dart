import 'package:flutter/material.dart';
import '../config/theme/app_colors.dart';
import '../features/home/presentation/home_base_screen.dart';
import '../features/services/presentation/services_screen.dart';
import '../features/wallet/presentation/wallet_screen.dart';
import '../features/profile/presentation/profile_screen.dart';

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _currentIndex = 0;

  // قائمة الشاشات المرتبطة بالقائمة السفلية
  final List<Widget> _screens = const [
    HomeBaseScreen(),
    ServicesScreen(),
    WalletScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _screens, // استخدام IndexedStack للحفاظ على حالة الشاشات أثناء التنقل
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppColors.primary,
        unselectedItemColor: AppColors.grey600,
        backgroundColor: Colors.white,
        showUnselectedLabels: true,
        selectedFontSize: 12,
        unselectedFontSize: 12,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: 'الرئيسية',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.design_services_outlined),
            activeIcon: Icon(Icons.design_services),
            label: 'الخدمات',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance_wallet_outlined),
            activeIcon: Icon(Icons.account_balance_wallet),
            label: 'المحفظة',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            activeIcon: Icon(Icons.person),
            label: 'حسابي',
          ),
        ],
      ),
    );
  }
}
