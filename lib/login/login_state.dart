import "package:equatable/equatable.dart";

class LoginState extends Equatable {
  final String email;
  final String password;
  final bool emailInvalid;
  final bool passInvalid;
  final bool showPassword;
  final bool isLoading;
  final bool isLoginSuccess;

  const LoginState({
    required this.email,
    required this.password,
    this.emailInvalid = false,
    this.passInvalid = false,
    this.showPassword = false,
    this.isLoading = false,
    this.isLoginSuccess = false,
  });

  LoginState copyWith({
    String? email,
    String? password,
    bool? emailInvalid,
    bool? passInvalid,
    bool? showPassword,
    bool? isLoading,
    bool? isLoginSuccess,
  }) {
    return LoginState(
      email: email ?? this.email,
      password: password ?? this.password,
      emailInvalid: emailInvalid ?? this.emailInvalid,
      passInvalid: passInvalid ?? this.passInvalid,
      showPassword: showPassword ?? this.showPassword,
      isLoading: isLoading ?? this.isLoading,
      isLoginSuccess: isLoginSuccess ?? this.isLoginSuccess,
    );
  }

  @override
  List<Object?> get props => [
    email,
    password,
    emailInvalid,
    passInvalid,
    showPassword,
    isLoading,
    isLoginSuccess,
  ];
}
