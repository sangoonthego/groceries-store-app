import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:groceries_store_app/signup/view/signup_ui.dart';
import '../cubit/login_cubit.dart';
import '../cubit/login_state.dart';
import '../models/login_form_model.dart';
import 'package:groceries_store_app/home/view/home_screen.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (_) => LoginCubit(), child: _LoginView());
  }
}

class _LoginView extends StatefulWidget {
  @override
  State<_LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<_LoginView> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _updateTextControllers(LoginFormModel form) {
    if (_emailController.text != form.email) {
      _emailController.text = form.email;
      _emailController.selection = TextSelection.fromPosition(
        TextPosition(offset: form.email.length),
      );
    }

    if (_passwordController.text != form.password) {
      _passwordController.text = form.password;
      _passwordController.selection = TextSelection.fromPosition(
        TextPosition(offset: form.password.length),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        state.mapOrNull(
          success: (success) {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const HomeScreen()),
              (Route<dynamic> route) => false,
            );
          },
          failure: (failure) {
            _showErrorSnackBar(context, failure.loginError);
          },
        );
      },
      builder: (context, state) {
        final cubit = context.read<LoginCubit>();
        final form = state.maybeMap(
          ready: (ready) => ready.form,
          orElse: () => const LoginFormModel(),
        );
        final isLoading = state.maybeMap(
          loading: (_) => true,
          orElse: () => false,
        );

        _updateTextControllers(form);

        return Scaffold(
          body: Stack(
            children: [
              _LoginForm(
                emailController: _emailController,
                passwordController: _passwordController,
                form: form,
                isLoading: isLoading,
                cubit: cubit,
              ),
              if (isLoading)
                Container(
                  color: Colors.white.withOpacity(0.7),
                  child: const Center(child: CircularProgressIndicator()),
                ),
            ],
          ),
        );
      },
    );
  }

  void _showErrorSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(content: Text(message), backgroundColor: Colors.red),
      );
  }
}

class _LoginForm extends StatelessWidget {
  const _LoginForm({
    super.key,
    required this.emailController,
    required this.passwordController,
    required this.form,
    required this.isLoading,
    required this.cubit,
  });

  final TextEditingController emailController;
  final TextEditingController passwordController;
  final LoginFormModel form;
  final bool isLoading;
  final LoginCubit cubit;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 40),
          Image.asset('assets/images/carrot.png', height: 80, width: 80),
          const SizedBox(height: 30),
          Container(
            alignment: Alignment.centerLeft,
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Log In',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 26,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Enter your emails and password',
                  style: TextStyle(fontSize: 16, color: Color(0xff888888)),
                ),
              ],
            ),
          ),
          const SizedBox(height: 40),
          _LoginTextField(
            controller: emailController,
            labelText: 'Email',
            errorText: form.emailInvalid ? 'Email is invalid' : null,
            onChanged: cubit.onChangeEmail,
          ),
          _LoginTextField(
            controller: passwordController,
            labelText: 'Password',
            errorText: form.passInvalid
                ? 'Password must be at least 6 characters'
                : null,
            obscureText: !form.showPassword,
            onChanged: cubit.onChangePassword,
            suffixIcon: IconButton(
              onPressed: cubit.togglePasswordVisibility,
              icon: Icon(
                form.showPassword ? Icons.visibility : Icons.visibility_off,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Container(
            alignment: AlignmentDirectional.centerEnd,
            child: const Text(
              'Forgot Password?',
              style: TextStyle(fontSize: 16, color: Color(0xff888888)),
            ),
          ),
          const SizedBox(height: 20),
          if (!isLoading) _LoginButton(form: form, onPressed: cubit.login),
          const SizedBox(height: 24),
          _SignUpText(),
          const SizedBox(height: 40),
        ],
      ),
    );
  }
}

class _LoginTextField extends StatelessWidget {
  const _LoginTextField({
    required this.controller,
    this.labelText,
    this.errorText,
    this.obscureText = false,
    this.suffixIcon,
    required this.onChanged,
  });

  final TextEditingController controller;
  final String? labelText;
  final String? errorText;
  final bool obscureText;
  final Widget? suffixIcon;
  final Function(String) onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 18.0),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        onChanged: onChanged,
        style: const TextStyle(fontSize: 18, color: Color(0xff888888)),
        decoration: InputDecoration(
          labelText: labelText,
          errorText: errorText,
          labelStyle: const TextStyle(fontSize: 16, color: Colors.black),
          suffixIcon: suffixIcon,
        ),
      ),
    );
  }
}

class _LoginButton extends StatelessWidget {
  const _LoginButton({required this.form, required this.onPressed});

  final LoginFormModel form;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final bool isValid = !form.emailInvalid && !form.passInvalid;

    return SizedBox(
      width: double.infinity,
      height: 67,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: isValid
              ? const Color(0xff53B175)
              : const Color(0xff888888),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          elevation: 0,
        ),
        child: const Text(
          'Log In',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

class _SignUpText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: "Don't have an account? ",
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
          color: Colors.black,
        ),
        children: [
          TextSpan(
            text: 'Sign up',
            style: const TextStyle(color: Color(0xff53B175)),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SignUpPage()),
                );
              },
          ),
        ],
      ),
    );
  }
}
