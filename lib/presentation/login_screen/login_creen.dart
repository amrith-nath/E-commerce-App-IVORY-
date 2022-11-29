import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:ivory/infrastructure/repositories/auth_repo/auth_repo.dart';
import 'package:ivory/presentation/core/constant/color/colors.dart';
import 'package:ivory/presentation/core/constant/size/constant_size.dart';
import 'package:ivory/presentation/login_screen/signup_screen.dart';
import 'package:ivory/presentation/screens_onboarding/widgets/elevated_button_widget.dart';
import '../core/constant/font/google_font.dart';

class ScreenLogin extends StatelessWidget {
  ScreenLogin({Key? key}) : super(key: key);
  final formKey = GlobalKey<FormState>();
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _passwordcontroller = TextEditingController();
  final AuthRepo authRepo = AuthRepo();
  bool isloading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    Text(
                      'Login to your account',
                      style: GoogleFont.homeBodyText,
                    ),
                    kHeight,
                    TextFormField(
                      controller: _emailcontroller,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (email) => email == null || email == ''
                          ? 'Enter a valid email'
                          : null,
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
                      obscureText: true,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (password) => password == null ||
                              password.length < 6 ||
                              password == ''
                          ? 'min 6 charcters required'
                          : null,
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
                    StatefulBuilder(builder: (context, set) {
                      return ElevatedButtonWidget(
                        isLoading: isloading,
                        color: xYellow,
                        onPressed: () async {
                          FocusScope.of(context).unfocus();
                          if (formKey.currentState!.validate()) {
                            set(() {
                              isloading = true;
                            });
                            await authRepo.loginWithEmail(
                                email: _emailcontroller.text.trim(),
                                password: _passwordcontroller.text.trim());
                            set(() {
                              isloading = false;
                            });
                            if (FirebaseAuth.instance.currentUser != null) {
                              Get.back();
                            }
                          }
                        },
                        title: 'Login',
                        titleStyle: GoogleFont.cardMainText,
                      );
                    }),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Dont have an account?',
                          style: GoogleFont.loginSubTextGrey,
                        ),
                        TextButton(
                            onPressed: () {
                              Get.off(
                                () => ScreenSignup(),
                                transition: Transition.cupertino,
                                duration: const Duration(milliseconds: 500),
                              );
                            },
                            child: Text(
                              'Create account',
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
        ),
      ),
    );
  }
}
