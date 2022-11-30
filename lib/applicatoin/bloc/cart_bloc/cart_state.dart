part of 'cart_bloc.dart';

abstract class CartState extends Equatable {
  const CartState();
}

class CartInitialState extends CartState {
  @override
  List<Object?> get props => [];
}

class CartErrorState extends CartState {
  final String error;
  const CartErrorState(this.error);
  @override
  List<Object> get props => [error];
}

class CartLoadingState extends CartState {
  @override
  List<Object> get props => [];
}

class CartLoadedState extends CartState {
  UserModel user;
  List<ProductModel> products;
  Map<String, int> cart;
  CartLoadedState(this.products, this.user, this.cart);
  @override
  List<Object> get props => [products, user];
}
