part of 'login_bloc.dart';

@freezed
class LoginState with _$LoginState {
  const factory LoginState({
    required bool isTaped,
    required bool isSignup,
  }) = _LoginState;

  factory LoginState.initial() {
    return const LoginState(
      isTaped: false,
      isSignup: false,
    );
  }
}
