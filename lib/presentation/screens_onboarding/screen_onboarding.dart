import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:ivory/applicatoin/controller/controllers.dart';
import 'package:ivory/presentation/core/constant/font/google_font.dart';
import 'package:ivory/presentation/login_screen/login_creen.dart';
import 'package:ivory/presentation/screens_onboarding/widgets/dot_indicator.dart';
import 'package:ivory/presentation/screens_onboarding/widgets/elevated_button_widget.dart';
import 'package:super_rich_text/super_rich_text.dart';
import '../core/models/models.dart';
import '../widgets/rich_text_widget.dart';

// ignore: must_be_immutable
class ScreenOnboarding extends StatefulWidget {
  ScreenOnboarding({Key? key}) : super(key: key);
  int index = 0;
  @override
  State<ScreenOnboarding> createState() => _ScreenOnboardingState();
}

class _ScreenOnboardingState extends State<ScreenOnboarding> {
  @override
  Widget build(BuildContext context) {
    var buttonText = 'Next';
    List imageWidgets = [
      imageWidget(context, 'asset/images/onboard_1.jpg'),
      imageWidget(context, 'asset/images/onboard_2.jpg'),
      imageWidget(context, 'asset/images/onboard_3.jpg'),
    ];

    return Scaffold(
      body: Stack(
        children: [
          PageTransitionSwitcher(
            duration: const Duration(seconds: 10),
            transitionBuilder: (child, primaryAnimation, secondaryAnimation) {
              return FadeThroughTransition(
                animation: primaryAnimation,
                secondaryAnimation: secondaryAnimation,
                child: child,
              );
            },
            child: imageWidgets[widget.index],
          ),
          gradiantLayer(context),
          Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                    // color: Colors.amber.withOpacity(0.3),
                    height: MediaQuery.of(context).size.height * 0.7,
                    child: PageView.builder(
                      controller: onboardController,
                      itemCount: tabs.length,
                      itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                        ),
                        child: tabs[index],
                      ),
                      onPageChanged: (index) {
                        setState(() {
                          widget.index = index;
                        });
                      },
                    ),
                  ),
                  DotIndicator(
                    index: widget.index,
                  ),
                  ElevatedButtonWidget(
                    title: buttonText,
                    titleStyle: GoogleFont.textButtonStyle,
                    color: Colors.white,
                    onPressed: () {
                      if (onboardController.page == 2) {
                        Navigator.of(context).pushReplacement(
                            MaterialPageRoute(builder: (ctx) => ScreenLogin()));
                      }
                      onboardController.nextPage(
                          duration: const Duration(milliseconds: 400),
                          curve: Curves.decelerate);
                    },
                  ),
                ],
              )),
          Positioned(
              top: 50,
              right: 20,
              child: GestureDetector(
                onTap: () {
                  onboardController.jumpToPage(2);
                },
                child: Container(
                  height: 30,
                  width: 70,
                  decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(20)),
                  child: const Center(child: Text('Skip')),
                ),
              ))
        ],
      ),
    );
  }

  Image imageWidget(BuildContext context, String image) {
    return Image.asset(
      image,
      fit: BoxFit.cover,
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
    );
  }

  Container gradiantLayer(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.transparent,
            Colors.white.withOpacity(0.1),
            Colors.black87,
          ],
          stops: const [0.3, 0.4, 0.8],
        ),
      ),
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
    );
  }
}
