class LoginResponse {
  final String accessToken;
  final String refreshToken;
  //final String? message;

  LoginResponse({
    required this.accessToken,
    required this.refreshToken,
    //this.message,
  });

  // parse json data
  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    final tokens = json["data"]?["tokens"] ?? {};

    return LoginResponse(
      accessToken: tokens?["accessToken"] ?? '',
      refreshToken: tokens?["refreshToken"] ?? '',
      //message: json["message"],
    );
  }

  // Map<String, dynamic> toJson() {
  //   return {
  //     "accessToken": accessToken,
  //     "refreshToken": refreshToken,
  //     "message": message,
  //   };
  // }

  // @override
  // String toString() =>
  //     'LoginResponse(accessToken: $accessToken, refreshToken: $refreshToken, message: $message)';
}
