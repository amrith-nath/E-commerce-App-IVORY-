import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../core/constant/font/google_font.dart';

class LoginOPtionButton extends StatelessWidget {
  const LoginOPtionButton({
    Key? key,
    this.onTap,
    required this.svgIcon,
    required this.label,
  }) : super(key: key);
  final Function()? onTap;
  final String svgIcon;
  final String label;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        height: 55,
        width: 130,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: const Border(
            bottom: BorderSide(color: Color(0xffCACACA)),
            top: BorderSide(color: Color(0xffCACACA)),
            left: BorderSide(color: Color(0xffCACACA)),
            right: BorderSide(color: Color(0xffCACACA)),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SvgPicture.asset(
              svgIcon,
              width: 30,
            ),
            Text(
              label,
              style: GoogleFont.loginSubTextBlack,
            )
          ],
        ),
      ),
    );
  }
}
