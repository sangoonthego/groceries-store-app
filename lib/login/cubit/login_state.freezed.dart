// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$LoginState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(LoginFormModel form) ready,
    required TResult Function() loading,
    required TResult Function(String userId) success,
    required TResult Function(String loginError) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(LoginFormModel form)? ready,
    TResult? Function()? loading,
    TResult? Function(String userId)? success,
    TResult? Function(String loginError)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(LoginFormModel form)? ready,
    TResult Function()? loading,
    TResult Function(String userId)? success,
    TResult Function(String loginError)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoginInitial value) initial,
    required TResult Function(LoginReady value) ready,
    required TResult Function(LoginLoading value) loading,
    required TResult Function(LoginSuccess value) success,
    required TResult Function(LoginFailure value) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoginInitial value)? initial,
    TResult? Function(LoginReady value)? ready,
    TResult? Function(LoginLoading value)? loading,
    TResult? Function(LoginSuccess value)? success,
    TResult? Function(LoginFailure value)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoginInitial value)? initial,
    TResult Function(LoginReady value)? ready,
    TResult Function(LoginLoading value)? loading,
    TResult Function(LoginSuccess value)? success,
    TResult Function(LoginFailure value)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginStateCopyWith<$Res> {
  factory $LoginStateCopyWith(
          LoginState value, $Res Function(LoginState) then) =
      _$LoginStateCopyWithImpl<$Res, LoginState>;
}

/// @nodoc
class _$LoginStateCopyWithImpl<$Res, $Val extends LoginState>
    implements $LoginStateCopyWith<$Res> {
  _$LoginStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$LoginInitialImplCopyWith<$Res> {
  factory _$$LoginInitialImplCopyWith(
          _$LoginInitialImpl value, $Res Function(_$LoginInitialImpl) then) =
      __$$LoginInitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoginInitialImplCopyWithImpl<$Res>
    extends _$LoginStateCopyWithImpl<$Res, _$LoginInitialImpl>
    implements _$$LoginInitialImplCopyWith<$Res> {
  __$$LoginInitialImplCopyWithImpl(
      _$LoginInitialImpl _value, $Res Function(_$LoginInitialImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoginInitialImpl implements LoginInitial {
  const _$LoginInitialImpl();

  @override
  String toString() {
    return 'LoginState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoginInitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(LoginFormModel form) ready,
    required TResult Function() loading,
    required TResult Function(String userId) success,
    required TResult Function(String loginError) failure,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(LoginFormModel form)? ready,
    TResult? Function()? loading,
    TResult? Function(String userId)? success,
    TResult? Function(String loginError)? failure,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(LoginFormModel form)? ready,
    TResult Function()? loading,
    TResult Function(String userId)? success,
    TResult Function(String loginError)? failure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoginInitial value) initial,
    required TResult Function(LoginReady value) ready,
    required TResult Function(LoginLoading value) loading,
    required TResult Function(LoginSuccess value) success,
    required TResult Function(LoginFailure value) failure,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoginInitial value)? initial,
    TResult? Function(LoginReady value)? ready,
    TResult? Function(LoginLoading value)? loading,
    TResult? Function(LoginSuccess value)? success,
    TResult? Function(LoginFailure value)? failure,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoginInitial value)? initial,
    TResult Function(LoginReady value)? ready,
    TResult Function(LoginLoading value)? loading,
    TResult Function(LoginSuccess value)? success,
    TResult Function(LoginFailure value)? failure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class LoginInitial implements LoginState {
  const factory LoginInitial() = _$LoginInitialImpl;
}

/// @nodoc
abstract class _$$LoginReadyImplCopyWith<$Res> {
  factory _$$LoginReadyImplCopyWith(
          _$LoginReadyImpl value, $Res Function(_$LoginReadyImpl) then) =
      __$$LoginReadyImplCopyWithImpl<$Res>;
  @useResult
  $Res call({LoginFormModel form});

  $LoginFormModelCopyWith<$Res> get form;
}

/// @nodoc
class __$$LoginReadyImplCopyWithImpl<$Res>
    extends _$LoginStateCopyWithImpl<$Res, _$LoginReadyImpl>
    implements _$$LoginReadyImplCopyWith<$Res> {
  __$$LoginReadyImplCopyWithImpl(
      _$LoginReadyImpl _value, $Res Function(_$LoginReadyImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? form = null,
  }) {
    return _then(_$LoginReadyImpl(
      form: null == form
          ? _value.form
          : form // ignore: cast_nullable_to_non_nullable
              as LoginFormModel,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $LoginFormModelCopyWith<$Res> get form {
    return $LoginFormModelCopyWith<$Res>(_value.form, (value) {
      return _then(_value.copyWith(form: value));
    });
  }
}

/// @nodoc

class _$LoginReadyImpl implements LoginReady {
  const _$LoginReadyImpl({required this.form});

  @override
  final LoginFormModel form;

  @override
  String toString() {
    return 'LoginState.ready(form: $form)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoginReadyImpl &&
            (identical(other.form, form) || other.form == form));
  }

  @override
  int get hashCode => Object.hash(runtimeType, form);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoginReadyImplCopyWith<_$LoginReadyImpl> get copyWith =>
      __$$LoginReadyImplCopyWithImpl<_$LoginReadyImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(LoginFormModel form) ready,
    required TResult Function() loading,
    required TResult Function(String userId) success,
    required TResult Function(String loginError) failure,
  }) {
    return ready(form);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(LoginFormModel form)? ready,
    TResult? Function()? loading,
    TResult? Function(String userId)? success,
    TResult? Function(String loginError)? failure,
  }) {
    return ready?.call(form);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(LoginFormModel form)? ready,
    TResult Function()? loading,
    TResult Function(String userId)? success,
    TResult Function(String loginError)? failure,
    required TResult orElse(),
  }) {
    if (ready != null) {
      return ready(form);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoginInitial value) initial,
    required TResult Function(LoginReady value) ready,
    required TResult Function(LoginLoading value) loading,
    required TResult Function(LoginSuccess value) success,
    required TResult Function(LoginFailure value) failure,
  }) {
    return ready(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoginInitial value)? initial,
    TResult? Function(LoginReady value)? ready,
    TResult? Function(LoginLoading value)? loading,
    TResult? Function(LoginSuccess value)? success,
    TResult? Function(LoginFailure value)? failure,
  }) {
    return ready?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoginInitial value)? initial,
    TResult Function(LoginReady value)? ready,
    TResult Function(LoginLoading value)? loading,
    TResult Function(LoginSuccess value)? success,
    TResult Function(LoginFailure value)? failure,
    required TResult orElse(),
  }) {
    if (ready != null) {
      return ready(this);
    }
    return orElse();
  }
}

abstract class LoginReady implements LoginState {
  const factory LoginReady({required final LoginFormModel form}) =
      _$LoginReadyImpl;

  LoginFormModel get form;
  @JsonKey(ignore: true)
  _$$LoginReadyImplCopyWith<_$LoginReadyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoginLoadingImplCopyWith<$Res> {
  factory _$$LoginLoadingImplCopyWith(
          _$LoginLoadingImpl value, $Res Function(_$LoginLoadingImpl) then) =
      __$$LoginLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoginLoadingImplCopyWithImpl<$Res>
    extends _$LoginStateCopyWithImpl<$Res, _$LoginLoadingImpl>
    implements _$$LoginLoadingImplCopyWith<$Res> {
  __$$LoginLoadingImplCopyWithImpl(
      _$LoginLoadingImpl _value, $Res Function(_$LoginLoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoginLoadingImpl implements LoginLoading {
  const _$LoginLoadingImpl();

  @override
  String toString() {
    return 'LoginState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoginLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(LoginFormModel form) ready,
    required TResult Function() loading,
    required TResult Function(String userId) success,
    required TResult Function(String loginError) failure,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(LoginFormModel form)? ready,
    TResult? Function()? loading,
    TResult? Function(String userId)? success,
    TResult? Function(String loginError)? failure,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(LoginFormModel form)? ready,
    TResult Function()? loading,
    TResult Function(String userId)? success,
    TResult Function(String loginError)? failure,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoginInitial value) initial,
    required TResult Function(LoginReady value) ready,
    required TResult Function(LoginLoading value) loading,
    required TResult Function(LoginSuccess value) success,
    required TResult Function(LoginFailure value) failure,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoginInitial value)? initial,
    TResult? Function(LoginReady value)? ready,
    TResult? Function(LoginLoading value)? loading,
    TResult? Function(LoginSuccess value)? success,
    TResult? Function(LoginFailure value)? failure,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoginInitial value)? initial,
    TResult Function(LoginReady value)? ready,
    TResult Function(LoginLoading value)? loading,
    TResult Function(LoginSuccess value)? success,
    TResult Function(LoginFailure value)? failure,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class LoginLoading implements LoginState {
  const factory LoginLoading() = _$LoginLoadingImpl;
}

/// @nodoc
abstract class _$$LoginSuccessImplCopyWith<$Res> {
  factory _$$LoginSuccessImplCopyWith(
          _$LoginSuccessImpl value, $Res Function(_$LoginSuccessImpl) then) =
      __$$LoginSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String userId});
}

/// @nodoc
class __$$LoginSuccessImplCopyWithImpl<$Res>
    extends _$LoginStateCopyWithImpl<$Res, _$LoginSuccessImpl>
    implements _$$LoginSuccessImplCopyWith<$Res> {
  __$$LoginSuccessImplCopyWithImpl(
      _$LoginSuccessImpl _value, $Res Function(_$LoginSuccessImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
  }) {
    return _then(_$LoginSuccessImpl(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$LoginSuccessImpl implements LoginSuccess {
  const _$LoginSuccessImpl({required this.userId});

  @override
  final String userId;

  @override
  String toString() {
    return 'LoginState.success(userId: $userId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoginSuccessImpl &&
            (identical(other.userId, userId) || other.userId == userId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoginSuccessImplCopyWith<_$LoginSuccessImpl> get copyWith =>
      __$$LoginSuccessImplCopyWithImpl<_$LoginSuccessImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(LoginFormModel form) ready,
    required TResult Function() loading,
    required TResult Function(String userId) success,
    required TResult Function(String loginError) failure,
  }) {
    return success(userId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(LoginFormModel form)? ready,
    TResult? Function()? loading,
    TResult? Function(String userId)? success,
    TResult? Function(String loginError)? failure,
  }) {
    return success?.call(userId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(LoginFormModel form)? ready,
    TResult Function()? loading,
    TResult Function(String userId)? success,
    TResult Function(String loginError)? failure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(userId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoginInitial value) initial,
    required TResult Function(LoginReady value) ready,
    required TResult Function(LoginLoading value) loading,
    required TResult Function(LoginSuccess value) success,
    required TResult Function(LoginFailure value) failure,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoginInitial value)? initial,
    TResult? Function(LoginReady value)? ready,
    TResult? Function(LoginLoading value)? loading,
    TResult? Function(LoginSuccess value)? success,
    TResult? Function(LoginFailure value)? failure,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoginInitial value)? initial,
    TResult Function(LoginReady value)? ready,
    TResult Function(LoginLoading value)? loading,
    TResult Function(LoginSuccess value)? success,
    TResult Function(LoginFailure value)? failure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class LoginSuccess implements LoginState {
  const factory LoginSuccess({required final String userId}) =
      _$LoginSuccessImpl;

  String get userId;
  @JsonKey(ignore: true)
  _$$LoginSuccessImplCopyWith<_$LoginSuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoginFailureImplCopyWith<$Res> {
  factory _$$LoginFailureImplCopyWith(
          _$LoginFailureImpl value, $Res Function(_$LoginFailureImpl) then) =
      __$$LoginFailureImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String loginError});
}

/// @nodoc
class __$$LoginFailureImplCopyWithImpl<$Res>
    extends _$LoginStateCopyWithImpl<$Res, _$LoginFailureImpl>
    implements _$$LoginFailureImplCopyWith<$Res> {
  __$$LoginFailureImplCopyWithImpl(
      _$LoginFailureImpl _value, $Res Function(_$LoginFailureImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loginError = null,
  }) {
    return _then(_$LoginFailureImpl(
      loginError: null == loginError
          ? _value.loginError
          : loginError // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$LoginFailureImpl implements LoginFailure {
  const _$LoginFailureImpl({required this.loginError});

  @override
  final String loginError;

  @override
  String toString() {
    return 'LoginState.failure(loginError: $loginError)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoginFailureImpl &&
            (identical(other.loginError, loginError) ||
                other.loginError == loginError));
  }

  @override
  int get hashCode => Object.hash(runtimeType, loginError);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoginFailureImplCopyWith<_$LoginFailureImpl> get copyWith =>
      __$$LoginFailureImplCopyWithImpl<_$LoginFailureImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(LoginFormModel form) ready,
    required TResult Function() loading,
    required TResult Function(String userId) success,
    required TResult Function(String loginError) failure,
  }) {
    return failure(loginError);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(LoginFormModel form)? ready,
    TResult? Function()? loading,
    TResult? Function(String userId)? success,
    TResult? Function(String loginError)? failure,
  }) {
    return failure?.call(loginError);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(LoginFormModel form)? ready,
    TResult Function()? loading,
    TResult Function(String userId)? success,
    TResult Function(String loginError)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(loginError);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoginInitial value) initial,
    required TResult Function(LoginReady value) ready,
    required TResult Function(LoginLoading value) loading,
    required TResult Function(LoginSuccess value) success,
    required TResult Function(LoginFailure value) failure,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoginInitial value)? initial,
    TResult? Function(LoginReady value)? ready,
    TResult? Function(LoginLoading value)? loading,
    TResult? Function(LoginSuccess value)? success,
    TResult? Function(LoginFailure value)? failure,
  }) {
    return failure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoginInitial value)? initial,
    TResult Function(LoginReady value)? ready,
    TResult Function(LoginLoading value)? loading,
    TResult Function(LoginSuccess value)? success,
    TResult Function(LoginFailure value)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class LoginFailure implements LoginState {
  const factory LoginFailure({required final String loginError}) =
      _$LoginFailureImpl;

  String get loginError;
  @JsonKey(ignore: true)
  _$$LoginFailureImplCopyWith<_$LoginFailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
