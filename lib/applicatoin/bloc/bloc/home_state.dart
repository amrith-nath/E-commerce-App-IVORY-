part of 'home_bloc.dart';

class HomeState extends Equatable {
  HomeState({required this.isLoadinng, required this.isError});
  Stream<List<ProductModel>>? productStream;
  Stream<List<BannerModel>>? bannerStream;

  final bool? isLoadinng;
  final bool? isError;

  factory HomeState.initial() => HomeState(isError: false, isLoadinng: true);
  @override
  List<Object> get props => [];
}
