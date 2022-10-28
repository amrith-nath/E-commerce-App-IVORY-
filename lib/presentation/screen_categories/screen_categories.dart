import 'package:flutter/material.dart';
import 'package:ivory/presentation/core/constant/font/google_font.dart';

class ScreenCategories extends StatelessWidget {
  ScreenCategories({Key? key}) : super(key: key);

  final List<String> categoriesString = [
    "Fasion",
    "Shoes",
    "Bags",
    "Watch",
    "Toys",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView.builder(
          itemCount: 5,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              clipBehavior: Clip.hardEdge,
              child: Container(
                width: double.infinity,
                height: 120,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('asset/images/banner_2.png'),
                        fit: BoxFit.cover)),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0, top: 40),
                      child: Text(
                        categoriesString[index].toUpperCase(),
                        style: GoogleFont.catagoryTextStyle,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
