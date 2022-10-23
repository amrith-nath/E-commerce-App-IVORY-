// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'login_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$LoginEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() onTap,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? onTap,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? onTap,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OnTap value) onTap,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OnTap value)? onTap,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OnTap value)? onTap,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginEventCopyWith<$Res> {
  factory $LoginEventCopyWith(
          LoginEvent value, $Res Function(LoginEvent) then) =
      _$LoginEventCopyWithImpl<$Res, LoginEvent>;
}

/// @nodoc
class _$LoginEventCopyWithImpl<$Res, $Val extends LoginEvent>
    implements $LoginEventCopyWith<$Res> {
  _$LoginEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$OnTapCopyWith<$Res> {
  factory _$$OnTapCopyWith(_$OnTap value, $Res Function(_$OnTap) then) =
      __$$OnTapCopyWithImpl<$Res>;
}

/// @nodoc
class __$$OnTapCopyWithImpl<$Res>
    extends _$LoginEventCopyWithImpl<$Res, _$OnTap>
    implements _$$OnTapCopyWith<$Res> {
  __$$OnTapCopyWithImpl(_$OnTap _value, $Res Function(_$OnTap) _then)
      : super(_value, _then);
}

/// @nodoc

class _$OnTap implements OnTap {
  const _$OnTap();

  @override
  String toString() {
    return 'LoginEvent.onTap()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$OnTap);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() onTap,
  }) {
    return onTap();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? onTap,
  }) {
    return onTap?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? onTap,
    required TResult orElse(),
  }) {
    if (onTap != null) {
      return onTap();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OnTap value) onTap,
  }) {
    return onTap(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OnTap value)? onTap,
  }) {
    return onTap?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OnTap value)? onTap,
    required TResult orElse(),
  }) {
    if (onTap != null) {
      return onTap(this);
    }
    return orElse();
  }
}

abstract class OnTap implements LoginEvent {
  const factory OnTap() = _$OnTap;
}

/// @nodoc
mixin _$LoginState {
  bool get isTaped => throw _privateConstructorUsedError;
  bool get isSignup => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LoginStateCopyWith<LoginState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginStateCopyWith<$Res> {
  factory $LoginStateCopyWith(
          LoginState value, $Res Function(LoginState) then) =
      _$LoginStateCopyWithImpl<$Res, LoginState>;
  @useResult
  $Res call({bool isTaped, bool isSignup});
}

/// @nodoc
class _$LoginStateCopyWithImpl<$Res, $Val extends LoginState>
    implements $LoginStateCopyWith<$Res> {
  _$LoginStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isTaped = null,
    Object? isSignup = null,
  }) {
    return _then(_value.copyWith(
      isTaped: null == isTaped
          ? _value.isTaped
          : isTaped // ignore: cast_nullable_to_non_nullable
              as bool,
      isSignup: null == isSignup
          ? _value.isSignup
          : isSignup // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_LoginStateCopyWith<$Res>
    implements $LoginStateCopyWith<$Res> {
  factory _$$_LoginStateCopyWith(
          _$_LoginState value, $Res Function(_$_LoginState) then) =
      __$$_LoginStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isTaped, bool isSignup});
}

/// @nodoc
class __$$_LoginStateCopyWithImpl<$Res>
    extends _$LoginStateCopyWithImpl<$Res, _$_LoginState>
    implements _$$_LoginStateCopyWith<$Res> {
  __$$_LoginStateCopyWithImpl(
      _$_LoginState _value, $Res Function(_$_LoginState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isTaped = null,
    Object? isSignup = null,
  }) {
    return _then(_$_LoginState(
      isTaped: null == isTaped
          ? _value.isTaped
          : isTaped // ignore: cast_nullable_to_non_nullable
              as bool,
      isSignup: null == isSignup
          ? _value.isSignup
          : isSignup // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_LoginState implements _LoginState {
  const _$_LoginState({required this.isTaped, required this.isSignup});

  @override
  final bool isTaped;
  @override
  final bool isSignup;

  @override
  String toString() {
    return 'LoginState(isTaped: $isTaped, isSignup: $isSignup)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LoginState &&
            (identical(other.isTaped, isTaped) || other.isTaped == isTaped) &&
            (identical(other.isSignup, isSignup) ||
                other.isSignup == isSignup));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isTaped, isSignup);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LoginStateCopyWith<_$_LoginState> get copyWith =>
      __$$_LoginStateCopyWithImpl<_$_LoginState>(this, _$identity);
}

abstract class _LoginState implements LoginState {
  const factory _LoginState(
      {required final bool isTaped,
      required final bool isSignup}) = _$_LoginState;

  @override
  bool get isTaped;
  @override
  bool get isSignup;
  @override
  @JsonKey(ignore: true)
  _$$_LoginStateCopyWith<_$_LoginState> get copyWith =>
      throw _privateConstructorUsedError;
}
