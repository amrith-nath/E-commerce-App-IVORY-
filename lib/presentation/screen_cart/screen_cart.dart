import 'package:flutter/material.dart';
import 'package:ivory/presentation/core/constant/color/colors.dart';
import 'package:ivory/presentation/core/constant/size/constant_size.dart';
import 'package:ivory/presentation/screen_checkout/screen_checkout.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../core/constant/font/google_font.dart';

class ScreenCart extends StatelessWidget {
  const ScreenCart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: 30,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.only(top: 10, left: 18, right: 18),
            child: Card(
              clipBehavior: Clip.hardEdge,
              child: Container(
                height: 180,
                decoration: BoxDecoration(color: Colors.grey.shade200),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    kHeight10,
                    Row(
                      children: [
                        const SizedBox(
                          width: 10,
                        ),
                        Card(
                          elevation: 3,
                          child: SizedBox(
                            height: 90,
                            width: 70,
                            child: Image.asset(
                              'asset/images/card_1.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Spring dress',
                              style: GoogleFont.homeBodyText,
                            ),
                            Text(
                              'size - L',
                              style: GoogleFont.loginSubTextGrey,
                            ),
                            kHeight10,
                            Text(
                              '\$ 2430',
                              style: GoogleFont.cardMainText,
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Column(
                          children: [
                            kHeight,
                            kHeight10,
                            Container(
                              height: 30,
                              width: 70,
                              decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Center(
                                  child: Text(
                                '-   1   +',
                                style: GoogleFont.cardMainText,
                              )),
                            ),
                          ],
                        )
                      ],
                    ),
                    Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton.icon(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.delete,
                              color: Colors.red,
                            ),
                            label: Text(
                              'Remove',
                              style: GoogleFont.loginSubTextGrey,
                            )),
                        TextButton.icon(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.shopping_bag,
                              color: Colors.black,
                            ),
                            label: Text(
                              'Buy Now',
                              style: GoogleFont.loginSubTextGrey,
                            )),
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              color: Colors.grey.shade300,
            ),
          ),
        ),
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 20),
        height: 80,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '\$ 2,400',
                  style: GoogleFont.homeBodyText,
                ),
                Text(
                  "Total Price",
                  style: GoogleFont.dropDownText,
                ),
              ],
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 1.8,
              height: 60,
              child: ElevatedButton.icon(
                onPressed: () {
                  showMaterialModalBottomSheet(
                      clipBehavior: Clip.hardEdge,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30))),
                      elevation: 5,
                      context: context,
                      builder: (context) => ScreenCheckout());
                },
                style: ButtonStyle(
                  shape: MaterialStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
                icon: const Icon(Icons.circle_outlined),
                label: Text(
                  'Checkout',
                  style: GoogleFont.loginSubTextBlack,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
