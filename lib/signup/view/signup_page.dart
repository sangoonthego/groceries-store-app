import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:groceries_store_app/signup/view/signup_ui.dart";
import "package:groceries_store_app/signup/cubit/signup_cubit.dart";
import "package:groceries_store_app/services/api_service.dart";

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //return const Placeholder();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (context) => SignupCubit(ApiService()),
        child: SignUpPage(),
      ),
    );
  }
}
