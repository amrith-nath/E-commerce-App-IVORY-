import 'package:flutter/material.dart';

class ScreenCheckout extends StatelessWidget {
  const ScreenCheckout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height / 1.1,
      color: Colors.white,
    );
  }
}
