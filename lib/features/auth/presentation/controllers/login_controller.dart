import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/repositories/auth_repository.dart';
import '../../data/repositories/auth_providers.dart';

// كلاس إدارة حالة واجهة تسجيل الدخول (AsyncValue يساعدنا في إدارة الـ Loading والـ Errors تلقائياً)
class LoginController extends StateNotifier<AsyncValue<void>> {
  final AuthRepository _authRepository;

  LoginController(this._authRepository) : super(const AsyncValue.data(null));

  Future<bool> login(String email, String password) async {
    state = const AsyncValue.loading();
    try {
      await _authRepository.signInWithEmail(email: email, password: password);
      state = const AsyncValue.data(null);
      return true; // نجاح تسجيل الدخول
    } catch (e, stack) {
      state = AsyncValue.error(e, stack);
      return false; // فشل تسجيل الدخول
    }
  }
}

// Provider الخاص بالـ Controller لكي نستهلكه في شاشة الـ Login
final loginControllerProvider = StateNotifierProvider<LoginController, AsyncValue<void>>((ref) {
  final authRepo = ref.watch(authRepositoryProvider);
  return LoginController(authRepo);
});
