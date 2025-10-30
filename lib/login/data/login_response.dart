import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_response.freezed.dart';
part 'login_response.g.dart';

@freezed
class LoginResponse with _$LoginResponse {
  const factory LoginResponse({
    required String accessToken,
    required String refreshToken,
    @Default('') String userId,
  }) = _LoginResponse;

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    // Log the raw response first
    print('Raw Login Response JSON: $json');

    // Check if we have data structure
    if (json['data'] == null) {
      throw FormatException('Response is missing data field: $json');
    }

    final data = json['data'] as Map<String, dynamic>;
    final tokens = data['tokens'] as Map<String, dynamic>?;
    final user = data['user'] as Map<String, dynamic>?;

    if (tokens == null) {
      throw FormatException('Response is missing tokens field: $data');
    }

    return _$LoginResponseFromJson({
      'accessToken': tokens['accessToken'] as String? ?? '',
      'refreshToken': tokens['refreshToken'] as String? ?? '',
      'userId': user?['userId'] as String? ?? '',
    });
  }
}
