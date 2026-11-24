import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_ui/material_ui.dart';

import '../../../../core/component/custom_textformfield.dart';

import '../../../../core/component/buttons.dart';
import '../../../../core/component/custom_container.dart';
import '../../../../core/extensions/build_context_ext.dart';
import '../../../../core/style/color/colors_app.dart';
import '../../data/models/request/register_request_model.dart';
import '../bloc/auth_bloc.dart';

class RegisterPage extends StatefulWidget {
  const new({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordConfirmationController =
      TextEditingController();
  final _formKey = GlobalKey<FormState>();

  bool _isObscure = true;
  bool _isObscureConfirmation = true;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _passwordConfirmationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: _formKey,
              child: CustomContainer(
                padding: const EdgeInsets.all(20.0),
                color: ColorsApp.white,
                borderRadius: 12.0,
                child: Column(
                  children: [
                    Image.asset(
                      'assets/images/logo_brida.png',
                      height: 100,
                      width: 100,
                    ),

                    Text(
                      'Daftar Akun Baru',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        color: ColorsApp.gray700,
                      ),
                    ),
                    const SizedBox(height: 4.0),
                    Text(
                      'Silakan isi data di bawah ini.',
                      style: TextStyle(
                        fontSize: 12.0,
                        color: ColorsApp.gray400,
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    CustomTextFormField(
                      controller: _nameController,
                      label: 'Nama Lengkap',
                      hintText: 'Masukkan nama lengkap Anda',
                      keyboardType: TextInputType.name,
                      prefixIcon: Icon(
                        Icons.person,
                        color: ColorsApp.gray400,
                        size: 20,
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Nama lengkap tidak boleh kosong';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16.0),
                    CustomTextFormField(
                      controller: _emailController,
                      label: 'Email',

                      hintText: 'Masukkan email Anda',
                      keyboardType: TextInputType.emailAddress,
                      prefixIcon: Icon(
                        Icons.email,
                        color: ColorsApp.gray400,
                        size: 20,
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Email tidak boleh kosong';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16.0),

                    CustomTextFormField(
                      controller: _passwordController,
                      label: 'Password',
                      hintText: 'Masukkan password Anda',
                      keyboardType: TextInputType.text,
                      obscureText: _isObscure,
                      prefixIcon: Icon(
                        Icons.lock,
                        color: ColorsApp.gray400,
                        size: 20,
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _isObscure ? Icons.visibility : Icons.visibility_off,
                          color: ColorsApp.gray400,
                        ),
                        onPressed: () {
                          setState(() {
                            _isObscure = !_isObscure;
                          });
                        },
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Password tidak boleh kosong';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16.0),

                    CustomTextFormField(
                      controller: _passwordConfirmationController,
                      label: 'Password Konfirmasi',
                      hintText: 'Masukkan password  Anda',
                      keyboardType: TextInputType.text,
                      obscureText: _isObscureConfirmation,
                      prefixIcon: Icon(
                        Icons.lock,
                        color: ColorsApp.gray400,
                        size: 20,
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _isObscureConfirmation
                              ? Icons.visibility
                              : Icons.visibility_off,
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
                          return 'Password konfirmasi tidak boleh kosong';
                        }
                        if (value != _passwordController.text) {
                          return 'Password konfirmasi tidak sesuai';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 24.0),
                    BlocConsumer<AuthBloc, AuthState>(
                      listener: (context, state) {
                        switch (state) {
                          case RegisterSucces(:final register):
                            context.showAlertSuccess(
                              message: register.message ?? 'Register berhasil',
                            );
                            _nameController.clear();
                            _emailController.clear();
                            _passwordController.clear();
                            _passwordConfirmationController.clear();
                            context.pop();
                            break;
                          case ErrorAuth(:final message):
                            context.showAlertError(message: message);
                          default:
                            break;
                        }
                      },
                      builder: (context, state) {
                        if (state is LoadingRegister) {
                          return Button.filled(
                            label: 'Daftar',
                            onPressed: () {},
                            color: ColorsApp.primary,
                            loading: true,
                          );
                        }
                        return Button.filled(
                          label: 'Daftar',
                          onPressed: () {
                            if (!_formKey.currentState!.validate()) {
                              return;
                            }

                            final register = RegisterRequestModel(
                              nama: _nameController.text,
                              email: _emailController.text,
                              password: _passwordController.text,
                              passwordConfirmation:
                                  _passwordConfirmationController.text,
                            );

                            context.read<AuthBloc>().add(
                              AuthEvent.register(register),
                            );
                          },
                          color: ColorsApp.primary,
                        );
                      },
                    ),
                    const SizedBox(height: 16.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Sudah punya akun?',
                          style: TextStyle(
                            color: ColorsApp.gray700,
                            fontSize: 12,
                          ),
                        ),
                        const SizedBox(width: 4.0),
                        GestureDetector(
                          onTap: () {
                            context.pop();
                          },
                          child: Text(
                            'Login',
                            style: TextStyle(
                              color: ColorsApp.primary,
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
