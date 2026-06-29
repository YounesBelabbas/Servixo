import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../repositories/onboarding_repository.dart';

final onboardingRepositoryProvider = Provider<OnboardingRepository>((ref) {
  return OnboardingRepository();
});

// بروفايدر لمعرفة حالة المستخدم الحالية عند فتح التطبيق
final isFirstTimeProvider = Provider<bool>((ref) {
  final repository = ref.watch(onboardingRepositoryProvider);
  return repository.isFirstTimeUser();
});
