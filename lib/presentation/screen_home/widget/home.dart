import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ivory/presentation/core/constant/size/constant_size.dart';
import 'package:ivory/presentation/screen_product/screen_product.dart';
import 'package:ivory/presentation/widgets/drop_down_widget.dart';
import 'package:super_rich_text/super_rich_text.dart';
import '../../core/constant/font/google_font.dart';
import '../../widgets/grid_item_widget.dart';

ValueNotifier<String> dropDownNotify = ValueNotifier('All');

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> bannerImages = [
      "asset/images/banner_3.png",
      "asset/images/banner_2.png",
      "asset/images/banner_1.png",
      "asset/images/banner_5.png",
      "asset/images/banner_6.png",
      "asset/images/banner_4.png",
    ];

    final List<String> productImages = [
      'asset/images/card_1.png',
      'asset/images/card_10.png',
      'asset/images/card_4.png',
      'asset/images/card_5.png',
      'asset/images/card_6.png',
      'asset/images/card_7.png',
      'asset/images/card_8.png',
      'asset/images/card_9.png',
      'asset/images/card_3.jpg',
      'asset/images/card_11.png',
      'asset/images/card_12.png',
      'asset/images/card_13.png',
      'asset/images/card_14.png',
      'asset/images/card_15.png',
      'asset/images/card_16.png',
      'asset/images/card_17.png',
    ];

    final List<String> dropDownItems = [
      'Fasion',
      'Shoes',
      'Bags',
      'Watch',
      'Toys',
    ];

    List homeWidgets = [
      kHeight10,
      SizedBox(
        height: 220,
        width: double.infinity,
        child: Swiper(
          itemBuilder: (context, index) => imageBanner(
            bannerImages[index],
          ),
          itemCount: bannerImages.length,
          autoplay: true,
          curve: Curves.fastOutSlowIn,
          pagination: const SwiperPagination(
            margin: EdgeInsets.only(top: 10),
            builder: DotSwiperPaginationBuilder(
              color: Colors.grey,
              size: 5,
              activeSize: 8,
            ),
          ),
        ),
        // child: PageView.builder(
        //   itemCount: bannerImages.length,
        //   itemBuilder: (context, index) => imageBanner(bannerImages[index]),
        // ),
      ),
      kHeight20,
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Collections',
              style: GoogleFont.homeBodyText,
            ),
            SizedBox(
              height: 30,
              width: 110,
              child: DropDownWidget(
                  valueNotifier: dropDownNotify,
                  itemWidgetBuilder: (index, item) {
                    return DropDownItem(item: item);
                  },
                  children: dropDownItems,
                  onChanged: (value) {
                    dropDownNotify.value = value;
                  }),
            ),
          ],
        ),
      ),
      kHeight10,
      GridView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 2 / 2.5,
          ),
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: productImages.length,
          itemBuilder: (context, index) => OpenContainer(
                closedElevation: 0,
                transitionDuration: const Duration(milliseconds: 500),
                closedBuilder: (context, action) =>
                    GridItemWidget(image: productImages[index]),
                openBuilder: (context, action) => ScreenProduct(
                  image: productImages,
                  index: index,
                ),
              )),
    ];

    return RefreshIndicator(
      backgroundColor: Colors.grey.shade200,
      color: Colors.black,
      onRefresh: () {
        return Future.delayed(const Duration(seconds: 3));
      },
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        itemCount: homeWidgets.length,
        itemBuilder: (BuildContext context, int index) {
          return homeWidgets[index];
        },
      ),
    );
  }

  Padding searchWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        height: 40,
        width: MediaQuery.of(context).size.width - 40,
        margin: const EdgeInsets.symmetric(
          vertical: 20,
        ),
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          border: Border.all(color: Colors.grey.shade600, width: 1),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: SvgPicture.asset(
                  'asset/svgs/search.svg',
                  width: 20,
                  color: Colors.grey.shade600,
                )),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                "Search for products",
                style: GoogleFont.loginSubTextGrey,
              ),
            ),
          ],
        ),
      ),
    );
  }

  SizedBox imageBanner(String image) {
    return SizedBox(
      height: 200,
      width: double.infinity,
      child: Stack(
        children: [
          SizedBox(
            height: 200,
            width: double.infinity,
            child: Image.asset(
              image,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            height: 200,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Colors.black54,
                ],
                stops: [0.3, 0.8],
              ),
            ),
          ),
          Positioned(
              right: 20,
              top: 10,
              child: Text(
                'T&C',
                style: GoogleFont.bannerSubTextWhite,
              )),
          Positioned(
            left: 20,
            top: 10,
            child: SuperRichText(
              text: 'IvyyOyyry',
              style: GoogleFont.loginSubTextWhite,
              othersMarkers: [
                MarkerText(marker: 'yy', style: GoogleFont.loginSubTextyellow),
              ],
            ),
          ),
          Positioned(
              left: 20,
              bottom: 40,
              child: SizedBox(
                width: 120,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Free Shipping on all products',
                      style: GoogleFont.bannerLargeText,
                    ),
                    Text(
                      'Explore the Products Ivory offers',
                      style: GoogleFont.bannerSmallText,
                    ),
                    Container(
                      height: 20,
                      width: 60,
                      margin: const EdgeInsets.only(top: 10),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(5))),
                      child: Center(
                        child: Text(
                          "Go",
                          style: GoogleFont.bannerSmallText,
                        ),
                      ),
                    )
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
