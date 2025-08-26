import 'package:flutter/material.dart';
import 'package:hello_world/login_ui.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //return const Placeholder();
    return new MaterialApp(home: SignUpPage());
  }
}

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool _showPass = false;

  TextEditingController _firstNameController = new TextEditingController();
  TextEditingController _lastNameController = new TextEditingController();
  TextEditingController _userController = new TextEditingController();
  TextEditingController _passController = new TextEditingController();

  var _firstNameError = "First Name must be not empty!!!";
  var _lastNameError = "Last Name must be not empty!!!";
  var _userError = "Username is invalid";
  var _passError = "Password must at least 6 chars";

  var _firstNameInvalid = false;
  var _lastNameInvalid = false;
  var _userInvalid = false;
  var _passInvalid = false;

  @override
  Widget build(BuildContext context) {
    //return const Placeholder();
    return Scaffold(
      body: Container(
        padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
        constraints: BoxConstraints(),
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
              child: Container(
                height: 80,
                width: 80,
                child: Image.asset("assets/images/carrot.png"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
              child: Container(
                alignment: AlignmentDirectional.topStart,
                child: Text(
                  "Sign Up",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
              child: Container(
                alignment: AlignmentDirectional.topStart,
                child: Text(
                  "Enter your credentials to continue",
                  style: TextStyle(fontSize: 20, color: Color(0xff888888)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
              child: TextField(
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.black,
                ),
                controller: _firstNameController,
                decoration: InputDecoration(
                  labelText: "First Name",
                  errorText: _firstNameInvalid ? _firstNameError : null,
                  labelStyle: TextStyle(fontSize: 20, color: Color(0xff888888)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
              child: TextField(
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.black,
                ),
                controller: _lastNameController,
                decoration: InputDecoration(
                  labelText: "Last Name",
                  errorText: _lastNameInvalid ? _lastNameError : null,
                  labelStyle: TextStyle(fontSize: 20, color: Color(0xff888888)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
              child: TextField(
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.black,
                ),
                decoration: InputDecoration(
                  labelText: "Username",
                  errorText: _userInvalid ? _userError : null,
                  labelStyle: TextStyle(fontSize: 20, color: Color(0xff888888)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
              child: Stack(
                alignment: AlignmentDirectional.centerEnd,
                children: <Widget>[
                  TextField(
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.black,
                    ),
                    controller: _passController,
                    obscureText: _showPass,
                    decoration: InputDecoration(
                      labelText: "Password",
                      errorText: _passInvalid ? _passError : null,
                      labelStyle: TextStyle(
                        fontSize: 20,
                        color: Color(0xff888888),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: onToggleClicked,
                    child: Image.asset(
                      _showPass
                          ? "assets/images/hide.png"
                          : "assets/images/show.png",
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
              child: RichText(
                text: TextSpan(
                  text: "By continuing you agree to our",
                  style: TextStyle(fontSize: 16, color: Color(0xff888888)),
                  children: <TextSpan>[
                    TextSpan(
                      text: " Terms of Service",
                      style: TextStyle(
                        color: Colors.green,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                    TextSpan(
                      text: " and",
                      style: TextStyle(color: Color(0xff888888)),
                    ),
                    TextSpan(
                      text: " Privacy Policy",
                      style: TextStyle(
                        color: Colors.green,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
              child: Container(
                height: 56,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: onSignUpClicked,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                  ),
                  child: Text(
                    "Sign Up",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
              child: Container(
                child: RichText(
                  text: TextSpan(
                    text: "Already have an account?",
                    style: TextStyle(fontSize: 16, color: Color(0xff888888)),
                    children: <TextSpan>[
                      TextSpan(
                        text: " Log In",
                        style: TextStyle(color: Colors.green),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
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
      if (_firstNameController.text.contains("@")) {
        _firstNameInvalid = true;
      } else {
        _firstNameInvalid = false;
      }

      if (_lastNameController.text.contains("@")) {
        _lastNameInvalid = true;
      } else {
        _lastNameInvalid = false;
      }

      if (_userController.text.length < 6 ||
          !_userController.text.contains("@")) {
        _userInvalid = true;
      } else {
        _userInvalid = false;
      }

      if (_passController.text.length < 6) {
        _passInvalid = true;
      } else {
        _passInvalid = false;
      }

      if (!_firstNameInvalid &&
          !_lastNameInvalid &&
          !_userInvalid &&
          !_passInvalid) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => LoginPage()),
        );
      }
    });
  }

  Widget gotoSignIn(BuildContext context) {
    return LoginPage();
  }
}
