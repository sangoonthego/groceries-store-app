import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:groceries_store_app/login/data/login_request.dart';
import 'package:groceries_store_app/login/data/login_response.dart';

part 'login_api.g.dart';

@RestApi(
  baseUrl: "https://us-central1-skin-scanner-3c419.cloudfunctions.net/base/v1",
)
abstract class LoginApi {
  factory LoginApi(Dio dio, {String baseUrl}) = _LoginApi;

  @POST('/auth-service/login')
  Future<LoginResponse> login(@Body() LoginRequest request);
}
