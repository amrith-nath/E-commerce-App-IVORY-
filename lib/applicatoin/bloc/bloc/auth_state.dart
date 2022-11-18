part of 'auth_bloc.dart';

enum AuthStatus { unKnown, authenticated, unAuthenticated }

class AuthState extends Equatable {
  final AuthStatus authStatus;
  final User? authUser;
  final UserModel? user;

  const AuthState({
    this.authStatus = AuthStatus.unKnown,
    this.authUser,
    this.user,
  });

  factory AuthState.unknown() =>
      const AuthState(authStatus: AuthStatus.unKnown);

  @override
  List<Object> get props => [];
}
