import 'package:flutter/material.dart';
import 'package:ivory/presentation/core/constant/color/colors.dart';

class ElevatedButtonWidget extends StatelessWidget {
  const ElevatedButtonWidget({
    Key? key,
    required this.color,
    required this.onPressed,
    required this.title,
    required this.titleStyle,
    this.isLoading = false,
  }) : super(key: key);

  final Color color;
  final String title;
  final Function() onPressed;
  final TextStyle titleStyle;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      width: isLoading ? 50 : MediaQuery.of(context).size.width - 40,
      height: 50,
      margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: xYellow,
      ),
      child: isLoading
          ? const Center(
              child: SizedBox(
                width: 25,
                height: 25,
                child: CircularProgressIndicator(
                  color: Color.fromARGB(255, 2, 2, 2),
                  strokeWidth: 2,
                ),
              ),
            )
          : ElevatedButton(
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
