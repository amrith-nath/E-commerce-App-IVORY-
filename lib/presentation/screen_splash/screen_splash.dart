import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ivory/presentation/screens_onboarding/screen_onboarding.dart';

import '../core/constant/color/colors.dart';
import '../core/constant/font/google_font.dart';
import '../widgets/rich_text_widget.dart';

class ScreenSplash extends StatelessWidget {
  const ScreenSplash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));
    WidgetsBinding.instance.addPostFrameCallback((_) {
      navigateFromSplash(context);
    });

    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 85,
              child: Stack(
                children: [
                  const RichTextWidget(
                    text: 'IvyyOyyry',
                  ),
                  Positioned(
                    bottom: 0,
                    left: 2,
                    child: Text(
                      'All About Clothing',
                      style: GoogleFont.splashStyleGrey,
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 20),
              width: 30,
              height: 30,
              child: const CircularProgressIndicator(
                color: xYellow,
              ),
            ),
          ],
        ),
      )),
    );
  }

  navigateFromSplash(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 3));

    // ignore: use_build_context_synchronously
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (ctx) => ScreenOnboarding()));
  }
}
