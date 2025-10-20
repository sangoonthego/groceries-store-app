class SignupResponse {
  final String? userId;
  final String? message;

  SignupResponse({this.userId, this.message});

  factory SignupResponse.fromJson(Map<String, dynamic> json) {
    final data = json["data"];
    return SignupResponse(
      userId: data?["userId"] ?? "",
      message: json["message"] ?? "",
    );
  }
}
