// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: non_constant_identifier_names, unnecessary_this, prefer_const_constructors

part of 'login_response.dart';

LoginResponse _$LoginResponseFromJson(Map<String, dynamic> json) {
  return _LoginResponse(
    accessToken: json['accessToken'] as String,
    refreshToken: json['refreshToken'] as String,
    userId: json['userId'] as String? ?? '',
  );
}

Map<String, dynamic> _$LoginResponseToJson(LoginResponse instance) =>
    <String, dynamic>{
      'accessToken': instance.accessToken,
      'refreshToken': instance.refreshToken,
      'userId': instance.userId,
    };
