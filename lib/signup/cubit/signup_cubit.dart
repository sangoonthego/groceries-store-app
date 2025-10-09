// import "package:flutter_bloc/flutter_bloc.dart";
// import "package:groceries_store_app/signup/cubit/signup_state.dart";

// class SignUpCubit extends Cubit<SignUpState> {
//   SignUpCubit()
//     : super(
//         const SignUpState(
//           firstName: "",
//           lastName: "",
//           userName: "",
//           email: "",
//           password: "",
//           isLoading: false,
//         ),
//       );

//   void togglePasswordVisibility() {
//     emit(state.copyWith(showPassword: !state.showPassword));
//   }

//   void onchangeFirstName(String firstName) {
//     emit(state.copyWith(firstName: firstName));
//   }

//   void onchangeLastName(String lastName) {
//     emit(state.copyWith(lastName: lastName));
//   }

//   void onchangeUserName(String userName) {
//     emit(state.copyWith(userName: userName));
//   }

//   void onchangeEmail(String email) {
//     emit(state.copyWith(email: email));
//   }

//   void onchangePassword(String password) {
//     emit(state.copyWith(password: password));
//   }

//   void signup() {
//     bool emailInvalid = state.email.length < 6 || !state.email.contains("@");
//     bool passInvalid =
//         state.password.length < 6 ||
//         !RegExp(r'[A-Z]').hasMatch(state.password) ||
//         !RegExp(r'[0-9]').hasMatch(state.password);

//     if (!emailInvalid && !passInvalid) {
//       emit(
//         state.copyWith(
//           emailInvalid: false,
//           passwordInvalid: false,
//           isLoading: true,
//         ),
//       );

//       Future.delayed(const Duration(seconds: 2), () {
//         emit(state.copyWith(isLoading: false));
//         emit(state.copyWith(isSignUpSuccess: true));
//       });
//     } else {
//       emit(
//         state.copyWith(
//           emailInvalid: emailInvalid,
//           passwordInvalid: passInvalid,
//         ),
//       );
//     }
//   }
// }

import "package:flutter_bloc/flutter_bloc.dart";
import "package:groceries_store_app/signup/cubit/signup_state.dart";

class SignupCubit extends Cubit<SignupState> {
  SignupCubit()
    : super(
        const SignupReady(
          firstName: "",
          lastName: "",
          userName: "",
          email: "",
          password: "",
        ),
      );

  SignupReady get currentState => state as SignupReady;

  void togglePasswordVisibility() {
    if (state is SignupReady) {
      emit(currentState.copyWith(showPassword: !currentState.showPassword));
    }
  }

  void onchangeFirstName(String firstName) {
    if (state is SignupReady) {
      emit(
        currentState.copyWith(firstName: firstName, firstNameInvalid: false),
      );
    }
  }

  void onchangeLastName(String lastName) {
    if (state is SignupReady) {
      emit(currentState.copyWith(lastName: lastName, lastNameInvalid: false));
    }
  }

  void onchangeUserName(String userName) {
    if (state is SignupReady) {
      emit(currentState.copyWith(userName: userName, userNameInvalid: false));
    }
  }

  void onchangeEmail(String email) {
    if (state is SignupReady) {
      emit(currentState.copyWith(email: email, emailInvalid: false));
    }
  }

  void onchangePassword(String password) {
    if (state is SignupReady) {
      emit(currentState.copyWith(password: password, passwordInvalid: false));
    }
  }

  void signup() async {
    if (state is! SignupReady) return;

    final currentData = currentState;

    bool emailInvalid =
        currentData.email.length < 6 || !currentData.email.contains("@");
    bool passwordInvalid =
        currentData.password.length < 6 ||
        !RegExp(r'[A-Z]').hasMatch(currentData.password) ||
        !RegExp(r'[0-9]').hasMatch(currentData.password);

    if (emailInvalid || passwordInvalid) {
      emit(
        currentData.copyWith(
          emailInvalid: emailInvalid,
          passwordInvalid: passwordInvalid,
        ),
      );
    } else {
      emit(const SignupLoading());
      await Future.delayed(const Duration(seconds: 2));

      try {
        final bool apiSuccess = currentData.email != "testfail@gmail.com";

        if (apiSuccess) {
          emit(const SignupSuccess(userId: "user_12345"));
        } else {
          emit(
            const SignupFailure(
              signupError: "Email or Password is Incorrect!!!",
            ),
          );
        }
      } catch (e) {
        emit(const SignupFailure(signupError: "Error!!! Try again!"));
      }
    }
  }
}
