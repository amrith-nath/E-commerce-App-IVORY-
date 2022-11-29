import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ivory/domine/models/banner/banner_model.dart';
import 'package:ivory/domine/models/product/product_model.dart';
import 'package:ivory/infrastructure/repositories/product_repo/product_repo.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  ProductRepo productRepo = ProductRepo();

  HomeBloc() : super(HomeState.initial()) {
    on<InitialHomeEvent>((event, emit) async {
      var producrStream = productRepo.getProducts();

      await emit.forEach(producrStream, onData: (products) {
        log(products.length.toString());
        return HomeState(isLoadinng: false, isError: false, products: products);
      }).catchError((error) {
        emit(HomeState(isLoadinng: false, isError: true, products: const []));
      });
    });
  }
}
