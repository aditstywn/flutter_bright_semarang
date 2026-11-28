import 'package:material_ui/material_ui.dart';

import '../../../../core/component/buttons.dart';
import '../../../../core/component/custom_textformfield.dart';
import '../../../../core/style/color/colors_app.dart';

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({super.key});

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _oldPasswordController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordConfirmationController =
      TextEditingController();

  bool _isObscureOldPassword = true;
  bool _isObscurePassword = true;
  bool _isObscureConfirmation = true;

  @override
  void dispose() {
    _oldPasswordController.dispose();
    _passwordController.dispose();
    _passwordConfirmationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F7F9),
      appBar: AppBar(title: const Text('Ganti Password')),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: ColorsApp.white,
              borderRadius: BorderRadius.circular(18),
              border: Border.all(color: ColorsApp.gray200),
            ),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(
                    children: [
                      Icon(
                        Icons.lock_reset_rounded,
                        size: 20,
                        color: ColorsApp.primary,
                      ),
                      SizedBox(width: 8),
                      Text(
                        'Keamanan Akun',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          color: ColorsApp.gray900,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    'Masukkan password lama dan password baru untuk memperbarui keamanan akun Anda.',
                    style: TextStyle(fontSize: 12, color: ColorsApp.gray500),
                  ),
                  const SizedBox(height: 18),

                  CustomTextFormField(
                    controller: _oldPasswordController,
                    label: 'Password Lama',
                    isRequired: true,
                    hintText: 'Masukkan password lama',
                    obscureText: _isObscureOldPassword,
                    prefixIcon: const Icon(
                      Icons.lock_outline_rounded,
                      size: 19,
                      color: ColorsApp.gray400,
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _isObscureOldPassword
                            ? Icons.visibility_outlined
                            : Icons.visibility_off_outlined,
                        size: 19,
                        color: ColorsApp.gray400,
                      ),
                      onPressed: () {
                        setState(() {
                          _isObscureOldPassword = !_isObscureOldPassword;
                        });
                      },
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Password lama tidak boleh kosong';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 14),

                  CustomTextFormField(
                    controller: _passwordController,
                    label: 'Password Baru',
                    isRequired: true,
                    hintText: 'Masukkan password baru',
                    obscureText: _isObscurePassword,
                    prefixIcon: const Icon(
                      Icons.lock_outline_rounded,
                      size: 19,
                      color: ColorsApp.gray400,
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _isObscurePassword
                            ? Icons.visibility_outlined
                            : Icons.visibility_off_outlined,
                        size: 19,
                        color: ColorsApp.gray400,
                      ),
                      onPressed: () {
                        setState(() {
                          _isObscurePassword = !_isObscurePassword;
                        });
                      },
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Password baru tidak boleh kosong';
                      }
                      if (value.length < 6) {
                        return 'Password minimal 6 karakter';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 14),

                  CustomTextFormField(
                    controller: _passwordConfirmationController,
                    label: 'Konfirmasi Password',
                    isRequired: true,
                    hintText: 'Ulangi password baru',
                    obscureText: _isObscureConfirmation,
                    prefixIcon: const Icon(
                      Icons.lock_outline_rounded,
                      size: 19,
                      color: ColorsApp.gray400,
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _isObscureConfirmation
                            ? Icons.visibility_outlined
                            : Icons.visibility_off_outlined,
                        size: 19,
                        color: ColorsApp.gray400,
                      ),
                      onPressed: () {
                        setState(() {
                          _isObscureConfirmation = !_isObscureConfirmation;
                        });
                      },
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Konfirmasi password tidak boleh kosong';
                      }
                      if (value != _passwordController.text) {
                        return 'Konfirmasi password tidak cocok';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 22),

                  Button.filled(
                    label: 'Simpan Password',
                    height: 48,
                    borderRadius: 12,
                    color: ColorsApp.primary,
                    onPressed: () {
                      if (!_formKey.currentState!.validate()) return;
                    },
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
