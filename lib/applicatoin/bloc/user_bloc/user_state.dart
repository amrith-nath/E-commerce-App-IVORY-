part of 'user_bloc.dart';

class UserState extends Equatable {
  UserState({
    required this.products,
    required this.isError,
    required this.isLoadinng,
  });

  List<UserModel> products;
  final bool isLoadinng;
  final bool isError;

  factory UserState.initial() => UserState(
        products: const [],
        isError: false,
        isLoadinng: true,
      );

  @override
  List<Object> get props => [];
}
