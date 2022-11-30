import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ivory/domine/models/banner/banner_model.dart';
import 'package:ivory/domine/models/product/product_model.dart';
import 'package:ivory/domine/models/user/user_model.dart';
import 'package:ivory/infrastructure/repositories/product_repo/product_repo.dart';
import 'package:ivory/infrastructure/repositories/user_repo/user_repo.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  ProductRepo productRepo = ProductRepo();
  UserRepo userRepo = UserRepo();
  HomeBloc() : super(HomeState.initial()) {
    // var user = getUser();

    on<InitialHomeEvent>(
      (event, emit) async {
        var user = await userRepo.getuser();
        log('from bloc fav length = ${user.favourites.length}');
        var producrStream = productRepo.getProducts();
        if (state is HomeLoadedState) {
          await emit.forEach(producrStream, onData: (products) {
            log(products.length.toString());
            return HomeState(
                isLoadinng: false,
                isError: false,
                products: products,
                user: user);
          }).catchError((error) {
            emit(HomeState(
                isLoadinng: false, isError: true, products: const []));
          });
        } else {
          await emit.forEach(producrStream, onData: (products) {
            log(products.length.toString());
            return HomeLoadedState(
                isLoadinng: false,
                isError: false,
                products: products,
                user: user);
          }).catchError((error) {
            emit(HomeLoadedState(
              isLoadinng: false,
              isError: true,
              products: const [],
            ));
          });
        }
      },
    );
    on<TempHomeEvent>((event, emit) {});
  }
}
