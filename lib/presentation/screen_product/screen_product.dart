import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ivory/presentation/core/constant/color/colors.dart';
import 'package:ivory/presentation/core/constant/font/google_font.dart';
import 'package:ivory/presentation/core/constant/size/constant_size.dart';
import 'package:ivory/presentation/widgets/search_delegate.dart';

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
                            ratingStarWidget(xYellow),
                            ratingStarWidget(xYellow),
                            ratingStarWidget(xYellow),
                            ratingStarWidget(Colors.grey),
                            ratingStarWidget(Colors.grey),
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
                kHeight10,
                Text(
                  'Description',
                  style: GoogleFont.loginSubTextBlack,
                ),
                Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation',
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
                            children: [
                              productColorWidget(0xff003049),
                              productColorWidget(0xffD62828),
                              productColorWidget(0xffF77F00),
                              productColorWidget(0xff219ebc),
                            ],
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
                            children: [
                              productSizeWidget('S'),
                              productSizeWidget('M'),
                              productSizeWidget('L'),
                              productSizeWidget('XL'),
                            ],
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
                  '\$ 2,400',
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
                    onPressed: () {},
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

  Padding productColorWidget(int color) {
    return Padding(
      padding: const EdgeInsets.only(right: 5.0),
      child: CircleAvatar(
        backgroundColor: Color(color),
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
