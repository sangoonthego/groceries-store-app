import 'package:freezed_annotation/freezed_annotation.dart';
import '../models/login_form_model.dart';

part 'login_state.freezed.dart';

@freezed
class LoginState with _$LoginState {
  // Initial state
  const factory LoginState.initial() = LoginInitial;

  // Ready state with form data
  const factory LoginState.ready({required LoginFormModel form}) = LoginReady;

  // Loading state
  const factory LoginState.loading() = LoginLoading;

  // Success state
  const factory LoginState.success({required String userId}) = LoginSuccess;

  // Error state
  const factory LoginState.failure({required String loginError}) = LoginFailure;
}
