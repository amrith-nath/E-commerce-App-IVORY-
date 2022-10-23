import 'package:flutter/material.dart';
import '../core/constant/font/google_font.dart';

class ScreenLogin extends StatelessWidget {
  ScreenLogin({Key? key}) : super(key: key);

  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 10.0, right: 10, top: 10),
        ),
      ),
    );
  }

  Row loginBottomWidget(BuildContext context,
      {required text, required buttonText, required Function() onTap}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text,
          style: GoogleFont.loginSubTextGrey,
        ),
        TextButton(
          onPressed: onTap,
          child: Text(
            buttonText,
            style: GoogleFont.loginSubTextyellow,
          ),
        ),
      ],
    );
  }

  loginImageWidget(BuildContext context, bool isTaped) {
    return Stack(
      children: [
        AnimatedContainer(
          clipBehavior: Clip.hardEdge,
          width: MediaQuery.of(context).size.width,
          height: isTaped ? 20 : MediaQuery.of(context).size.width * 0.8,
          duration: const Duration(milliseconds: 300),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
          ),
          child: isTaped
              ? const SizedBox()
              : Image.asset(
                  'asset/images/signIn.jpg',
                  fit: BoxFit.cover,
                ),
        ),
      ],
    );
  }
}
