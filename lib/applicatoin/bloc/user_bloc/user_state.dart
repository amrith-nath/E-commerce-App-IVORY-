part of 'user_bloc.dart';

class UserState extends Equatable {
  UserState({
    required this.users,
    required this.isError,
    required this.isLoadinng,
  });

  List<UserModel> users;
  final bool isLoadinng;
  final bool isError;

  factory UserState.initial() => UserState(
        users: const [],
        isError: false,
        isLoadinng: true,
      );

  @override
  List<Object> get props => [];
}
