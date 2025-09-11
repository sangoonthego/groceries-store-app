import "package:flutter_bloc/flutter_bloc.dart";
import "package:groceries_store_app/signup/signup_state.dart";

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit()
    : super(
        const SignUpState(
          firstName: "",
          lastName: "",
          userName: "",
          email: "",
          password: "",
          isLoading: false,
        ),
      );

  void togglePasswordVisibility() {
    emit(state.copyWith(showPassword: !state.showPassword));
  }

  void onchangeFirstName(String firstName) {
    emit(state.copyWith(firstName: firstName));
  }

  void onchangeLastName(String lastName) {
    emit(state.copyWith(lastName: lastName));
  }

  void onchangeUserName(String userName) {
    emit(state.copyWith(userName: userName));
  }

  void onchangeEmail(String email) {
    emit(state.copyWith(email: email));
  }

  void onchangePassword(String password) {
    emit(state.copyWith(password: password));
  }

  void signup() {
    bool emailInvalid = state.email.length < 6 || !state.email.contains("@");
    bool passInvalid =
        state.password.length < 6 ||
        !RegExp(r'[A-Z]').hasMatch(state.password) ||
        !RegExp(r'[0-9]').hasMatch(state.password);

    if (!emailInvalid && !passInvalid) {
      emit(
        state.copyWith(
          emailInvalid: false,
          passwordInvalid: false,
          isLoading: true,
        ),
      );

      Future.delayed(const Duration(seconds: 2), () {
        emit(state.copyWith(isLoading: false));
        emit(state.copyWith(isSignUpSuccess: true));
      });
    } else {
      emit(
        state.copyWith(
          emailInvalid: emailInvalid,
          passwordInvalid: passInvalid,
        ),
      );
    }
  }
}
