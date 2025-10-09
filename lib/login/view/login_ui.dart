import "package:flutter/material.dart";
import "package:flutter/gestures.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:groceries_store_app/home/home_screen.dart";
import "package:groceries_store_app/signup/signup_ui.dart";
import "../cubit/login_cubit.dart";
import "../cubit/login_state.dart";

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state.isLoginSuccess) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen()),
            );
          }
        },
        builder: (context, state) {
          final cubit = context.read<LoginCubit>();

          return Scaffold(
            body: Stack(
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        const SizedBox(height: 40),
                        Image.asset(
                          "assets/images/carrot.png",
                          height: 80,
                          width: 80,
                        ),
                        const SizedBox(height: 30),
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                "Log In",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 26,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                "Enter your emails and password",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Color(0xff888888),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 40),
                        _buildTextField(
                          labelText: "Email",
                          errorText: state.emailInvalid
                              ? "Email is invalid"
                              : null,
                          onChanged: cubit.onchangeEmail,
                        ),
                        _buildTextField(
                          labelText: "Password",
                          errorText: state.passInvalid
                              ? "Password must at least 6 chars, and has Upper and Num"
                              : null,
                          obscureText: !state.showPassword,
                          onChanged: cubit.onchangePassword,
                          suffixIcon: IconButton(
                            onPressed: cubit.togglePasswordVisibility,
                            icon: Icon(
                              state.showPassword
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Container(
                          alignment: AlignmentDirectional.centerEnd,
                          child: const Text(
                            "Forgot Password?",
                            style: TextStyle(
                              fontSize: 16,
                              color: Color(0xff888888),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        state.isLoading
                            ? const CircularProgressIndicator()
                            : SizedBox(
                                width: double.infinity,
                                height: 67,
                                child: ElevatedButton(
                                  onPressed: cubit.login,
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        !state.emailInvalid &&
                                            !state.passInvalid
                                        ? const Color(0xff53B175)
                                        : const Color(0xff888888),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    elevation: 0,
                                  ),
                                  child: const Text(
                                    "Log In",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                        const SizedBox(height: 24),
                        RichText(
                          text: TextSpan(
                            text: "Don't have an account? ",
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.black,
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                text: "Sign up",
                                style: const TextStyle(
                                  color: Color(0xff53B175),
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const SignUpPage(),
                                      ),
                                    );
                                  },
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 40),
                      ],
                    ),
                  ),
                ),
                if (state.isLoading)
                  Container(
                    color: Colors.white.withValues(),
                    child: const Center(child: CircularProgressIndicator()),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildTextField({
    String? labelText,
    String? errorText,
    bool obscureText = false,
    Widget? suffixIcon,
    required Function(String) onChanged,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 18.0),
      child: TextField(
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
