import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ivory/presentation/screen_search/search_screen.dart';
import 'package:super_rich_text/super_rich_text.dart';

import '../../../applicatoin/cubits/bottomNavigation/bottom_navigation_cubit.dart';
import '../../core/constant/font/google_font.dart';

class AppBarWidget extends StatelessWidget {
  AppBarWidget({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    List<Widget> appbarWidgets = [
      searchExpandedWidget(),
      searchExpandedWidget(),
      searchExpandedWidget(),
      searchExpandedWidget(),
      searchExpandedWidget(),
    ];

    return SizedBox(
      width: size.width,
      height: 150,
      child: Padding(
        padding: const EdgeInsets.only(
          top: 30.0,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            appbarHomeheadWidget(),
            BlocBuilder<BottomNavigationCubit, BottomNavigationState>(
              builder: (context, state) {
                return PageTransitionSwitcher(
                  reverse: true,
                  duration: const Duration(milliseconds: 500),
                  transitionBuilder:
                      (child, primaryAnimation, secondaryAnimation) {
                    return SharedAxisTransition(
                      fillColor: Colors.white,
                      transitionType: SharedAxisTransitionType.vertical,
                      animation: primaryAnimation,
                      secondaryAnimation: secondaryAnimation,
                      child: child,
                    );
                  },
                  child: appbarWidgets[state.index],
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  final List<String> appbarTexts = [
    'IvyyOyyry',
    'Categories',
    'Orders',
    'Profile',
    'Cart',
  ];

  Row appbarHomeheadWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: BlocBuilder<BottomNavigationCubit, BottomNavigationState>(
            builder: (context, appbarTextState) {
              return SuperRichText(
                text: appbarTexts[appbarTextState.index],
                style: GoogleFont.appBarTextStyle,
                othersMarkers: [
                  MarkerText(
                      marker: 'yy', style: GoogleFont.appBarTextStyleYellow),
                ],
              );
            },
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: SvgPicture.asset(
                'asset/svgs/scan-camera-28-regular.svg',
                width: 30,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: SvgPicture.asset(
                'asset/svgs/message-circle-outline.svg',
                width: 30,
              ),
            ),
          ],
        )
      ],
    );
  }

  OpenContainer searchExpandedWidget() {
    return OpenContainer(
      closedElevation: 0,
      transitionType: ContainerTransitionType.fade,
      transitionDuration: const Duration(milliseconds: 500),
      closedBuilder: (context, action) => searchWidget(context),
      openBuilder: (context, action) => const ScreenSearch(),
      // openBuilder: (context, action) => const ScreenSearch(),
    );
  }

  Padding searchWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        height: 40,
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.only(
          top: 20,
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

  catagoryWidget(BuildContext context,
      {required String key,
      required String title,
      required Widget trailing,
      Function()? onTap}) {
    return Container(
      key: Key(key),
      height: 40,
      margin: const EdgeInsets.only(top: 20),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              title,
              style: GoogleFont.appbarSwapText,
            ),
            GestureDetector(onTap: onTap, child: trailing),
          ],
        ),
      ),
    );
  }
}
