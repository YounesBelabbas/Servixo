import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/repositories/auth_repository.dart';
import '../../data/repositories/auth_providers.dart';

class RegisterController extends StateNotifier<AsyncValue<void>> {
  final AuthRepository _authRepository;

  RegisterController(this._authRepository) : super(const AsyncValue.data(null));

  Future<bool> register({
    required String email,
    required String password,
    required String fullName,
  }) async {
    state = const AsyncValue.loading();
    try {
      await _authRepository.signUpWithEmail(
        email: email,
        password: password,
        fullName: fullName,
      );
      state = const AsyncValue.data(null);
      return true; // نجاح التسجيل
    } catch (e, stack) {
      state = AsyncValue.error(e, stack);
      return false; // فشل التسجيل
    }
  }
}

final registerControllerProvider = StateNotifierProvider<RegisterController, AsyncValue<void>>((ref) {
  final authRepo = ref.watch(authRepositoryProvider);
  return RegisterController(authRepo);
});
