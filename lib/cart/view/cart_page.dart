import "package:flutter/material.dart";
import "package:groceries_store_app/cart/view/cart_ui.dart";

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //return const Placeholder();
    return MaterialApp(debugShowCheckedModeBanner: false, home: CartScreen());
  }
}
