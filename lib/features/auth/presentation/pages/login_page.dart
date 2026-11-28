import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_ui/material_ui.dart';

import '../../../../core/component/buttons.dart';
import '../../../../core/component/custom_container.dart';
import '../../../../core/component/custom_textformfield.dart';
import '../../../../core/extensions/build_context_ext.dart';
import '../../../../core/style/color/colors_app.dart';
import '../../../main/main_nav.dart';
import '../../data/datasource/auth_local_datasource.dart';
import '../../data/models/request/login_request_model.dart';
import '../bloc/auth_bloc.dart';
import 'register_page.dart';

class LoginPage extends StatefulWidget {
  const new({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _emailForgotController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isObscure = true;

  @override
  void dispose() {
    _emailController.dispose();
    _emailForgotController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20.0),
            child: CustomContainer(
              padding: const EdgeInsets.all(20.0),
              color: ColorsApp.white,
              borderRadius: 12.0,
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    const SizedBox(height: 16.0),
                    Image.asset(
                      'assets/images/logo_brida.png',
                      height: 100,
                      width: 100,
                    ),
                    const SizedBox(height: 6.0),
                    Text(
                      'BRIGHT Semarang',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: ColorsApp.primary,
                      ),
                    ),
                    Text(
                      'BRIDA Internship Gateway',
                      style: TextStyle(
                        fontSize: 12,
                        color: ColorsApp.gray400,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    const SizedBox(height: 35.0),
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
                      validator: (value) => value != null && value.isEmpty
                          ? 'Email tidak boleh kosong'
                          : null,
                    ),
                    const SizedBox(height: 16.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Password',
                          style: TextStyle(
                            color: ColorsApp.gray700,
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            resetPassword(context);
                          },
                          child: Text(
                            'Lupa Password?',
                            style: TextStyle(
                              color: ColorsApp.primary,
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4.0),
                    CustomTextFormField(
                      controller: _passwordController,
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
                      validator: (value) => value != null && value.isEmpty
                          ? 'Password tidak boleh kosong'
                          : null,
                    ),
                    const SizedBox(height: 24.0),
                    BlocConsumer<AuthBloc, AuthState>(
                      listener: (context, state) {
                        switch (state) {
                          case LoginSucces(:final login):
                            context.showAlertSuccess(message: 'Login berhasil');
                            AuthLocalDatasource().saveAccessToken(
                              login.data?.token ?? '',
                            );

                            context.pushReplacement(MainNav());
                            _emailController.clear();
                            _passwordController.clear();
                            break;
                          case ErrorAuth(:final message):
                            context.showAlertError(message: message);
                          default:
                            break;
                        }
                      },
                      builder: (context, state) {
                        if (state is LoadingLogin) {
                          return Button.filled(
                            label: 'Masuk',
                            onPressed: () {},
                            color: ColorsApp.primary,
                            loading: true,
                          );
                        }
                        return Button.filled(
                          label: 'Masuk',
                          onPressed: () {
                            if (!_formKey.currentState!.validate()) {
                              return;
                            }

                            final login = LoginRequestModel(
                              email: _emailController.text,
                              password: _passwordController.text,
                            );

                            context.read<AuthBloc>().add(
                              AuthEvent.login(login),
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
                          'Belum punya akun?',
                          style: TextStyle(
                            color: ColorsApp.gray700,
                            fontSize: 12,
                          ),
                        ),
                        const SizedBox(width: 4.0),
                        GestureDetector(
                          onTap: () {
                            context.push(const RegisterPage());
                          },
                          child: Text(
                            'Daftar di sini',
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

  Future<dynamic> resetPassword(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: ColorsApp.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Lupa Password?',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                  color: ColorsApp.black,
                ),
              ),
              const SizedBox(height: 8.0),
              Text(
                'Masukan email Anda yang terdaftar, sistem akan memberikan tautan untuk mengatur ulang kata sandi.',
                style: TextStyle(fontSize: 12.0, color: ColorsApp.grey),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16.0),
              CustomTextFormField(
                controller: _emailForgotController,
                label: 'Email',

                hintText: 'Masukkan email Anda',
                keyboardType: TextInputType.emailAddress,
                prefixIcon: Icon(
                  Icons.email,
                  color: ColorsApp.gray400,
                  size: 20,
                ),
              ),
              const SizedBox(height: 16.0),
              BlocConsumer<AuthBloc, AuthState>(
                listener: (context, state) {
                  switch (state) {
                    case ResetPasswordSucces(:final reset):
                      context.showAlertSuccess(
                        message:
                            reset.message ??
                            'Tautan reset password berhasil dikirim',
                      );
                      _emailForgotController.clear();
                      context.pop();
                      break;
                    case ErrorAuth(:final message):
                      context.showAlertError(message: message);
                    default:
                      break;
                  }
                },
                builder: (context, state) {
                  if (state is LoadingResetPassword) {
                    return Button.filled(
                      label: 'Buat Tautan Reset',
                      onPressed: () {},
                      color: ColorsApp.primary,
                      loading: true,
                    );
                  }
                  return Button.filled(
                    label: 'Buat Tautan Reset',
                    onPressed: () {
                      context.read<AuthBloc>().add(
                        AuthEvent.resetPassword(_emailForgotController.text),
                      );
                    },
                    color: ColorsApp.primary,
                  );
                },
              ),
              const SizedBox(height: 8.0),
              Button.outlined(
                label: 'Batal',
                onPressed: () {
                  context.pop();
                },
                color: ColorsApp.white,
              ),
            ],
          ),
        );
      },
    );
  }
}
