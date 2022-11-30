part of 'home_bloc.dart';

class HomeState extends Equatable {
  HomeState({
    required this.isLoadinng,
    required this.isError,
    required this.products,
    this.user,
  });

  List<ProductModel> products;
  UserModel? user;
  final bool isLoadinng;
  final bool isError;

  factory HomeState.initial() =>
      HomeState(isError: false, isLoadinng: true, products: const []);
  @override
  List<Object> get props => [];
}

class HomeLoadedState extends HomeState {
  HomeLoadedState(
      {required super.isLoadinng,
      required super.isError,
      required super.products,
      super.user});
}
