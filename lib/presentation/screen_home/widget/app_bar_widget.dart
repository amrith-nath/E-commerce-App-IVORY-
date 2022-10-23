import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:super_rich_text/super_rich_text.dart';

import '../../core/constant/font/google_font.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return PhysicalModel(
      color: Colors.white,
      elevation: 3,
      child: SizedBox(
        width: size.width,
        height: 100,
        child: Padding(
          padding: const EdgeInsets.only(top: 30.0, left: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
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
          ),
        ),
      ),
    );
  }
}
