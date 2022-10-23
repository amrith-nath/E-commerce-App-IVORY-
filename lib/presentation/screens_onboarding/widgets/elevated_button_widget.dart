import 'package:flutter/material.dart';

class ElevatedButtonWidget extends StatelessWidget {
  const ElevatedButtonWidget({
    Key? key,
    required this.color,
    required this.onPressed,
    required this.title,
    required this.titleStyle,
  }) : super(key: key);

  final Color color;
  final String title;
  final Function() onPressed;
  final TextStyle titleStyle;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      margin: const EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
      ),
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(color),
          shape: MaterialStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          title,
          style: titleStyle,
        ),
      ),
    );
  }
}
