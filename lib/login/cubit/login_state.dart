import "package:equatable/equatable.dart";

// abstract base class
abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object?> get props => [];
}

// init State
class LoginInitial extends LoginState {
  const LoginInitial();
}

// data/ready state
// current data of form
class LoginReady extends LoginState {
  final String email;
  final String password;
  final bool showPassword;

  // valid variable
  final bool emailInvalid;
  final bool passInvalid;

  const LoginReady({
    required this.email,
    required this.password,
    this.showPassword = false,
    this.emailInvalid = false,
    this.passInvalid = false,
  });

  // copyWith for easily change input data
  LoginReady copyWith({
    String? email,
    String? password,
    bool? showPassword,
    bool? emailInvalid,
    bool? passInvalid,
  }) {
    return LoginReady(
      email: email ?? this.email,
      password: password ?? this.password,
      showPassword: showPassword ?? this.showPassword,
      emailInvalid: emailInvalid ?? this.emailInvalid,
      passInvalid: passInvalid ?? this.passInvalid,
    );
  }

  @override
  List<Object?> get props => [
    email,
    password,
    showPassword,
    emailInvalid,
    passInvalid,
  ];
}

// loading state (handle state (when call login API))
class LoginLoading extends LoginState {
  const LoginLoading();
}

// success state
class LoginSuccess extends LoginState {
  final String userId;
  const LoginSuccess({required this.userId});

  @override
  List<Object?> get props => [userId];
}

// error state
class LoginFailure extends LoginState {
  final String loginError;

  const LoginFailure({required this.loginError});

  @override
  List<Object?> get props => [loginError];
}
