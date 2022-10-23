import 'package:flutter/material.dart';
import 'package:super_rich_text/super_rich_text.dart';

import '../../widgets/rich_text_widget.dart';
import '../constant/font/google_font.dart';

final List tabs = [
  xTab(
    showLogo: true,
    headText: 'Welcome To',
    subText: 'The best e-commerce app of the century for your daily needs ! ',
  ),
  xTab(
    headText: 'Best place to buy anything for your yyStyleyy',
    subText: 'Browse over 10M trendy products and choose what you like',
  ),
  xTab(
    headText: 'Discover yyNewyy collections every Day',
    subText: 'Ivory add new collections every day for the users',
  ),
];
Column xTab({
  required String headText,
  required String subText,
  bool showLogo = false,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      SuperRichText(
        text: headText,
        style: GoogleFont.onboardingHeadText,
        othersMarkers: [
          MarkerText(marker: 'yy', style: GoogleFont.onboardingHeadYellow),
        ],
      ),
      showLogo
          ? const RichTextWidget(
              text: 'IvyyOyyry',
              isOnBoard: true,
            )
          : const SizedBox(),
      Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Text(
          subText,
          style: GoogleFont.onboardingSubText,
        ),
      ),
    ],
  );
}
