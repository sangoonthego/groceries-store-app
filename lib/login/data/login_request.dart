class LoginRequest {
  final String email;
  final String password;

  LoginRequest({required this.email, required this.password});

  //convert object into json to send api
  Map<String, dynamic> toJson() {
    return {"email": email, "password": password};
  }

  // LoginRequest copyWith({String? email, String? password}) {
  //   return LoginRequest(
  //     email: email ?? this.email,
  //     password: password ?? this.password,
  //   );
  // }

  // @override
  // String toString() => 'LoginRequest(email: $email, password: $password)';
}
