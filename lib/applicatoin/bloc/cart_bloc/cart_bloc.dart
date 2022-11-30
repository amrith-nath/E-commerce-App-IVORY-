import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ivory/domine/models/product/product_model.dart';
import 'package:ivory/domine/models/user/user_model.dart';
import 'package:ivory/infrastructure/repositories/product_repo/product_repo.dart';
import 'package:ivory/infrastructure/repositories/user_repo/user_repo.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  UserRepo userRepo = UserRepo();
  ProductRepo productRepo = ProductRepo();

  CartBloc() : super(CartInitialState()) {
    on<InitialCartEvent>((event, emit) async {
      emit(CartLoadingState());
      await Future.delayed(const Duration(seconds: 1));
      try {
        var products = await productRepo.getProductsAsList();
        var user = await userRepo.getuser();
        emit(CartLoadedState(products, user, user.cart));
      } catch (e) {
        emit(CartErrorState(e.toString()));
      }
    });
  }
}
