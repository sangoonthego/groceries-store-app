import "package:equatable/equatable.dart";

class SignUpState extends Equatable {
  final String firstName;
  final String lastName;
  final String userName;
  final String email;
  final String password;
  final bool firstNameInvalid;
  final bool lastNameInvalid;
  final bool userNameInvalid;
  final bool emailInvalid;
  final bool passwordInvalid;
  final bool showPassword;
  final bool isLoading;
  final bool isSignUpSuccess;

  const SignUpState({
    required this.firstName,
    required this.lastName,
    required this.userName,
    required this.email,
    required this.password,
    this.firstNameInvalid = false,
    this.lastNameInvalid = false,
    this.userNameInvalid = false,
    this.emailInvalid = false,
    this.passwordInvalid = false,
    this.showPassword = false,
    this.isLoading = false,
    this.isSignUpSuccess = false,
  });

  SignUpState copyWith({
    String? firstName,
    String? lastName,
    String? userName,
    String? email,
    String? password,
    bool? firstNameInvalid,
    bool? lastNameInvalid,
    bool? userNameInvalid,
    bool? emailInvalid,
    bool? passwordInvalid,
    bool? showPassword,
    bool? isLoading,
    bool? isSignUpSuccess,
  }) {
    return SignUpState(
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      userName: userName ?? this.userName,
      email: email ?? this.email,
      password: password ?? this.password,
      firstNameInvalid: firstNameInvalid ?? this.firstNameInvalid,
      lastNameInvalid: lastNameInvalid ?? this.lastNameInvalid,
      userNameInvalid: userNameInvalid ?? this.userNameInvalid,
      emailInvalid: emailInvalid ?? this.emailInvalid,
      passwordInvalid: passwordInvalid ?? this.passwordInvalid,
      showPassword: showPassword ?? this.showPassword,
      isLoading: isLoading ?? this.isLoading,
      isSignUpSuccess: isSignUpSuccess ?? this.isSignUpSuccess,
    );
  }

  @override
  List<Object?> get props => [
    firstName,
    lastName,
    userName,
    email,
    password,
    firstNameInvalid,
    lastNameInvalid,
    userNameInvalid,
    emailInvalid,
    passwordInvalid,
    showPassword,
    isLoading,
    isSignUpSuccess,
  ];
}
