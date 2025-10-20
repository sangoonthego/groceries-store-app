class SignupRequest {
  final String firstName;
  final String lastName;
  final String userName;
  final String email;
  final String password;

  SignupRequest({
    required this.firstName,
    required this.lastName,
    required this.userName,
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toJson() => {
    "firstName": firstName,
    "lastName": lastName,
    "username": userName,
    "email": email,
    "password": password,
  };
}
