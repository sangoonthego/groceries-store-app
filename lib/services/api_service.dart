import 'package:dio/dio.dart';
import '../storage/token_storage.dart';

class ApiService {
  final Dio dio = Dio();

  Future<Map<String, dynamic>> getUser() async {
    final accessToken = await TokenStorage.getAccessToken();
    final response = await dio.get(
      "https://us-central1-skin-scanner-3c419.cloudfunctions.net/base/v1/user-service/me",
      options: Options(
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $accessToken",
        },
      ),
    );
    if (response.statusCode == 200) {
      return response.data as Map<String, dynamic>;
    } else {
      throw Exception("Cannot get User: &{response.statusMessage}");
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
