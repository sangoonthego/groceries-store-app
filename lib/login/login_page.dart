import "package:flutter/material.dart";
import "package:groceries_store_app/login/login_ui.dart";

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //return const Placeholder();
    return MaterialApp(debugShowCheckedModeBanner: false, home: LoginPage());
  }
}
