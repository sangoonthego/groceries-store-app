class ProfileResponse {
  final String accessToken;

  ProfileResponse({required this.accessToken});

  factory ProfileResponse.fromJson(Map<String, dynamic> json) {
    final tokens = json["data"]?["tokens"] ?? {};

    return ProfileResponse(accessToken: tokens?["accessToken"] ?? '');
  }
}
