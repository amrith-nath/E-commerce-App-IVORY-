import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:ivory/domine/models/product/product_model.dart';
import 'package:ivory/infrastructure/repositories/user_repo/user_repo.dart';
import 'package:ivory/presentation/core/constant/color/colors.dart';
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
    var fAmount = 0.0;

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
              child: cState.cart.isEmpty
                  ? Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.hourglass_empty),
                          Text(
                            'Your Cart is Empty',
                            style: GoogleFont.cardMainText,
                          ),
                        ],
                      ),
                    )
                  : ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: cState.cart.length,
                      itemBuilder: (BuildContext context, int index) {
                        var product = cState.products.firstWhereOrNull(
                          (element) =>
                              element.id == cState.cart.keys.toList()[index],
                        );

                        var count = cState.cart[product!.id];
                        return CartWidget(
                          name: product.name,
                          image: product.images[0],
                          price: product.price.toString(),
                          size: product.size[0].toUpperCase(),
                          count: count!,
                          product: product,
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

                    fAmount = amount = amount + (product.price * count);
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
                      '\$ 0',
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
            BlocBuilder<CartBloc, CartState>(
              builder: (context, state) {
                return SizedBox(
                  width: MediaQuery.of(context).size.width / 1.8,
                  height: 60,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      if (state is CartLoadedState) {
                        if (state.cart.isNotEmpty) {
                          showMaterialModalBottomSheet(
                            clipBehavior: Clip.hardEdge,
                            shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(30),
                                    topRight: Radius.circular(30))),
                            elevation: 5,
                            context: context,
                            builder: (context) => ScreenCheckout(
                              user: state.user,
                              amount: fAmount,
                            ),
                          );
                        }
                      }
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
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class CartWidget extends StatelessWidget {
  CartWidget(
      {super.key,
      required this.name,
      required this.image,
      required this.price,
      required this.size,
      required this.count,
      required this.product});

  final String name;
  final String image;
  final String price;
  final String size;
  final int count;
  final ProductModel product;
  UserRepo userRepo = UserRepo();

  @override
  Widget build(BuildContext context) {
    callBloc() {
      BlocProvider.of<CartBloc>(context).add(InitialCartEvent());
    }

    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 18, right: 18),
      child: Card(
        clipBehavior: Clip.hardEdge,
        child: Container(
          decoration: BoxDecoration(
              color: Colors.grey.shade200,
              border: Border.all(color: Colors.black12)),
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
                  const Spacer(),
                  ItemCountWidget(count: count, product: product),
                  kWidth,
                ],
              ),
              const Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () async {
                      await removeProduct(product);
                      callBloc();
                    },
                    child: Card(
                        child: SizedBox(
                      height: 30,
                      width: 100,
                      child: Center(
                        child: Text(
                          'Remove',
                          style: GoogleFont.cardCountText,
                        ),
                      ),
                    )),
                  ),

                  // TextButton.icon(
                  //     style: TextButton.styleFrom(fixedSize: Size(110, 20)),
                  //     onPressed: () async {
                  //       await removeProduct(product);
                  //       callBloc();
                  //     },
                  //     icon: const Icon(
                  //       Icons.delete_outline_outlined,
                  //       color: Colors.grey,
                  //     ),
                  //     label: Text(
                  //       'Remove',
                  //       style: GoogleFont.loginSubTextGrey,
                  //     )),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  removeProduct(ProductModel product) async {
    var user = await userRepo.getuser();
    var cart = user.cart;

    cart.remove(product.id);
    await userRepo.updateUser(user.copyWith(cart: cart));

    log('product added');
  }
}

class ItemCountWidget extends StatelessWidget {
  ItemCountWidget({
    Key? key,
    required this.count,
    required this.product,
  }) : super(key: key);

  int count;
  final ProductModel product;
  UserRepo userRepo = UserRepo();

  @override
  Widget build(BuildContext context) {
    callBloc() {
      BlocProvider.of<CartBloc>(context).add(InitialCartEvent());
    }

    return StatefulBuilder(builder: (context, setState) {
      return Column(
        children: [
          CircleAvatar(
            backgroundColor: xPrimaryColor,
            radius: 15,
            child: IconButton(
              onPressed: () async {
                callBloc();

                await addProduct(product);
              },
              icon: Transform.rotate(
                  angle: 90 * 3.1415927 / 180,
                  child: const Icon(Icons.chevron_left_outlined)),
              iconSize: 15,
            ),
          ),
          kHeight10,
          CircleAvatar(
            backgroundColor: xScaffoldColor,
            radius: 14,
            child: Center(
                child: Text(
              '$count',
              style: GoogleFont.cardCountText,
            )),
          ),
          kHeight10,
          CircleAvatar(
            backgroundColor: xPrimaryColor,
            radius: 15,
            child: IconButton(
              onPressed: () async {
                callBloc();

                if (count <= 1) {
                  await removeProduct(product);
                } else {
                  await minusProduct(product);
                }
              },
              icon: Transform.rotate(
                  angle: 90 * 3.1415927 / 180,
                  child: const Icon(Icons.chevron_right_outlined)),
              iconSize: 15,
            ),
          ),
        ],
      );
    });
  }

  addProduct(ProductModel product) async {
    var user = await userRepo.getuser();
    var cart = user.cart;

    cart[product.id] = cart[product.id]! + 1;
    await userRepo.updateUser(user.copyWith(cart: cart));
    count = cart[product.id]!;

    log('product added');
  }

  minusProduct(ProductModel product) async {
    var user = await userRepo.getuser();
    var cart = user.cart;

    cart[product.id] = cart[product.id]! - 1;
    await userRepo.updateUser(user.copyWith(cart: cart));
    count = cart[product.id]!;

    log('product added');
  }

  removeProduct(ProductModel product) async {
    var user = await userRepo.getuser();
    var cart = user.cart;

    cart.remove(product.id);
    await userRepo.updateUser(user.copyWith(cart: cart));
    count = cart[product.id]!;

    log('product removed');
  }
}
