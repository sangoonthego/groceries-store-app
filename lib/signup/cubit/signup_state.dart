import "package:equatable/equatable.dart";

abstract class SignupState extends Equatable {
  const SignupState();

  @override
  List<Object?> get props => [];
}

class SignupInitial extends SignupState {
  const SignupInitial();
}

class SignupReady extends SignupState {
  final String firstName;
  final String lastName;
  final String userName;
  final String email;
  final String password;
  final bool showPassword;

  final bool firstNameInvalid;
  final bool lastNameInvalid;
  final bool userNameInvalid;
  final bool emailInvalid;
  final bool passwordInvalid;

  const SignupReady({
    required this.firstName,
    required this.lastName,
    required this.userName,
    required this.email,
    required this.password,
    this.showPassword = false,
    this.firstNameInvalid = false,
    this.lastNameInvalid = false,
    this.userNameInvalid = false,
    this.emailInvalid = false,
    this.passwordInvalid = false,
  });

  SignupReady copyWith({
    String? firstName,
    String? lastName,
    String? userName,
    String? email,
    String? password,
    bool? showPassword,
    bool? firstNameInvalid,
    bool? lastNameInvalid,
    bool? userNameInvalid,
    bool? emailInvalid,
    bool? passwordInvalid,
  }) {
    return SignupReady(
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      userName: userName ?? this.userName,
      email: email ?? this.email,
      password: password ?? this.password,
      showPassword: showPassword ?? this.showPassword,
      firstNameInvalid: firstNameInvalid ?? this.firstNameInvalid,
      lastNameInvalid: lastNameInvalid ?? this.lastNameInvalid,
      userNameInvalid: userNameInvalid ?? this.userNameInvalid,
      emailInvalid: emailInvalid ?? this.emailInvalid,
      passwordInvalid: passwordInvalid ?? this.passwordInvalid,
    );
  }

  @override
  List<Object?> get props => [
    firstName,
    lastName,
    userName,
    email,
    password,
    showPassword,
    firstNameInvalid,
    lastNameInvalid,
    userNameInvalid,
    emailInvalid,
    passwordInvalid,
  ];
}

class SignupLoading extends SignupState {
  const SignupLoading();
}

class SignupSuccess extends SignupState {
  final String userId;
  const SignupSuccess({required this.userId});

  @override
  List<Object?> get props => [userId];
}

class SignupFailure extends SignupState {
  final String signupError;

  const SignupFailure({required this.signupError});

  @override
  List<Object?> get props => [signupError];
}
