import 'package:dio/dio.dart';
import '../storage/token_storage.dart';

class ApiService {
  final Dio dio;
  static const String baseUrl =
      "https://us-central1-skin-scanner-3c419.cloudfunctions.net/base/v1";

  ApiService()
    : dio = Dio(
        BaseOptions(
          baseUrl: baseUrl,
          connectTimeout: const Duration(seconds: 5),
          receiveTimeout: const Duration(seconds: 3),
        ),
      );

  Future<Map<String, dynamic>> register(Map<String, dynamic> payload) async {
    try {
      final response = await dio.post(
        "/auth-service/register",
        data: payload,
        options: Options(
          headers: {"Content-Type": "application/json"},
          validateStatus: (status) => status! < 500,
        ),
      );

      print("Register Response: ${response.data}"); // DEBUG

      // API trả về 201 cho successful registration
      if (response.statusCode == 201) {
        final data = response.data;
        if (data is Map<String, dynamic>) return data;
        return {
          "statusCode": 201,
          "message": "Registration successful",
          "data": data,
        };
      }

      // Debug log khi nhận error response
      print("Error Response Status: ${response.statusCode}");
      print("Error Response Data: ${response.data}");
      print("Error Response Headers: ${response.headers}");

      final errorMsg = response.data is Map
          ? response.data["message"] ?? "Registration failed"
          : "Registration failed";

      print("Final Error Message: $errorMsg");

      throw DioException(
        requestOptions: response.requestOptions,
        response: response,
        error: errorMsg,
      );
    } catch (e) {
      print("Register Error: $e"); // DEBUG
      rethrow;
    }
  }

  Future<Map<String, dynamic>> getUser() async {
    try {
      final accessToken = await TokenStorage.getAccessToken();
      if (accessToken == null || accessToken.isEmpty) {
        throw Exception("No access token available");
      }

      print("Getting user profile with token: $accessToken"); // DEBUG

      final response = await dio.get(
        "/user-service/me",
        options: Options(
          headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer $accessToken",
          },
          validateStatus: (status) => status! < 500,
        ),
      );

      print("Get User Response: ${response.data}"); // DEBUG

      if (response.statusCode == 200) {
        if (response.data is! Map<String, dynamic>) {
          throw Exception("Invalid response format");
        }

        final data = response.data as Map<String, dynamic>;
        final userData = data['data'] as Map<String, dynamic>?;

        if (userData == null) {
          throw Exception("No user data in response");
        }

        return {
          'data': {
            'user': {
              'username': userData['username'] ?? '',
              'email': userData['email'] ?? '',
              'avatar': userData['avatar'],
            },
          },
        };
      }

      throw DioException(
        requestOptions: response.requestOptions,
        response: response,
        error: response.data["message"] ?? "Failed to get user profile",
      );
    } catch (e) {
      print("Get User Error: $e"); // DEBUG
      rethrow;
    }
  }

  // register
  // Future<Response> register(
  //   String username,
  //   String email,
  //   String password,
  // ) async {
  //   try {
  //     final response = await dio.post(
  //       '/register',
  //       data: {'username': username, 'email': email, 'password': password},
  //     );
  //     return response;
  //   } catch (e) {
  //     rethrow;
  //   }
  // }

  // // login
  // Future<Response> login(String email, String password) async {
  //   try {
  //     final response = await dio.post(
  //       '/login',
  //       data: {'email': email, 'password': password},
  //     );

  //     final accessToken = response.data['access_token'];
  //     final refreshToken = response.data['refresh_token'];

  //     await TokenStorage.saveTokens(accessToken, refreshToken);
  //     return response;
  //   } catch (e) {
  //     rethrow;
  //   }
  // }

  // // get user infor
  // Future<Response> getUserInfo() async {
  //   try {
  //     final token = await TokenStorage.getAccessToken();
  //     final response = await dio.get(
  //       '/get-user-info',
  //       options: Options(headers: {'Authorization': 'Bearer $token'}),
  //     );
  //     return response;
  //   } catch (e) {
  //     rethrow;
  //   }
  // }

  // // delete all scan
  // Future<Response> deleteAllScan() async {
  //   try {
  //     final token = await TokenStorage.getAccessToken();
  //     final response = await dio.delete(
  //       '/delete-all-scan',
  //       options: Options(headers: {'Authorization': 'Bearer $token'}),
  //     );
  //     return response;
  //   } catch (e) {
  //     rethrow;
  //   }
  // }
}
