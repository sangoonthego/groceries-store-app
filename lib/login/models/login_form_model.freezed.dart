// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_form_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$LoginFormModel {
  String get email => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  bool get showPassword => throw _privateConstructorUsedError;
  bool get emailInvalid => throw _privateConstructorUsedError;
  bool get passInvalid => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LoginFormModelCopyWith<LoginFormModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginFormModelCopyWith<$Res> {
  factory $LoginFormModelCopyWith(
          LoginFormModel value, $Res Function(LoginFormModel) then) =
      _$LoginFormModelCopyWithImpl<$Res, LoginFormModel>;
  @useResult
  $Res call(
      {String email,
      String password,
      bool showPassword,
      bool emailInvalid,
      bool passInvalid});
}

/// @nodoc
class _$LoginFormModelCopyWithImpl<$Res, $Val extends LoginFormModel>
    implements $LoginFormModelCopyWith<$Res> {
  _$LoginFormModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
    Object? showPassword = null,
    Object? emailInvalid = null,
    Object? passInvalid = null,
  }) {
    return _then(_value.copyWith(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      showPassword: null == showPassword
          ? _value.showPassword
          : showPassword // ignore: cast_nullable_to_non_nullable
              as bool,
      emailInvalid: null == emailInvalid
          ? _value.emailInvalid
          : emailInvalid // ignore: cast_nullable_to_non_nullable
              as bool,
      passInvalid: null == passInvalid
          ? _value.passInvalid
          : passInvalid // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LoginFormModelImplCopyWith<$Res>
    implements $LoginFormModelCopyWith<$Res> {
  factory _$$LoginFormModelImplCopyWith(_$LoginFormModelImpl value,
          $Res Function(_$LoginFormModelImpl) then) =
      __$$LoginFormModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String email,
      String password,
      bool showPassword,
      bool emailInvalid,
      bool passInvalid});
}

/// @nodoc
class __$$LoginFormModelImplCopyWithImpl<$Res>
    extends _$LoginFormModelCopyWithImpl<$Res, _$LoginFormModelImpl>
    implements _$$LoginFormModelImplCopyWith<$Res> {
  __$$LoginFormModelImplCopyWithImpl(
      _$LoginFormModelImpl _value, $Res Function(_$LoginFormModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
    Object? showPassword = null,
    Object? emailInvalid = null,
    Object? passInvalid = null,
  }) {
    return _then(_$LoginFormModelImpl(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      showPassword: null == showPassword
          ? _value.showPassword
          : showPassword // ignore: cast_nullable_to_non_nullable
              as bool,
      emailInvalid: null == emailInvalid
          ? _value.emailInvalid
          : emailInvalid // ignore: cast_nullable_to_non_nullable
              as bool,
      passInvalid: null == passInvalid
          ? _value.passInvalid
          : passInvalid // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$LoginFormModelImpl implements _LoginFormModel {
  const _$LoginFormModelImpl(
      {this.email = '',
      this.password = '',
      this.showPassword = false,
      this.emailInvalid = false,
      this.passInvalid = false});

  @override
  @JsonKey()
  final String email;
  @override
  @JsonKey()
  final String password;
  @override
  @JsonKey()
  final bool showPassword;
  @override
  @JsonKey()
  final bool emailInvalid;
  @override
  @JsonKey()
  final bool passInvalid;

  @override
  String toString() {
    return 'LoginFormModel(email: $email, password: $password, showPassword: $showPassword, emailInvalid: $emailInvalid, passInvalid: $passInvalid)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoginFormModelImpl &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.showPassword, showPassword) ||
                other.showPassword == showPassword) &&
            (identical(other.emailInvalid, emailInvalid) ||
                other.emailInvalid == emailInvalid) &&
            (identical(other.passInvalid, passInvalid) ||
                other.passInvalid == passInvalid));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, email, password, showPassword, emailInvalid, passInvalid);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoginFormModelImplCopyWith<_$LoginFormModelImpl> get copyWith =>
      __$$LoginFormModelImplCopyWithImpl<_$LoginFormModelImpl>(
          this, _$identity);
}

abstract class _LoginFormModel implements LoginFormModel {
  const factory _LoginFormModel(
      {final String email,
      final String password,
      final bool showPassword,
      final bool emailInvalid,
      final bool passInvalid}) = _$LoginFormModelImpl;

  @override
  String get email;
  @override
  String get password;
  @override
  bool get showPassword;
  @override
  bool get emailInvalid;
  @override
  bool get passInvalid;
  @override
  @JsonKey(ignore: true)
  _$$LoginFormModelImplCopyWith<_$LoginFormModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
