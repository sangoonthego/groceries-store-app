import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:groceries_store_app/login/api/login_api.dart';
import "package:groceries_store_app/login/data/login_response.dart";
import 'package:groceries_store_app/login/cubit/login_state.dart';
import 'package:groceries_store_app/login/models/login_form_model.dart';
import 'package:groceries_store_app/services/api_service.dart';
import 'package:groceries_store_app/storage/token_storage.dart';
import 'package:groceries_store_app/login/data/login_request.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginState.ready(form: const LoginFormModel()));

  final _apiService = ApiService();

  void togglePasswordVisibility() {
    state.mapOrNull(
      ready: (ready) {
        emit(
          LoginState.ready(
            form: ready.form.copyWith(showPassword: !ready.form.showPassword),
          ),
        );
      },
    );
  }

  void onChangeEmail(String email) {
    state.mapOrNull(
      ready: (ready) {
        emit(
          LoginState.ready(
            form: ready.form.copyWith(email: email, emailInvalid: false),
          ),
        );
      },
    );
  }

  void onChangePassword(String password) {
    state.mapOrNull(
      ready: (ready) {
        emit(
          LoginState.ready(
            form: ready.form.copyWith(password: password, passInvalid: false),
          ),
        );
      },
    );
  }

  bool _validateForm(LoginFormModel form) {
    final emailInvalid = form.email.length < 6 || !form.email.contains('@');
    final passInvalid = form.password.length < 6;

    if (emailInvalid || passInvalid) {
      emit(
        LoginState.ready(
          form: form.copyWith(
            emailInvalid: emailInvalid,
            passInvalid: passInvalid,
          ),
        ),
      );
      return false;
    }
    return true;
  }

  Future<void> login() async {
    state.mapOrNull(
      ready: (ready) async {
        if (!_validateForm(ready.form)) return;

        emit(const LoginState.loading());

        try {
          final loginRequest = LoginRequest(
            email: ready.form.email,
            password: ready.form.password,
          );

          print('Login Request: ${loginRequest.toJson()}'); // Debug log

          final loginApi = LoginApi(
            _apiService.dio,
            baseUrl: ApiService.baseUrl,
          );

          final loginResponse = await loginApi.login(loginRequest);
          print('Login Response Object: $loginResponse'); // Debug log

          // Validate tokens before saving
          if (loginResponse.accessToken.isEmpty ||
              loginResponse.refreshToken.isEmpty) {
            throw Exception('Invalid token data received from server');
          }

          // Print tokens for debugging
          print('Retrieved Access Token: ${loginResponse.accessToken}');
          print('Retrieved Refresh Token: ${loginResponse.refreshToken}');

          await TokenStorage.saveTokens(
            loginResponse.accessToken,
            loginResponse.refreshToken,
          );

          if (loginResponse.userId.isEmpty) {
            print('Warning: Empty userId in response');
          }

          emit(LoginState.success(userId: loginResponse.userId));
        } on DioException catch (e) {
          print('DioException: $e'); // Debug log
          print('DioError Type: ${e.type}');
          print('DioError Response: ${e.response?.data}'); // Debug log
          print('DioError Status Code: ${e.response?.statusCode}');

          String errorMessage;
          if (e.type == DioExceptionType.connectionTimeout ||
              e.type == DioExceptionType.receiveTimeout ||
              e.type == DioExceptionType.sendTimeout) {
            errorMessage =
                'Connection timeout. Please check your internet connection.';
          } else if (e.response != null) {
            // Get error message from server response
            final responseData = e.response?.data;
            if (responseData is Map<String, dynamic>) {
              errorMessage =
                  responseData['message'] as String? ??
                  responseData['error'] as String? ??
                  'Server error: ${e.response?.statusCode}';
            } else {
              errorMessage = 'Unexpected server response format';
            }
          } else {
            print('Connection Error Type: ${e.type}');
            print('Connection Error Message: ${e.message}');
            print('Connection Error: ${e.error}');
            
            switch (e.type) {
              case DioExceptionType.connectionError:
                errorMessage = 'Could not connect to the server. Please check your internet connection and try again.';
                break;
              case DioExceptionType.badResponse:
                errorMessage = 'Server returned an invalid response. Please try again later.';
                break;
              case DioExceptionType.badCertificate:
                errorMessage = 'Security certificate issue. Please check your connection security.';
                break;
              default:
                errorMessage = 'Network error: ${e.message}. Please check your connection and try again.';
            }
          }

          emit(LoginState.failure(loginError: errorMessage));
        } catch (e, stackTrace) {
          print('Error during login: $e'); // Debug log
          print('Stack trace: $stackTrace'); // Debug log
          emit(
            LoginState.failure(
              loginError: 'An unexpected error occurred. Please try again.',
            ),
          );
        }
      },
    );
  }
}
