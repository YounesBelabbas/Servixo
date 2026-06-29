import 'package:hive_flutter/hive_flutter.dart';

class OnboardingRepository {
  static const String _boxName = 'settingsBox';
  static const String _keyFirstTime = 'isFirstTime';

  // التحقق هل هذه أول مرة يفتح فيها المستخدم التطبيق؟
  bool isFirstTimeUser() {
    final box = Hive.box(_boxName);
    return box.get(_keyFirstTime, defaultValue: true);
  }

  // حفظ أن المستخدم أتم رؤية شاشات الترحيب
  Future<void> setOnboardingCompleted() async {
    final box = Hive.box(_boxName);
    await box.put(_keyFirstTime, false);
  }
}