import 'package:card_swiper/card_swiper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ivory/domine/models/product/product_model.dart';
import 'package:ivory/presentation/core/constant/color/colors.dart';
import 'package:ivory/presentation/core/constant/font/google_font.dart';
import 'package:ivory/presentation/core/constant/size/constant_size.dart';
import 'package:ivory/presentation/login_screen/login_creen.dart';
import 'package:ivory/presentation/widgets/search_delegate.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class ScreenProduct extends StatelessWidget {
  ScreenProduct({Key? key, required this.product}) : super(key: key);

  ProductModel product;

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
                    GestureDetector(
                      onTap: () {},
                      child: const CircleAvatar(
                        backgroundColor: Colors.grey,
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
                              color: Colors.black,
                              size: 20,
                            ),
                          ),
                        ),
                      ),
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
                      if (FirebaseAuth.instance.currentUser == null) {
                        showMaterialModalBottomSheet(
                          clipBehavior: Clip.hardEdge,
                          shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(30),
                                  topRight: Radius.circular(30))),
                          elevation: 5,
                          context: context,
                          builder: (context) => ScreenLogin(),
                        );
                      }
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
