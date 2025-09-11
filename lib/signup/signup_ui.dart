import 'package:flutter/material.dart';
import "package:flutter/gestures.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import 'package:groceries_store_app/login/login_ui.dart';
import "package:groceries_store_app/signup/signup_cubit.dart";
import "package:groceries_store_app/signup/signup_state.dart";

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    var _firstNameError = "First Name must not be empty";
    var _lastNameError = "Last Name must not be empty";
    var _userError = "Username must not be empty";
    var _emailError = "Email must not be empty";
    var _passError = "Password must be at least 6 chars and has Upper and Nums";

    return BlocProvider(
      create: (_) => SignUpCubit(),
      child: BlocConsumer<SignUpCubit, SignUpState>(
        listener: (context, state) {
          if (state.isSignUpSuccess) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => LoginPage()),
            );
          }
        },
        builder: (context, state) {
          final cubit = context.read<SignUpCubit>();
          return Scaffold(
            backgroundColor: const Color(0xFFF3F2F8),
            body: Stack(
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
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
                                "Sign Up",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 26,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                "Enter your credentials to continue",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Color(0xff888888),
                                ),
                              ),
                            ],
                          ),
                        ),
                        // const SizedBox(height: 10),
                        _buildTextField(
                          labelText: "First Name",
                          errorText: state.firstNameInvalid
                              ? _firstNameError
                              : null,
                          onChanged: cubit.onchangeFirstName,
                        ),
                        _buildTextField(
                          labelText: "Last Name",
                          errorText: state.lastNameInvalid
                              ? _lastNameError
                              : null,
                          onChanged: cubit.onchangeLastName,
                        ),
                        _buildTextField(
                          labelText: "Username",
                          errorText: state.userNameInvalid ? _userError : null,
                          onChanged: cubit.onchangeUserName,
                        ),
                        _buildTextField(
                          labelText: "Email",
                          errorText: state.emailInvalid ? _emailError : null,
                          onChanged: cubit.onchangeEmail,
                        ),
                        _buildTextField(
                          labelText: "Password",
                          errorText: state.passwordInvalid ? _passError : null,

                          obscureText: !state.showPassword,
                          onChanged: cubit.onchangePassword,
                          // suffixIcon => Icon appears behind the text <> prefixIcon
                          suffixIcon: IconButton(
                            onPressed: cubit.togglePasswordVisibility,
                            icon: Icon(
                              state.showPassword
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        RichText(
                          text: const TextSpan(
                            text: "By continuing you agree to our",
                            style: TextStyle(
                              fontSize: 14,
                              color: Color(0xff888888),
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                text: " Terms of Service",
                                style: TextStyle(color: Color(0xff53B175)),
                              ),
                              TextSpan(
                                text: " and",
                                style: TextStyle(color: Color(0xff888888)),
                              ),
                              TextSpan(
                                text: " Privacy Policy",
                                style: TextStyle(color: Color(0xff53B175)),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),
                        state.isLoading
                            ? const CircularProgressIndicator()
                            : SizedBox(
                                width: double.infinity,
                                height: 67,
                                child: ElevatedButton(
                                  onPressed: cubit.signup,
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        !state.emailInvalid &&
                                            !state.passwordInvalid
                                        ? Color(0xff53B175)
                                        : Color(0xff888888),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    elevation: 0,
                                  ),
                                  child: const Text(
                                    "Sign Up",
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
                            text: "Already have an account? ",
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.black,
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                text: "Sign in",
                                style: const TextStyle(
                                  color: Color(0xff53B175),
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => const LoginPage(),
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
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: TextField(
        obscureText: obscureText,
        onChanged: onChanged,
        style: const TextStyle(
          // fontWeight: FontWeight.bold,
          fontSize: 18,
          color: Color(0xff888888),
        ),
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
