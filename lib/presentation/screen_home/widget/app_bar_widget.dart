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
      elevation: 0,
      child: SizedBox(
        width: size.width,
        height: 150,
        child: Padding(
          padding: const EdgeInsets.only(
            top: 30.0,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: SuperRichText(
                      text: 'IvyyOyyry',
                      style: GoogleFont.appBarTextStyle,
                      othersMarkers: [
                        MarkerText(
                            marker: 'yy',
                            style: GoogleFont.appBarTextStyleYellow),
                      ],
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
              ),
              searchWidget(context),
            ],
          ),
        ),
      ),
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
}
