// import "package:flutter_bloc/flutter_bloc.dart";
// import "package:groceries_store_app/login/cubit/login_state.dart";

// class LoginCubit extends Cubit<LoginState> {
//   LoginCubit()
//     : super(const LoginState(email: "", password: "", isLoading: false));

//   void togglePasswordVisibility() {
//     emit(state.copyWith(showPassword: !state.showPassword));
//   }

//   void onchangeEmail(String email) {
//     emit(state.copyWith(email: email));
//   }

//   void onchangePassword(String password) {
//     emit(state.copyWith(password: password));
//   }

//   void login() {
//     bool emailInvalid = state.email.length < 6 || !state.email.contains("@");
//     bool passInvalid =
//         state.password.length < 6 ||
//         !RegExp(r'[A-Z]').hasMatch(state.password) ||
//         !RegExp(r'[0-9]').hasMatch(state.password);

//     if (!emailInvalid && !passInvalid) {
//       emit(
//         state.copyWith(
//           emailInvalid: false,
//           passInvalid: false,
//           isLoading: true,
//         ),
//       );

//       Future.delayed(const Duration(seconds: 2), () {
//         emit(state.copyWith(isLoading: false));
//         emit(state.copyWith(isLoginSuccess: true));
//       });
//     } else {
//       emit(
//         state.copyWith(emailInvalid: emailInvalid, passInvalid: passInvalid),
//       );
//     }
//   }
// }

import "package:flutter_bloc/flutter_bloc.dart";
import "package:groceries_store_app/login/cubit/login_state.dart";

class LoginCubit extends Cubit<LoginState> {
  // init state must be LoginInitial or LoginReady
  LoginCubit() : super(const LoginReady(email: "", password: ""));

  // get current data from LoginReady
  LoginReady get currentState => state as LoginReady;

  void togglePasswordVisibility() {
    // only work when be at LoginReady
    if (state is LoginReady) {
      emit(currentState.copyWith(showPassword: !currentState.showPassword));
    }
  }

  void onchangeEmail(String email) {
    if (state is LoginReady) {
      emit(currentState.copyWith(email: email, emailInvalid: false));
    }
  }

  void onchangePassword(String password) {
    if (state is LoginReady) {
      emit(currentState.copyWith(password: password, passInvalid: false));
    }
  }

  void login() async {
    // check if current state is LoginReady
    if (state is! LoginReady) return;

    final currentData = currentState;

    // data valid
    bool emailInvalid =
        currentData.email.length < 6 || !currentData.email.contains("@");
    bool passInvalid =
        currentData.password.length < 6 ||
        !RegExp(r'[A-Z]').hasMatch(currentData.password) ||
        !RegExp(r'[0-9]').hasMatch(currentData.password);

    if (emailInvalid || passInvalid) {
      // if error valid -> emit LoginReady
      emit(
        currentData.copyWith(
          emailInvalid: emailInvalid,
          passInvalid: passInvalid,
        ),
      );
    } else {
      // if valid success: Emit LoginLoading
      emit(const LoginLoading());

      // call API
      await Future.delayed(const Duration(seconds: 2));

      // API handle
      try {
        final bool apiSuccess = currentData.email != "testfail@gmail.com";

        if (apiSuccess) {
          // success -> LoginSucess
          emit(const LoginSuccess(userId: "user_12345"));
        } else {
          emit(
            const LoginFailure(loginError: "Email or Password is Incorrect!!!"),
          );
        }
      } catch (e) {
        emit(const LoginFailure(loginError: "Error!!! Try again!"));
      }
    }
  }
}
