import 'package:flutter/material.dart';
import 'package:super_rich_text/super_rich_text.dart';

import '../core/constant/font/google_font.dart';

class RichTextWidget extends StatelessWidget {
  const RichTextWidget({
    required this.text,
    this.isOnBoard = false,
    Key? key,
  }) : super(key: key);

  final String text;
  final bool isOnBoard;

  @override
  Widget build(BuildContext context) {
    return SuperRichText(
      text: text,
      style: !isOnBoard ? GoogleFont.splashStyle : GoogleFont.splashStyleWhite,
      othersMarkers: [
        MarkerText(marker: 'yy', style: GoogleFont.splashStyleYellow),
      ],
    );
  }
}
