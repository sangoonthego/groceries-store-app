import "package:flutter_bloc/flutter_bloc.dart";
import "package:groceries_store_app/login/login_state.dart";

class LoginCubit extends Cubit<LoginState> {
  LoginCubit()
    : super(const LoginState(email: "", password: "", isLoading: false));

  void togglePasswordVisibility() {
    emit(state.copyWith(showPassword: !state.showPassword));
  }

  void onchangeEmail(String email) {
    emit(state.copyWith(email: email));
  }

  void onchangePassword(String password) {
    emit(state.copyWith(password: password));
  }

  void login() {
    bool emailInvalid = state.email.length < 6 || !state.email.contains("@");
    bool passInvalid =
        state.password.length < 6 ||
        !RegExp(r'[A-Z]').hasMatch(state.password) ||
        !RegExp(r'[0-9]').hasMatch(state.password);

    if (!emailInvalid && !passInvalid) {
      emit(
        state.copyWith(
          emailInvalid: false,
          passInvalid: false,
          isLoading: true,
        ),
      );

      Future.delayed(const Duration(seconds: 2), () {
        emit(state.copyWith(isLoading: false));
        emit(state.copyWith(isLoginSuccess: true));
      });
    } else {
      emit(
        state.copyWith(emailInvalid: emailInvalid, passInvalid: passInvalid),
      );
    }
  }
}
