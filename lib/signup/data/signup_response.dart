class SignupResponse {
  final String? userId;
  final String? message;

  SignupResponse({this.userId, this.message});

  factory SignupResponse.fromJson(Map<String, dynamic> json) {
    // Handle response format từ API:
    // {
    //   "statusCode": 201,
    //   "message": "User created successfully and activated",
    //   "data": [], // hoặc có thể là object chứa user info
    //   "timestamp": "..."
    // }

    String? userId;
    if (json["data"] is Map) {
      userId = json["data"]["userId"]?.toString();
    }

    return SignupResponse(
      userId: userId ?? "", // Nếu không có userId, trả về empty string
      message: json["message"]?.toString() ?? "Unknown response",
    );
  }
}
