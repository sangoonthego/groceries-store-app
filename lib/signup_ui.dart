import 'package:flutter/material.dart';
import 'package:hello_world/login_ui.dart';
import "package:flutter/gestures.dart";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const SignUpPage(),
    );
  }
}

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool _showPass = false;
  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();
  TextEditingController _userController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passController = TextEditingController();

  var _firstNameError = "First Name must not be empty";
  var _lastNameError = "Last Name must not be empty";
  var _userError = "Username must not be empty";
  var _emailError = "Email must not be empty";
  var _passError = "Password must be at least 6 chars and has Upper and Nums";

  var _firstNameInvalid = false;
  var _lastNameInvalid = false;
  var _userInvalid = false;
  var _emailInvalid = false;
  var _passInvalid = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F2F8),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const SizedBox(height: 40),
              Image.asset("assets/images/carrot.png", height: 80, width: 80),
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
                      style: TextStyle(fontSize: 16, color: Color(0xff888888)),
                    ),
                  ],
                ),
              ),
              // const SizedBox(height: 10),
              _buildTextField(
                controller: _firstNameController,
                labelText: "First Name",
                errorText: _firstNameInvalid ? _firstNameError : null,
              ),
              _buildTextField(
                controller: _lastNameController,
                labelText: "Last Name",
                errorText: _lastNameInvalid ? _lastNameError : null,
              ),
              _buildTextField(
                controller: _userController,
                labelText: "Username",
                errorText: _userInvalid ? _userError : null,
              ),
              _buildTextField(
                controller: _emailController,
                labelText: "Email",
                errorText: _emailInvalid ? _emailError : null,
              ),
              _buildTextField(
                controller: _passController,
                labelText: "Password",
                errorText: _passInvalid ? _passError : null,
                obscureText: !_showPass,
                // suffixIcon => Icon appears behind the text <> prefixIcon
                suffixIcon: IconButton(
                  onPressed: onToggleClicked,
                  icon: Icon(
                    _showPass ? Icons.visibility : Icons.visibility_off,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              RichText(
                text: const TextSpan(
                  text: "By continuing you agree to our",
                  style: TextStyle(fontSize: 14, color: Color(0xff888888)),
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
              SizedBox(
                width: double.infinity,
                height: 67,
                child: ElevatedButton(
                  onPressed: onSignUpClicked,
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        !_firstNameInvalid &&
                            !_lastNameInvalid &&
                            !_userInvalid &&
                            !_emailInvalid &&
                            !_passInvalid
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
                      style: const TextStyle(color: Color(0xff53B175)),
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
    );
  }

  Widget _buildTextField({
    TextEditingController? controller,
    String? labelText,
    String? errorText,
    bool obscureText = false,
    Widget? suffixIcon,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
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

  void onToggleClicked() {
    setState(() {
      _showPass = !_showPass;
    });
  }

  void onSignUpClicked() {
    setState(() {
      if (_firstNameController.text.isEmpty) {
        _firstNameInvalid = true;
      } else {
        _firstNameInvalid = false;
      }

      if (_lastNameController.text.isEmpty) {
        _lastNameInvalid = true;
      } else {
        _lastNameInvalid = false;
      }

      if (_userController.text.isEmpty) {
        _userInvalid = true;
      } else {
        _userInvalid = false;
      }

      if (_emailController.text.length < 6 &&
          !_emailController.text.contains("@")) {
        _emailInvalid = true;
      } else {
        _emailInvalid = false;
      }

      if (_passController.text.length < 6 ||
          !_passController.text.contains(RegExp(r'[A-Z]')) ||
          !_passController.text.contains(RegExp(r'[0-9]'))) {
        _passInvalid = true;
      } else {
        _passInvalid = false;
      }
      // _firstNameError = _firstNameController.text.isEmpty
      //     ? "First Name must not be empty"
      //     : null;
      // _lastNameError = _lastNameController.text.isEmpty
      //     ? "Last Name must not be empty"
      //     : null;
      // _userError = _userController.text.length < 6
      //     ? "Username must be at least 6 characters"
      //     : null;
      // _emailError = !_emailController.text.contains("@")
      //     ? "Email is invalid"
      //     : null;
      // _passError = _passController.text.length < 6
      //     ? "Password must be at least 6 characters"
      //     : null;

      if (!_firstNameInvalid &&
          !_lastNameInvalid &&
          !_userInvalid &&
          !_emailInvalid &&
          !_passInvalid) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const LoginPage()),
        );
      }
    });
  }
}
