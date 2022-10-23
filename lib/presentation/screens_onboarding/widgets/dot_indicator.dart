import 'package:flutter/material.dart';

class DotIndicator extends StatelessWidget {
  final int index;

  const DotIndicator({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        dot(index, 0),
        dot(index, 1),
        dot(index, 2),
      ],
    );
  }

  AnimatedContainer dot(int index, int current) {
    return AnimatedContainer(
      margin: const EdgeInsets.only(right: 10, top: 20),
      duration: const Duration(milliseconds: 300),
      height: 7.0,
      width: index == current ? 40.0 : 7,
      decoration: BoxDecoration(
          color: index == current ? Colors.white : Colors.white38,
          borderRadius: BorderRadius.circular(10)),
    );
  }
}
