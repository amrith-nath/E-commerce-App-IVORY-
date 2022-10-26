import 'dart:developer';

import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ivory/presentation/core/constant/color/colors.dart';
import 'package:ivory/presentation/core/constant/font/google_font.dart';
import 'package:ivory/presentation/core/constant/size/constant_size.dart';

class ScreenProduct extends StatelessWidget {
  const ScreenProduct({Key? key, required this.image, required this.index})
      : super(key: key);

  final List<String> image;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 5,
        backgroundColor: Colors.white,
        actions: [
          SvgPicture.asset(
            'asset/svgs/search.svg',
            width: 20,
            color: Colors.black,
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
            height: MediaQuery.of(context).size.height / 2,
            // decoration: BoxDecoration(
            //   image: DecorationImage(
            //       image: AssetImage(image), fit: BoxFit.cover),
            // ),
            child: Swiper(
              index: index,
              itemCount: image.length,
              itemBuilder: (context, index) => SizedBox(
                child: Image.asset(
                  image[index],
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
                          'Spring Dress',
                          style: GoogleFont.productTextMain,
                        ),
                        kHeight10,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Icon(
                              Icons.star_outline,
                              color: xYellow,
                              size: 15,
                            ),
                            const Icon(
                              Icons.star_outline,
                              color: xYellow,
                              size: 15,
                            ),
                            const Icon(
                              Icons.star_outline,
                              color: xYellow,
                              size: 15,
                            ),
                            const Icon(
                              Icons.star_outline,
                              color: Colors.grey,
                              size: 15,
                            ),
                            const Icon(
                              Icons.star_outline,
                              color: Colors.grey,
                              size: 15,
                            ),
                            Text(
                              '  4.4 (208)',
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
                Text(
                  'Description',
                  style: GoogleFont.loginSubTextBlack,
                ),
                Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation',
                  style: GoogleFont.loginSubTextGrey,
                )
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: Container(
        width: double.infinity,
        height: 60,
        color: Colors.amber,
      ),
    );
  }
}
