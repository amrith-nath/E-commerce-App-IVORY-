import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ivory/infrastructure/repositories/auth_repo/auth_repo.dart';
import 'package:ivory/presentation/core/constant/font/google_font.dart';
import 'package:ivory/presentation/login_screen/login_creen.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../core/constant/color/colors.dart';
import '../core/constant/size/constant_size.dart';
import '../screens_onboarding/widgets/elevated_button_widget.dart';

class ScreenSignup extends StatelessWidget {
  ScreenSignup({super.key});
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _passwordcontroller = TextEditingController();
  final AuthRepo authRepo = AuthRepo();

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
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Text(
                  'Create your account',
                  style: GoogleFont.homeBodyText,
                ),
                kHeight,
                TextFormField(
                  controller: _emailcontroller,
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
                  controller: _passwordcontroller,
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
                    authRepo.signUp(
                        email: _emailcontroller.text.trim(),
                        password: _passwordcontroller.text.trim());
                    Navigator.of(context).pop();
                  },
                  title: 'Sign Up',
                  titleStyle: GoogleFont.cardMainText,
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Already have an account?',
                      style: GoogleFont.loginSubTextGrey,
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                          showMaterialModalBottomSheet(
                            clipBehavior: Clip.hardEdge,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30),
                                topRight: Radius.circular(30),
                              ),
                            ),
                            elevation: 5,
                            context: context,
                            builder: (context) => ScreenLogin(),
                          );
                        },
                        child: Text(
                          'Login',
                          style: GoogleFont.loginSubTextBlack,
                        ))
                  ],
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
                // Container(
                //   height: 40,
                //   width: double.infinity,
                //   decoration: BoxDecoration(
                //       color: Colors.grey.shade200,
                //       border: Border.all(color: Colors.grey.shade100),
                //       borderRadius: BorderRadius.circular(5)),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.center,
                //     children: [
                //       SvgPicture.asset(
                //         "asset/svgs/phone-portrait-sharp.svg",
                //         width: 25,
                //       ),
                //       const SizedBox(
                //         width: 10,
                //       ),
                //       Text(
                //         'Continue With Phone ',
                //         style: GoogleFont.cardMainText,
                //       ),
                //     ],
                //   ),
                // ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
