import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ivory/presentation/core/constant/color/colors.dart';
import 'package:ivory/presentation/core/constant/font/google_font.dart';
import 'package:ivory/presentation/core/constant/size/constant_size.dart';
import 'package:ivory/presentation/login_screen/login_creen.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class ScreenProfile extends StatelessWidget {
  const ScreenProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 50,
            backgroundColor: xYellow,
            child: SvgPicture.asset('asset/svgs/user.svg'),
          ),
          kHeight,
          Text(
            'Hey! Welcome',
            style: GoogleFont.appbarSwapText,
          ),
          kHeight10,
          Text(
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna',
            textAlign: TextAlign.center,
            style: GoogleFont.loginSubTextGrey,
          ),
          kHeight,
          SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(xYellow),
              ),
              onPressed: () {
                showMaterialModalBottomSheet(
                  clipBehavior: Clip.hardEdge,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30))),
                  elevation: 5,
                  context: context,
                  builder: (context) => ScreenLogin(),
                );
              },
              child: Text(
                'Get Started',
                style: GoogleFont.textButtonStyle,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
