import 'package:flutter/material.dart';
import 'package:hello_world/product_detail.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //return const Placeholder();
    return new MaterialApp(home: LoginPage());
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _showPass = false;

  TextEditingController _userController = new TextEditingController();
  TextEditingController _passController = new TextEditingController();

  var _userError = "User is invalid!!!";
  var _passError = "Password must at least 6 chars";
  var _userInValid = false;
  var _passInValid = false;

  @override
  Widget build(BuildContext context) {
    //return const Placeholder();
    return Scaffold(
      body: Container(
        padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
        constraints: BoxConstraints.expand(),
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 20, 0, 40),
              child: Container(
                height: 80,
                width: 80,
                child: Image.asset("assets/images/carrot.png"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 20, 0, 10),
              child: Container(
                alignment: AlignmentDirectional.topStart,
                child: Text(
                  "Login",
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
                  "Enter your emails and password",
                  style: TextStyle(fontSize: 15, color: Color(0xff888888)),
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
                controller: _userController,
                decoration: InputDecoration(
                  labelText: "Email",
                  errorText: _userInValid ? _userError : null,
                  labelStyle: TextStyle(fontSize: 18, color: Color(0xff888888)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 30),
              child: Stack(
                alignment: AlignmentDirectional.centerEnd,
                children: <Widget>[
                  TextField(
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.black,
                    ),
                    obscureText: !_showPass,
                    controller: _passController,
                    decoration: InputDecoration(
                      labelText: "Password",
                      errorText: _passInValid ? _passError : null,
                      labelStyle: TextStyle(
                        fontSize: 18,
                        color: Color(0xff888888),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: onToggleShowPass,
                    child: Text(
                      _showPass ? "HIDE" : "SHOW",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
              child: Container(
                alignment: AlignmentDirectional.topEnd,
                child: Text(
                  "Forgot Password?",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Color(0xff888888),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
              child: Container(
                height: 56,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ElevatedButton(
                  onPressed: onLogInClicked,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                  ),
                  child: Text(
                    "Log in",
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ),
            ),
            Container(
              height: 130,
              width: double.infinity,
              alignment: AlignmentDirectional.topCenter,
              child: Text(
                "Don't have an account? Sign up",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void onToggleShowPass() {
    setState(() {
      _showPass = !_showPass;
    });
  }

  void onLogInClicked() {
    setState(() {
      if (_userController.text.length < 6 ||
          !_userController.text.contains("@")) {
        _userInValid = true;
      } else {
        _userInValid = false;
      }

      if (_passController.text.length < 6) {
        _passInValid = true;
      } else {
        _passInValid = false;
      }

      if (!_userInValid && !_passInValid) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ProductDetail()),
        );
      }
    });
  }

  Widget gotoProductDetail(BuildContext context) {
    return ProductDetail();
  }
}
