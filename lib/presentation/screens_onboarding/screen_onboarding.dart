import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ivory/applicatoin/controller/controllers.dart';
import 'package:ivory/applicatoin/cubits/onboarding/onboarding_cubit.dart';
import 'package:ivory/presentation/core/constant/font/google_font.dart';
import 'package:ivory/presentation/screens_onboarding/widgets/dot_indicator.dart';
import 'package:ivory/presentation/screens_onboarding/widgets/elevated_button_widget.dart';
import '../core/models/models.dart';
import '../screen_home/screen_home.dart';
import 'widgets/pageview_widget.dart';

// ignore: must_be_immutable
class ScreenOnboarding extends StatelessWidget {
  ScreenOnboarding({Key? key}) : super(key: key);
  int index = 0;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: Colors.transparent,
    ));

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      BlocProvider.of<OnboardingCubit>(context)
          .getCurrentIndex(currentIndex: 0);
    });

    var buttonText = 'Next';

    List imageWidgets = [
      Scaffold(
        key: const Key('1'),
        body: Image.asset(
          'asset/images/onboard_1.jpg',
          fit: BoxFit.cover,
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
        ),
      ),
      Scaffold(
        key: const Key('2'),
        body: Image.asset(
          'asset/images/onboard_2.jpg',
          fit: BoxFit.cover,
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
        ),
      ),
      Scaffold(
        key: const Key('3'),
        body: Image.asset(
          'asset/images/onboard_3.jpg',
          fit: BoxFit.cover,
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
        ),
      ),
    ];

    return Scaffold(
      body: Stack(
        children: [
          BlocBuilder<OnboardingCubit, OnboardingState>(
            builder: (context, state) {
              return PageTransitionSwitcher(
                duration: const Duration(milliseconds: 200),
                transitionBuilder:
                    (child, primaryAnimation, secondaryAnimation) {
                  return SharedAxisTransition(
                    transitionType: SharedAxisTransitionType.scaled,
                    animation: primaryAnimation,
                    secondaryAnimation: secondaryAnimation,
                    child: child,
                  );
                },
                child: imageWidgets[state.index],
              );
            },
          ),
          gradiantLayer(context),
          Align(
              alignment: Alignment.bottomCenter,
              child: BlocBuilder<OnboardingCubit, OnboardingState>(
                builder: (context, state) {
                  if (state.index == 2) {
                    buttonText = "Start";
                  } else {
                    buttonText = 'Next';
                  }
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(
                        // color: Colors.amber.withOpacity(0.3),
                        height: MediaQuery.of(context).size.height * 0.7,
                        child: const PageViewWidget(),
                      ),
                      DotIndicator(
                        index: state.index,
                      ),
                      ElevatedButtonWidget(
                        title: buttonText,
                        titleStyle: GoogleFont.textButtonStyle,
                        color: Colors.white,
                        onPressed: () {
                          if (onboardController.page == 2) {
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (ctx) => ScreenHome()));
                          }
                          onboardController.nextPage(
                              duration: const Duration(milliseconds: 400),
                              curve: Curves.decelerate);
                        },
                      ),
                    ],
                  );
                },
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

  imageWidget(BuildContext context, String image) {
    return Scaffold(
      body: Image.asset(
        image,
        fit: BoxFit.cover,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
      ),
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
