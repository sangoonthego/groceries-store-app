import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_form_model.freezed.dart';

@freezed
class LoginFormModel with _$LoginFormModel {
  const factory LoginFormModel({
    @Default('') String email,
    @Default('') String password,
    @Default(false) bool showPassword,
    @Default(false) bool emailInvalid,
    @Default(false) bool passInvalid,
  }) = _LoginFormModel;
}
