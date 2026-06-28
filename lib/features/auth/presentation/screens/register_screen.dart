import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../config/theme/app_colors.dart';
import '../controllers/register_controller.dart';

class RegisterScreen extends ConsumerStatefulWidget {
  const RegisterScreen({super.key});

  @override
  ConsumerState<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends ConsumerState<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isPasswordVisible = false;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _handleRegister() async {
    if (_formKey.currentState!.validate()) {
      final success = await ref.read(registerControllerProvider.notifier).register(
            email: _emailController.text.trim(),
            password: _passwordController.text,
            fullName: _nameController.text.trim(),
          );

      if (mounted) {
        if (success) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('تم إنشاء الحساب بنجاح! يرجى التحقق من بريدك.'), backgroundColor: Colors.green),
          );
          Navigator.pop(context); // العودة لصفحة تسجيل الدخول
        } else {
          final error = ref.read(registerControllerProvider).error;
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('خطأ: ${error ?? "فشل التسجيل"}'), backgroundColor: Colors.red),
          );
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final registerState = ref.watch(registerControllerProvider);
    final isLoading = registerState is AsyncLoading;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.primary),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'إنشاء حساب جديد',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: AppColors.textPrimaryLight,
                        ),
                  ),
                  const SizedBox(height: 40),

                  // حقل الاسم الكامل
                  TextFormField(
                    controller: _nameController,
                    decoration: const InputDecoration(
                      labelText: 'الاسم الكامل',
                      prefixIcon: Icon(Icons.person_outline),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) return 'يرجى إدخال اسمك الكامل';
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),

                  // حقل البريد الإلكتروني
                  TextFormField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      labelText: 'البريد الإلكتروني',
                      prefixIcon: Icon(Icons.email_outlined),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty || !value.contains('@')) {
                        return 'يرجى إدخال بريد إلكتروني صالح';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),

                  // hقل كلمة المرور
                  TextFormField(
                    controller: _passwordController,
                    obscureText: !_isPasswordVisible,
                    decoration: InputDecoration(
                      labelText: 'كلمة المرور',
                      prefixIcon: const Icon(Icons.lock_outline),
                      suffixIcon: IconButton(
                        icon: Icon(_isPasswordVisible ? Icons.visibility : Icons.visibility_off),
                        onPressed: () => setState(() => _isPasswordVisible = !_isPasswordVisible),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.length < 6) return 'كلمة المرور يجب أن تكون من 6 أحرف على الأقل';
                      return null;
                    },
                  ),
                  const SizedBox(height: 32),

                  // زر التسجيل
                  ElevatedButton(
                    onPressed: isLoading ? null : _handleRegister,
                    child: isLoading
                        ? const SizedBox(
                            height: 20,
                            width: 20,
                            child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white),
                          )
                        : const Text('إنشاء الحساب'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}