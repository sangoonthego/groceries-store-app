import "package:flutter/material.dart";
import "package:groceries_store_app/home/view/home_screen.dart";

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //return const Placeholder();
    return MaterialApp(debugShowCheckedModeBanner: false, home: HomeScreen());
  }
}
