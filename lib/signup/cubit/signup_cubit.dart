import "package:dio/dio.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:groceries_store_app/signup/data/signup_request.dart";
import "package:groceries_store_app/signup/data/signup_response.dart";
import "package:groceries_store_app/signup/cubit/signup_state.dart";
import "package:groceries_store_app/services/api_service.dart";

class SignupCubit extends Cubit<SignupState> {
  final ApiService _apiService;

  SignupCubit(this._apiService) : super(const SignupReady(password: ""));

  SignupReady get currentState => state as SignupReady;

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
    final currentData = currentState;
    final email = currentData.email.trim();
    final password = currentData.password;
    final firstName = currentData.firstName.trim();
    final lastName = currentData.lastName.trim();
    final userName = currentData.userName.trim();

    // Validate input
    final emailInvalid = email.isEmpty || !email.contains("@");
    final passwordInvalid = password.length < 6;
    final firstNameInvalid = firstName.isEmpty;
    final lastNameInvalid = lastName.isEmpty;
    final userNameInvalid = userName.isEmpty;

    if (emailInvalid ||
        passwordInvalid ||
        firstNameInvalid ||
        lastNameInvalid ||
        userNameInvalid) {
      emit(
        currentData.copyWith(
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
        firstName: firstName,
        lastName: lastName,
        userName: userName,
        email: email,
        password: password,
      );

      print("Register Request: ${request.toJson()}"); // DEBUG

      final response = await _apiService.register(request.toJson());
      final signupResponse = SignupResponse.fromJson(response);

      print("Register Success - UserId: ${signupResponse.userId}"); // DEBUG

      emit(SignupSuccess(userId: signupResponse.userId ?? ""));
    } catch (e) {
      print("Register Error in Cubit: $e"); // DEBUG
      String errorMessage = "Registration failed";

      if (e is DioError && e.response?.data?["message"] != null) {
        errorMessage = e.response!.data["message"].toString();
      }

      emit(SignupFailure(signupError: errorMessage));
    }
  }
}
