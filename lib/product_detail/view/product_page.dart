import "package:flutter/material.dart";
import "package:groceries_store_app/product_detail/view/product_detail.dart";

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProductDetailScreen(),
    );
  }
}
