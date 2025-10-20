import "package:dio/dio.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:groceries_store_app/signup/data/signup_request.dart";
import "package:groceries_store_app/signup/data/signup_response.dart";
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
  final Dio dio = Dio();

  void togglePasswordVisibility() {
    emit(currentState.copyWith(showPassword: !currentState.showPassword));
  }

  void onchangeFirstName(String value) {
    emit(currentState.copyWith(firstName: value, firstNameInvalid: false));
  }

  void onchangeLastName(String value) {
    emit(currentState.copyWith(lastName: value, lastNameInvalid: false));
  }

  void onchangeUserName(String value) {
    emit(currentState.copyWith(userName: value, userNameInvalid: false));
  }

  void onchangeEmail(String value) {
    emit(currentState.copyWith(email: value, emailInvalid: false));
  }

  void onchangePassword(String value) {
    emit(currentState.copyWith(password: value, passwordInvalid: false));
  }

  Future<void> signup() async {
    if (state is! SignupReady) return;
    final data = currentState;

    // Validate input
    final emailInvalid = data.email.isEmpty || !data.email.contains("@");
    final passwordInvalid = data.password.length < 6;
    final firstNameInvalid = data.firstName.isEmpty;
    final lastNameInvalid = data.lastName.isEmpty;
    final userNameInvalid = data.userName.isEmpty;

    if (emailInvalid ||
        passwordInvalid ||
        firstNameInvalid ||
        lastNameInvalid ||
        userNameInvalid) {
      emit(
        data.copyWith(
          emailInvalid: emailInvalid,
          passwordInvalid: passwordInvalid,
          firstNameInvalid: firstNameInvalid,
          lastNameInvalid: lastNameInvalid,
          userNameInvalid: userNameInvalid,
        ),
      );
      return;
    }

    emit(const SignupLoading());

    try {
      final request = SignupRequest(
        firstName: data.firstName,
        lastName: data.lastName,
        userName: data.userName,
        email: data.email,
        password: data.password,
      );

      final response = await dio.post(
        "https://us-central1-skin-scanner-3c419.cloudfunctions.net/base/v1/auth-service/register",
        data: request.toJson(),
      );

      if (response.statusCode == 201 || response.statusCode == 200) {
        final signupResponse = SignupResponse.fromJson(response.data);
        emit(SignupSuccess(userId: signupResponse.userId ?? ""));
      } else {
        emit(
          SignupFailure(
            signupError: "Unexpected error: ${response.statusCode}",
          ),
        );
      }
    } catch (e) {
      emit(SignupFailure(signupError: e.toString()));
    }
  }
}
