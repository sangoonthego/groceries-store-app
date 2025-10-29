import "package:dio/dio.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:groceries_store_app/login/cubit/login_state.dart";
import "package:groceries_store_app/services/api_service.dart";
import "package:groceries_store_app/storage/token_storage.dart";
import "package:groceries_store_app/login/data/login_request.dart";
import "package:groceries_store_app/login/data/login_response.dart";

class LoginCubit extends Cubit<LoginState> {
  // init state must be LoginInitial or LoginReady
  LoginCubit() : super(const LoginReady(email: "", password: ""));

  //final Dio _dio = ApiService().dio;

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

  final Dio dio = Dio();

  Future<void> login() async {
    if (state is! LoginReady) return;

    final currentData = currentState;
    final email = currentData.email;
    final password = currentData.password;

    //valid input
    final emailInvalid = email.length < 6 || !email.contains("@");
    final passInvalid = password.length < 6;

    if (emailInvalid || passInvalid) {
      emit(
        currentData.copyWith(
          emailInvalid: emailInvalid,
          passInvalid: passInvalid,
        ),
      );
      return;
    }

    //loading state
    emit(const LoginLoading());

    try {
      final loginRequest = LoginRequest(email: email, password: password);
      final response = await dio.post(
        'https://us-central1-skin-scanner-3c419.cloudfunctions.net/base/v1/auth-service/login', //endpoint
        data: loginRequest.toJson(),
      );

      if (response.statusCode == 200) {
        print("Login Response: ${response.data}"); // DEBUG

        final data = response.data['data'];
        final tokens = data['tokens'] ?? {};
        final accessToken = tokens['accessToken'] ?? '';
        final refreshToken = tokens['refreshToken'] ?? '';

        print("Extracted tokens:"); // DEBUG
        print("Access Token: $accessToken"); // DEBUG
        print("Refresh Token: $refreshToken"); // DEBUG

        await TokenStorage.saveTokens(accessToken, refreshToken);

        final user = data['user'] ?? {};
        final userId = user['userId'] ?? '';
        emit(LoginSuccess(userId: userId));
      }
      // if (response.statusCode == 200) {
      //   final data = response.data['data'];
      //   final user = data['user'];
      //   final tokens = data['tokens'];
      //   final accessToken = tokens['accessToken'] ?? '';
      //   final refreshToken = tokens['refreshToken'] ?? '';
      //   final userId = user['userId'] ?? '';
      //   await TokenStorage.saveTokens(accessToken, refreshToken);
      //   emit(LoginSuccess(userId: userId));
      // }
      else {
        emit(const LoginFailure(loginError: "Incorrect Account or Password"));
      }
    } on DioException catch (e) {
      String message = "Error connecting to Server";
      if (e.response != null && e.response?.data != null) {
        message = e.response?.data["message"] ?? message;
      }
      emit(LoginFailure(loginError: message));
    } catch (e) {
      emit(const LoginFailure(loginError: "Undefined Error"));
    }
  }
}
