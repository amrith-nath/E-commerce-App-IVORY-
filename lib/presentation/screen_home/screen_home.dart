import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ivory/presentation/core/constant/color/colors.dart';
import 'package:ivory/presentation/screen_home/widget/app_bar_widget.dart';
import 'package:ivory/presentation/screen_home/widget/bottom_navigation_widget.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(size.width, 100),
        child: AppBarWidget(size: size),
      ),
      body: Column(
        children: [
          Container(
            height: 40,
            width: double.infinity,
            margin: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
            decoration: BoxDecoration(
              border: Border.all(color: xPurple),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Stack(
              children: [
                Positioned(
                  right: 0,
                  child: Container(
                    height: 40,
                    width: 60,
                    decoration: const BoxDecoration(
                      border: Border(
                        left: BorderSide(
                          color: xPurple,
                          style: BorderStyle.solid,
                        ),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SvgPicture.asset(
                        'asset/svgs/search.svg',
                        width: 20,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: const BottomNavigationWidget(),
    );
  }
}
