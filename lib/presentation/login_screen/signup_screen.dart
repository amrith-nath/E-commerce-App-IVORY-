import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:ivory/domine/models/user/user_model.dart';
import 'package:ivory/infrastructure/repositories/auth_repo/auth_repo.dart';
import 'package:ivory/presentation/core/constant/font/google_font.dart';
import 'package:ivory/presentation/login_screen/login_creen.dart';

import '../core/constant/color/colors.dart';
import '../core/constant/size/constant_size.dart';
import '../screens_onboarding/widgets/elevated_button_widget.dart';

class ScreenSignup extends StatelessWidget {
  ScreenSignup({super.key});
  final formKey = GlobalKey<FormState>();
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _passwordcontroller = TextEditingController();
  final TextEditingController _namecontroller = TextEditingController();
  final TextEditingController _numbercontroller = TextEditingController();
  final TextEditingController _citycontroller = TextEditingController();
  final TextEditingController _statecontroller = TextEditingController();
  final TextEditingController _pincontroller = TextEditingController();
  final TextEditingController _housecontroller = TextEditingController();
  final TextEditingController _areacontroller = TextEditingController();

  final AuthRepo authRepo = AuthRepo();
  bool isloading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(elevation: 0),
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    Text(
                      'Create your account',
                      style: GoogleFont.homeBodyText,
                    ),
                    kHeight20,
                    textFieldWidget(
                      controller: _namecontroller,
                      validator: (email) => email == null || email == ''
                          ? 'Enter a valid name'
                          : null,
                      hintText: 'Name',
                      isPassword: false,
                    ),
                    kHeight10,
                    textFieldWidget(
                      isNumber: true,
                      controller: _numbercontroller,
                      validator: (email) => email == null || email == ''
                          ? 'Enter a valid Phone number'
                          : null,
                      hintText: 'Phone number',
                      isPassword: false,
                    ),
                    kHeight10,
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Flexible(
                          child: textFieldWidget(
                            controller: _citycontroller,
                            validator: (email) => email == null || email == ''
                                ? 'Enter a valid City name'
                                : null,
                            hintText: 'City',
                            isPassword: false,
                          ),
                        ),
                        kWidth,
                        Flexible(
                          child: textFieldWidget(
                            controller: _statecontroller,
                            validator: (email) => email == null || email == ''
                                ? 'Enter a valid State name'
                                : null,
                            hintText: 'State',
                            isPassword: false,
                          ),
                        ),
                      ],
                    ),
                    kHeight10,
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Flexible(
                          child: textFieldWidget(
                            isNumber: true,
                            controller: _pincontroller,
                            validator: (email) => email == null || email == ''
                                ? 'Enter a valid Pincode'
                                : null,
                            hintText: 'pincode',
                            isPassword: false,
                          ),
                        ),
                        kWidth,
                        Flexible(
                          child: textFieldWidget(
                            controller: _housecontroller,
                            validator: (email) => email == null || email == ''
                                ? 'Enter a valid House name'
                                : null,
                            hintText: 'House name',
                            isPassword: false,
                          ),
                        ),
                      ],
                    ),
                    kHeight10,
                    textFieldWidget(
                      controller: _areacontroller,
                      validator: (email) => email == null || email == ''
                          ? 'Enter a valid Area Name or Colony name'
                          : null,
                      hintText: 'Area Name or Colony name',
                      isPassword: false,
                    ),
                    kHeight10,
                    textFieldWidget(
                      controller: _emailcontroller,
                      validator: (email) => email == null || email == ''
                          ? 'Enter a valid email'
                          : null,
                      hintText: 'Email',
                      isPassword: false,
                    ),
                    kHeight10,
                    textFieldWidget(
                      controller: _passwordcontroller,
                      validator: (password) => password == null ||
                              password.length < 6 ||
                              password == ''
                          ? 'min 6 charcters required'
                          : null,
                      hintText: 'Password',
                      isPassword: true,
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
                            await authRepo.signUp(
                                email: _emailcontroller.text.trim(),
                                password: _passwordcontroller.text.trim(),
                                user: UserModel(
                                  id: _emailcontroller.text.trim(),
                                  image: '',
                                  name: _namecontroller.text.trim(),
                                  email: _emailcontroller.text.trim(),
                                  allOrders: const <String>[],
                                  cart: const <String, int>{},
                                  currentOrder: const <String>[],
                                  address: <String, String>{
                                    'number': _numbercontroller.text,
                                    'city': _citycontroller.text,
                                    'state': _statecontroller.text,
                                    'house no': _housecontroller.text,
                                    'pin': _pincontroller.text,
                                  },
                                ));
                            set(() {
                              isloading = false;
                            });
                            if (FirebaseAuth.instance.currentUser != null) {
                              Get.back();
                            } else {
                              set(() {
                                isloading = false;
                              });
                            }
                          }
                        },
                        title: 'Sign Up',
                        titleStyle: GoogleFont.cardMainText,
                      );
                    }),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Already have an account?',
                          style: GoogleFont.loginSubTextGrey,
                        ),
                        TextButton(
                            onPressed: () {
                              Get.off(() => ScreenLogin(),
                                  transition: Transition.cupertino,
                                  duration: const Duration(milliseconds: 500));
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
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget textFieldWidget({
    required TextEditingController controller,
    required String? Function(String? value) validator,
    required String hintText,
    required bool isPassword,
    bool isNumber = false,
  }) {
    return TextFormField(
      keyboardType: isNumber ? TextInputType.number : TextInputType.text,
      obscureText: isPassword,
      controller: controller,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: validator,
      decoration: InputDecoration(
        hintText: hintText,
        fillColor: Colors.grey.shade300,
        filled: true,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
