import 'package:flutter/material.dart';
import 'package:ivory/domine/models/order/order_model.dart';
import 'package:ivory/domine/models/user/user_model.dart';
import 'package:ivory/presentation/core/constant/color/colors.dart';
import 'package:ivory/presentation/core/constant/font/google_font.dart';
import 'package:ivory/presentation/core/constant/size/constant_size.dart';
import 'package:ivory/presentation/screen_payment/screen_payment.dart';

class ScreenCheckout extends StatelessWidget {
  const ScreenCheckout({Key? key, required this.user, required this.amount})
      : super(key: key);

  final UserModel user;
  final double amount;
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
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: xYellow),
                      child: const Icon(Icons.location_on_rounded),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          user.address['city'].toString().toUpperCase(),
                          style: GoogleFont.textButtonStyle,
                        ),
                        Text(
                          " ${user.address['house no']}  ${user.address['state']} ${user.address['pin']}",
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
                // kHeight20,
                // Container(
                //   height: 40,
                //   width: double.infinity,
                //   decoration: BoxDecoration(
                //     color: Colors.grey.shade200,
                //     border: Border.all(color: Colors.grey.shade100),
                //     borderRadius: BorderRadius.circular(5),
                //   ),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.center,
                //     children: [
                //       SvgPicture.asset(
                //         "asset/svgs/logo-google.svg",
                //         width: 20,
                //       ),
                //       const SizedBox(
                //         width: 10,
                //       ),
                //       Text(
                //         'Continue With Razor pay',
                //         style: GoogleFont.cardMainText,
                //       ),
                //     ],
                //   ),
                // ),
                kHeight20,
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (ctx) => ScreenPayment(
                              order: OrderModel(
                                customerId: user.email,
                                productId: user.cart.keys.toList(),
                                deliveryFee: 50.0,
                                total: amount,
                                subTotal: amount + 50,
                                isAccepted: false,
                                isShiped: false,
                                isDeliverd: false,
                                isRejected: false,
                                orderPlacedAt: DateTime.now(),
                              ),
                            )));
                  },
                  child: Container(
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
                          'Continue With Razor Pay',
                          style: GoogleFont.cardMainText,
                        ),
                      ],
                    ),
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
