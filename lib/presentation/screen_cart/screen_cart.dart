import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:ivory/domine/models/product/product_model.dart';
import 'package:ivory/presentation/core/constant/size/constant_size.dart';
import 'package:ivory/presentation/screen_checkout/screen_checkout.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../../applicatoin/bloc/cart_bloc/cart_bloc.dart';
import '../core/constant/font/google_font.dart';

class ScreenCart extends StatelessWidget {
  const ScreenCart({Key? key}) : super(key: key);
  // ProductController productController = Get.put(ProductController());
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        BlocProvider.of<CartBloc>(context).add(InitialCartEvent());
      },
    );

    return Scaffold(
      body: BlocBuilder<CartBloc, CartState>(
        builder: (context, cState) {
          if (cState is CartLoadingState || cState is CartInitialState) {
            return const Center(child: CircularProgressIndicator());
          }

          if (cState is CartLoadedState) {
            return RefreshIndicator(
              onRefresh: () async {
                BlocProvider.of<CartBloc>(context).add(InitialCartEvent());
                await Future.delayed(const Duration(seconds: 3));
              },
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: cState.cart.length,
                itemBuilder: (BuildContext context, int index) {
                  var product = cState.products.firstWhereOrNull(
                    (element) => element.id == cState.cart.keys.toList()[index],
                  );

                  var count = cState.cart[product!.id];
                  return CartWidget(
                    name: product.name,
                    image: product.images[0],
                    price: product.price.toString(),
                    size: product.size[0].toUpperCase(),
                    count: count!,
                  );
                },
              ),
            );
          }
          return const Center(child: Text('Something Went Wrong'));
        },
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              color: Colors.grey.shade300,
            ),
          ),
        ),
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 20),
        height: 80,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            BlocBuilder<CartBloc, CartState>(
              builder: (context, bState) {
                if (bState is CartLoadingState || bState is CartInitialState) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (bState is CartLoadedState) {
                  double amount = 0;

                  var keys = bState.cart.keys.toList();
                  for (var i in keys) {
                    int count = bState.cart[i]!;
                    ProductModel product = bState.products
                        .firstWhere((element) => element.id == i);

                    amount = amount + (product.price * count);
                  }

                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '\$ $amount.',
                        style: GoogleFont.homeBodyText,
                      ),
                      Text(
                        "Total Price",
                        style: GoogleFont.dropDownText,
                      ),
                    ],
                  );
                }
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '\$ 2,400',
                      style: GoogleFont.homeBodyText,
                    ),
                    Text(
                      "Total Price",
                      style: GoogleFont.dropDownText,
                    ),
                  ],
                );
              },
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 1.8,
              height: 60,
              child: ElevatedButton.icon(
                onPressed: () {
                  showMaterialModalBottomSheet(
                      clipBehavior: Clip.hardEdge,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30))),
                      elevation: 5,
                      context: context,
                      builder: (context) => ScreenCheckout());
                },
                style: ButtonStyle(
                  shape: MaterialStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
                icon: const Icon(Icons.circle_outlined),
                label: Text(
                  'Checkout',
                  style: GoogleFont.loginSubTextBlack,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CartWidget extends StatelessWidget {
  const CartWidget(
      {required this.name,
      required this.image,
      required this.price,
      required this.size,
      required this.count});

  final String name;
  final String image;
  final String price;
  final String size;
  final int count;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 18, right: 18),
      child: Card(
        clipBehavior: Clip.hardEdge,
        child: Container(
          height: 180,
          decoration: BoxDecoration(color: Colors.grey.shade200),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              kHeight10,
              Row(
                children: [
                  const SizedBox(
                    width: 10,
                  ),
                  Card(
                    elevation: 3,
                    child: SizedBox(
                      height: 90,
                      width: 70,
                      child: Image.network(
                        image,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: GoogleFont.homeBodyText,
                      ),
                      Text(
                        'size - $size',
                        style: GoogleFont.loginSubTextGrey,
                      ),
                      kHeight10,
                      Text(
                        '\$ $price',
                        style: GoogleFont.cardMainText,
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Column(
                    children: [
                      kHeight,
                      kHeight10,
                      Container(
                        height: 30,
                        width: 70,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Center(
                            child: Text(
                          '-   $count   +',
                          style: GoogleFont.cardMainText,
                        )),
                      ),
                    ],
                  )
                ],
              ),
              const Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton.icon(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.delete_outline_outlined,
                        color: Colors.grey,
                      ),
                      label: Text(
                        'Remove',
                        style: GoogleFont.loginSubTextGrey,
                      )),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
