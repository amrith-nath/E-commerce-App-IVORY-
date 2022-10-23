import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ivory/presentation/core/constant/font/google_font.dart';
import 'package:ivory/presentation/screen_home/widget/bottom_navigation_widget.dart';
import 'package:super_rich_text/super_rich_text.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(size.width, 100),
        child: PhysicalModel(
          color: Colors.white,
          elevation: 5,
          child: Container(
            width: size.width,
            height: 100,
            child: Row(
              children: [
                SuperRichText(
                  text: 'IvyyOyyry',
                  style: GoogleFont.appBarTextStyle,
                  othersMarkers: [
                    MarkerText(
                        marker: 'yy', style: GoogleFont.appBarTextStyleYellow),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 15.0),
                      child: SvgPicture.asset('asset/svgs/scan.svg'),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: SvgPicture.asset(
                          'asset/svgs/message-square-fill.svg'),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
      body: Column(
        children: [],
      ),
      bottomNavigationBar: const BottomNavigationWidget(),
    );
  }

  AppBar appbarX() {
    return AppBar(
      title: SuperRichText(
        text: 'IvyyOyyry',
        style: GoogleFont.appBarTextStyle,
        othersMarkers: [
          MarkerText(marker: 'yy', style: GoogleFont.appBarTextStyleYellow),
        ],
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 15.0),
          child: SvgPicture.asset('asset/svgs/scan.svg'),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 10.0),
          child: SvgPicture.asset('asset/svgs/message-square-fill.svg'),
        ),
      ],
    );
  }
}
