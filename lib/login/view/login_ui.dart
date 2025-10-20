import "package:flutter/material.dart";
import "package:flutter/gestures.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:groceries_store_app/signup/view/signup_ui.dart";
import "../cubit/login_cubit.dart";
import "../cubit/login_state.dart";
import "package:groceries_store_app/home/view/home_screen.dart";

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  void _showErrorSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(content: Text(message), backgroundColor: Colors.red),
      );
  }

  @override
  Widget build(BuildContext context) {
    final TextEditingController _emailController = TextEditingController();
    final TextEditingController _passwordController = TextEditingController();

    return BlocProvider(
      create: (_) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LoginSuccess) {
            //Navigator.pushReplacementNamed(context, '/home');
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen()),
              (Route<dynamic> route) => false, // delete stack
            );
          } else if (state is LoginFailure) {
            _showErrorSnackBar(context, state.loginError);
          }
        },
        builder: (context, state) {
          final cubit = context.read<LoginCubit>();

          // get data from state, available when state is LoginReady
          // if state is Loading, Success, hay Failure -> get final data from Ready

          final LoginReady? readyState = state is LoginReady
              ? state
              : (context.read<LoginCubit>().state is LoginReady
                    ? context.read<LoginCubit>().state as LoginReady
                    : null);

          // check if being Loading state?
          final bool isLoading = state is LoginLoading;

          // if state is LoginReady -> update value of controller
          if (readyState != null) {
            if (_emailController.text != readyState.email) {
              _emailController.text = readyState.email;
              _emailController.selection = TextSelection.fromPosition(
                TextPosition(offset: readyState.email.length),
              );
            }

            if (_passwordController.text != readyState.password) {
              _passwordController.text = readyState.password;
              _passwordController.selection = TextSelection.fromPosition(
                TextPosition(offset: readyState.password.length),
              );
            }
          }

          // show API error after LoginFailure "listener"
          //

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
                          controller: _emailController,
                          labelText: "Email",
                          // use LoginReady -> get valid
                          errorText: readyState?.emailInvalid == true
                              ? "Email is invalid"
                              : null,
                          onChanged: cubit.onchangeEmail,
                        ),
                        _buildTextField(
                          controller: _passwordController,
                          labelText: "Password",
                          errorText: readyState?.passInvalid == true
                              ? "Password must at least 6 chars, and has Upper and Num"
                              : null,
                          obscureText: !(readyState?.showPassword ?? false),
                          onChanged: cubit.onchangePassword,
                          suffixIcon: IconButton(
                            onPressed: cubit.togglePasswordVisibility,
                            icon: Icon(
                              (readyState?.showPassword ?? false)
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
                        isLoading
                            ? const CircularProgressIndicator()
                            : SizedBox(
                                width: double.infinity,
                                height: 67,
                                child: ElevatedButton(
                                  onPressed: cubit.login,
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        (readyState?.emailInvalid == false &&
                                            readyState?.passInvalid == false)
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
                if (isLoading)
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
    required TextEditingController controller,
    String? labelText,
    String? errorText,
    bool obscureText = false,
    Widget? suffixIcon,
    required Function(String) onChanged,
    // String? initialValue, // hold data when state changed
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 18.0),
      child: TextField(
        // controller: TextEditingController(text: initialValue),
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
