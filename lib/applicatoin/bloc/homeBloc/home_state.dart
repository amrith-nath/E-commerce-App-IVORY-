part of 'home_bloc.dart';

class HomeState extends Equatable {
  HomeState(
      {required this.isLoadinng,
      required this.isError,
      required this.products});
  Stream<List<ProductModel>>? productStream;
  Stream<List<BannerModel>>? bannerStream;
  List<ProductModel> products;
  final bool isLoadinng;
  final bool isError;

  factory HomeState.initial() =>
      HomeState(isError: false, isLoadinng: true, products: []);
  @override
  List<Object> get props => [];
}
