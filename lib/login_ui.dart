import "package:flutter/material.dart";
import "package:flutter/gestures.dart";
import "package:groceries_store_app/home_screen.dart";
import "package:groceries_store_app/product_detail.dart";
import "package:groceries_store_app/signup_ui.dart";

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //return const Placeholder();
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _showPass = false;
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passController = TextEditingController();

  var _emailError = "Email is invalid";
  var _passError = "Password must at least 6 chars, and has Upper and Num";

  var _emailInvalid = false;
  var _passInvalid = false;

  @override
  Widget build(BuildContext context) {
    // return const Placeholder();
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
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
                  children: <Widget>[
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
                      style: TextStyle(fontSize: 16, color: Color(0xff888888)),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),
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
                // suffixIcon: GestureDetector(
                //   onTap: onToggleClicked,
                //   child: Image.asset(
                //     _showPass
                //         ? "assets/images/show.png"
                //         : "assets/images/hide.png",
                //     width: 10,
                //   ),
                // ),
                suffixIcon: IconButton(
                  onPressed: onToggleClicked,
                  icon: Icon(
                    _showPass ? Icons.visibility : Icons.visibility_off,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Container(
                alignment: AlignmentDirectional.centerEnd,
                child: Text(
                  "Forgot Password?",
                  style: TextStyle(fontSize: 16, color: Color(0xff888888)),
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                height: 67,
                child: ElevatedButton(
                  onPressed: onLogInClicked,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: !_emailInvalid && !_passInvalid
                        ? Color(0xff53B175)
                        : Color(0xff888888),
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
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.black,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: "Sign up",
                      style: const TextStyle(color: Color(0xff53B175)),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SignUpPage(),
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
      padding: const EdgeInsets.symmetric(vertical: 18.0),
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

  // void onChangeColorLogInButton () {
  //   setState(() {
  //     if (!_emailInvalid && !_passInvalid) {

  //     }
  //   });
  // }

  void onToggleClicked() {
    setState(() {
      _showPass = !_showPass;
    });
  }

  void onLogInClicked() {
    setState(() {
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
      // _emailError =
      //     _emailController.text.length < 6 &&
      //         !_emailController.text.contains("@")
      //     ? "Email is invalid"
      //     : null;

      // _passError = _passController.text.length < 6
      //     ? "Password is at least 6 chars"
      //     : null;

      if (!_emailInvalid && !_passInvalid) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen()),
        );
      }
    });
  }
}
