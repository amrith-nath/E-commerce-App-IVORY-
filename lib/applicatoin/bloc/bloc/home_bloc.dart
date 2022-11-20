import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ivory/domine/models/banner/banner_model.dart';
import 'package:ivory/domine/models/product/product_model.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeState.initial()) {
    on<InitialHomeEvent>((event, emit) {});
  }
}
