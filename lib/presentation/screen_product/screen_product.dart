import 'dart:developer';

import 'package:card_swiper/card_swiper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:ivory/domine/models/product/product_model.dart';
import 'package:ivory/domine/models/user/user_model.dart';
import 'package:ivory/infrastructure/repositories/user_repo/user_repo.dart';
import 'package:ivory/presentation/core/constant/color/colors.dart';
import 'package:ivory/presentation/core/constant/font/google_font.dart';
import 'package:ivory/presentation/core/constant/size/constant_size.dart';
import 'package:ivory/presentation/login_screen/login_creen.dart';
import 'package:ivory/presentation/widgets/search_delegate.dart';

import '../../applicatoin/bloc/homeBloc/home_bloc.dart';

class ScreenProduct extends StatelessWidget {
  ScreenProduct({Key? key, required this.product, required this.user})
      : super(key: key);
  UserRepo userRepo = UserRepo();
  ProductModel product;
  UserModel? user;
  var isButtonLoading = false;
  var color = Colors.black;
  var color2 = Colors.grey;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 5,
        backgroundColor: Colors.white,
        actions: [
          GestureDetector(
            onTap: () {
              showSearch(context: context, delegate: ProductSearchDelegate());
            },
            child: SvgPicture.asset(
              'asset/svgs/search.svg',
              width: 20,
              color: Colors.black,
            ),
          ),
          const SizedBox(
            width: 20,
          ),
        ],
      ),
      body: ListView(
        children: [
          SizedBox(
            width: double.infinity,
            height: MediaQuery.of(context).size.height / 2.2,
            // decoration: BoxDecoration(
            //   image: DecorationImage(
            //       image: AssetImage(image), fit: BoxFit.cover),
            // ),
            child: Swiper(
              index: 0,
              itemCount: product.images.length,
              itemBuilder: (context, index) => SizedBox(
                child: Image.network(
                  product.images[index],
                  fit: BoxFit.cover,
                ),
              ),
              autoplay: true,
              pagination: const SwiperPagination(
                margin: EdgeInsets.only(top: 40),
                builder: DotSwiperPaginationBuilder(
                  color: Colors.grey,
                  size: 5,
                  activeSize: 8,
                ),
              ),
            ),
          ),
          kHeight20,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          product.name,
                          style: GoogleFont.productTextMain,
                        ),
                        kHeight10,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            ratingStarWidget(xYellow),
                            ratingStarWidget(xYellow),
                            ratingStarWidget(xYellow),
                            ratingStarWidget(Colors.grey),
                            ratingStarWidget(Colors.grey),
                            Text(
                              '${product.rating} (${product.noOfRating})',
                              style: GoogleFont.ratingTextGrey,
                            )
                          ],
                        )
                      ],
                    ),
                    BlocBuilder<HomeBloc, HomeState>(
                      builder: (context, state) {
                        user = state.user;
                        if (user == null) {
                          color = Colors.white;
                        } else if (user!.favourites.contains(product.id)) {
                          color2 = Colors.red;
                          color = Colors.red;
                        } else {}
                        return StatefulBuilder(builder: (context, setstate) {
                          return GestureDetector(
                            onTap: () async {
                              setstate(() {
                                isButtonLoading = true;
                              });
                              if (FirebaseAuth.instance.currentUser == null) {
                                Get.to(() => ScreenLogin());
                              } else {
                                var user = await userRepo.getuser();

                                var favourites = user.favourites;
                                if (favourites.contains(product.id)) {
                                  favourites.remove(product.id);
                                } else {
                                  favourites.add(product.id);
                                }
                                await userRepo.updateUser(
                                    user.copyWith(favourites: favourites));
                                BlocProvider.of<HomeBloc>(context)
                                    .add(InitialHomeEvent());
                                if (user.favourites.contains(product.id)) {
                                  color2 = Colors.red;
                                  color = Colors.red;
                                  log('product added to favaourites');
                                } else {
                                  color2 = Colors.grey;
                                  color = Colors.black;
                                  log('product removed from favaourites ');
                                }
                                setstate(() {
                                  isButtonLoading = false;
                                });
                              }
                            },
                            child: isButtonLoading
                                ? CircleAvatar(
                                    backgroundColor: Colors.white,
                                    radius: 25,
                                    child: SizedBox(
                                        width: 15,
                                        height: 15,
                                        child: Center(
                                            child: CircularProgressIndicator(
                                          strokeWidth: 2,
                                          color: color,
                                        ))),
                                  )
                                : CircleAvatar(
                                    backgroundColor: color2,
                                    radius: 25,
                                    child: PhysicalModel(
                                      elevation: 3,
                                      shape: BoxShape.circle,
                                      color: Colors.white,
                                      child: CircleAvatar(
                                        backgroundColor: Colors.white,
                                        radius: 24,
                                        child: Icon(
                                          Icons.favorite_outline_outlined,
                                          color: color,
                                          size: 20,
                                        ),
                                      ),
                                    ),
                                  ),
                          );
                        });
                      },
                    ),
                  ],
                ),
                kHeight10,
                Divider(
                  color: Colors.grey.shade600,
                  height: 1,
                ),
                kHeight10,
                Text(
                  'Description',
                  style: GoogleFont.loginSubTextBlack,
                ),
                Text(
                  product.description,
                  style: GoogleFont.loginSubTextGrey,
                ),
                kHeight10,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Colors',
                          style: GoogleFont.loginSubTextBlack,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5.0),
                          child: Row(
                            children: List.generate(
                              product.images.length,
                              (index) => productColorWidget(
                                product.colors[index],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Size',
                          style: GoogleFont.loginSubTextBlack,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5.0),
                          child: Row(
                            children: List.generate(
                                product.size.length,
                                (index) => productSizeWidget(
                                    product.size[index].toUpperCase())),
                            // children: [
                            //   productSizeWidget('S'),
                            //   productSizeWidget('M'),
                            //   productSizeWidget('L'),
                            //   productSizeWidget('XL'),
                            // ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                kHeight,
              ],
            ),
          )
        ],
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
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '\$ ${product.price}',
                  style: GoogleFont.homeBodyText,
                ),
                Text(
                  "Total Price",
                  style: GoogleFont.dropDownText,
                ),
              ],
            ),
            SizedBox(
                width: MediaQuery.of(context).size.width / 1.8,
                height: 60,
                child: ElevatedButton.icon(
                    onPressed: () {
                      addProduct();
                    },
                    style: ButtonStyle(
                      shape: MaterialStatePropertyAll(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                    icon: SvgPicture.asset(
                      'asset/svgs/bag-shopping.svg',
                      width: 18,
                    ),
                    label: Text(
                      'Add to Cart',
                      style: GoogleFont.loginSubTextBlack,
                    )))
          ],
        ),
      ),
    );
  }

  addProduct() async {
    if (FirebaseAuth.instance.currentUser == null) {
      Get.to(() => ScreenLogin());
    } else {
      var user = await userRepo.getuser();

      var cart = user.cart;
      if (cart.keys.contains(product.id)) {
        cart[product.id] = cart[product.id]! + 1;
      } else {
        cart.addAll({product.id: 1});
      }
      await userRepo.updateUser(user.copyWith(cart: cart));
      log('product added');
    }
  }

  Icon ratingStarWidget(Color color) {
    return Icon(
      Icons.star_outline,
      color: color,
      size: 15,
    );
  }

  Padding productColorWidget(String color) {
    return Padding(
      padding: const EdgeInsets.only(right: 5.0),
      child: CircleAvatar(
        backgroundColor: Color(int.parse("0xff$color")),
        radius: 15,
      ),
    );
  }

  Padding productSizeWidget(String text) {
    return Padding(
      padding: const EdgeInsets.only(right: 5.0),
      child: CircleAvatar(
        backgroundColor: const Color(0xff003049),
        radius: 15,
        child: CircleAvatar(
          backgroundColor: Colors.white,
          radius: 14,
          child: Text(
            text,
            style: GoogleFont.loginSubTextBlack,
          ),
        ),
      ),
    );
  }
}
