import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:ivory/applicatoin/bloc/homeBloc/home_bloc.dart';
import 'package:ivory/domine/models/product/product_model.dart';
import 'package:ivory/domine/models/user/user_model.dart';
import 'package:ivory/infrastructure/repositories/user_repo/user_repo.dart';
import 'package:ivory/presentation/core/constant/font/google_font.dart';
import 'package:animated_icon_button/animated_icon_button.dart';

import '../login_screen/login_creen.dart';

class GridItemWidget extends StatelessWidget {
  GridItemWidget({
    Key? key,
    required this.product,
    this.user,
  }) : super(key: key);

  final ProductModel product;
  final UserModel? user;
  UserRepo userRepo = UserRepo();
  var color = Colors.black;
  var color2 = Colors.grey;
  var isButtonLoading = false;
  @override
  Widget build(BuildContext context) {
    log(user!.favourites.length.toString());

    if (user == null) {
      color = Colors.white;
      log('user is null');
    } else if (user!.favourites.contains(product.id)) {
      log('item found');

      color2 = Colors.red;
      color = Colors.red;
    } else {
      log('nothing happend ');
    }
    return Card(
        elevation: 5,
        clipBehavior: Clip.hardEdge,
        child: Column(
          children: [
            Expanded(
              flex: 7,
              child: Stack(
                children: [
                  SizedBox(
                    height: double.infinity,
                    width: double.infinity,
                    child: CachedNetworkImage(
                      imageUrl: product.images[0],
                      fit: BoxFit.cover,
                      placeholder: (context, url) => const Center(
                        child: CircularProgressIndicator(),
                      ),
                      errorWidget: (context, url, error) =>
                          Image.asset('asset/images/error.gif'),
                    ),
                  ),
                  Positioned(
                    top: 20,
                    left: 0,
                    child: Container(
                      width: 57,
                      height: 20,
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(10),
                              bottomRight: Radius.circular(10))),
                      child: PhysicalModel(
                        color: Colors.white,
                        borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(10),
                            bottomRight: Radius.circular(10)),
                        elevation: 3,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.star_border_rounded,
                              size: 15,
                            ),
                            Text(
                              product.rating.toString(),
                              style: GoogleFont.cardSubText,
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                width: double.infinity,
                height: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          product.name,
                          style: GoogleFont.cardMainText,
                        ),
                        Text(
                          '\$${product.price}',
                          style: GoogleFont.cardMainText,
                        ),
                      ],
                    ),
                    StatefulBuilder(builder: (context, setstate) {
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
                              log('product added to favaourites');
                            } else {
                              log('product removed from favaourites ');
                            }
                          }
                        },
                        child: isButtonLoading
                            ? CircleAvatar(
                                backgroundColor: Colors.white,
                                radius: 16,
                                child: SizedBox(
                                    width: 10,
                                    height: 10,
                                    child: Center(
                                        child: CircularProgressIndicator(
                                      strokeWidth: 2,
                                      color: color,
                                    ))),
                              )
                            : CircleAvatar(
                                backgroundColor: color2,
                                radius: 16,
                                child: PhysicalModel(
                                  elevation: 3,
                                  shape: BoxShape.circle,
                                  color: Colors.white,
                                  child: CircleAvatar(
                                    backgroundColor: Colors.white,
                                    radius: 15,
                                    child: Icon(
                                      Icons.favorite_outline_outlined,
                                      color: color,
                                      size: 15,
                                    ),
                                  ),
                                ),
                              ),
                      );
                    }),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
