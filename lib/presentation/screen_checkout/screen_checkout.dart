import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ivory/presentation/core/constant/color/colors.dart';
import 'package:ivory/presentation/core/constant/font/google_font.dart';
import 'package:ivory/presentation/core/constant/size/constant_size.dart';

class ScreenCheckout extends StatelessWidget {
  const ScreenCheckout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height / 1.1,
      color: Colors.white,
      child: Column(
        children: [
          kHeight,
          Text(
            'Checkout',
            style: GoogleFont.homeBodyText,
          ),
          const Divider(
            color: Colors.black,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      'Shipping Address',
                      style: GoogleFont.homeBodyText,
                    ),
                  ],
                ),
                kHeight10,
                Card(
                  elevation: 4,
                  color: Colors.white,
                  child: Row(children: [
                    Container(
                      width: 60,
                      height: 60,
                      margin: const EdgeInsets.only(
                          top: 10, bottom: 10, left: 10, right: 20),
                      decoration:
                          BoxDecoration(shape: BoxShape.circle, color: xYellow),
                      child: const Icon(Icons.location_on_rounded),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Home",
                          style: GoogleFont.textButtonStyle,
                        ),
                        Text(
                          "6180 Penton Park, PC 567/9",
                          style: GoogleFont.cardMainText,
                        ),
                      ],
                    )
                  ]),
                ),
                kHeight,
                const Divider(
                  color: Colors.black,
                ),
                kHeight10,
                Row(
                  children: [
                    Text(
                      "Choose a payment method",
                      style: GoogleFont.textButtonStyle,
                    ),
                  ],
                ),
                kHeight20,
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
                        width: 20,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Continue With Gpay',
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
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.payment),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Continue With Rpay',
                        style: GoogleFont.cardMainText,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
