import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ivory/presentation/core/constant/color/colors.dart';
import 'package:ivory/presentation/core/constant/size/constant_size.dart';
import 'package:ivory/presentation/screen_profile/profile_page.dart';
import 'package:ivory/presentation/screens_onboarding/widgets/elevated_button_widget.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import '../core/constant/font/google_font.dart';

class ScreenLogin extends StatelessWidget {
  ScreenLogin({Key? key}) : super(key: key);

  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height / 1.1,
      color: Colors.white,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0, bottom: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.close),
                ),
                TextButton(
                    onPressed: () {},
                    child: Text(
                      'Sign In',
                      style: GoogleFont.textButtonStyleGrey,
                    ))
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Text(
                  'Create an account',
                  style: GoogleFont.homeBodyText,
                ),
                kHeight,
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Email',
                    fillColor: Colors.grey.shade300,
                    filled: true,
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                kHeight20,
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Password',
                    fillColor: Colors.grey.shade300,
                    filled: true,
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                kHeight10,
                ElevatedButtonWidget(
                  color: xYellow,
                  onPressed: () {
                    showMaterialModalBottomSheet(
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30))),
                      context: context,
                      builder: (context) => SizedBox(
                        height: MediaQuery.of(context).size.height / 1.1,
                        child: const ProfilePage(),
                      ),
                    );
                  },
                  title: 'Create an Account',
                  titleStyle: GoogleFont.cardMainText,
                ),
                kHeight10,
                const Divider(
                  color: Colors.grey,
                ),
                kHeight10,
                Container(
                  height: 40,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    border: Border.all(color: Colors.grey.shade100),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        "asset/svgs/logo-google.svg",
                        width: 25,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Continue With Google',
                        style: GoogleFont.cardMainText,
                      ),
                    ],
                  ),
                ),
                kHeight20,
                Container(
                  height: 40,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      border: Border.all(color: Colors.grey.shade100),
                      borderRadius: BorderRadius.circular(5)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        "asset/svgs/phone-portrait-sharp.svg",
                        width: 25,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Continue With Phone ',
                        style: GoogleFont.cardMainText,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
