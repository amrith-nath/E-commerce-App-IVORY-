import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ivory/applicatoin/controller/category_controller.dart';
import 'package:ivory/presentation/core/constant/font/google_font.dart';

class ScreenCategories extends StatelessWidget {
  ScreenCategories({Key? key}) : super(key: key);
  CategoryController categoryController = Get.put(CategoryController());

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
        child: Obx(
          () => ListView.builder(
            itemCount: categoryController.banners.length,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                margin:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                clipBehavior: Clip.hardEdge,
                child: Container(
                  width: double.infinity,
                  height: 120,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                              categoryController.banners[index].image),
                          fit: BoxFit.cover)),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0, top: 40),
                        child: Text(
                          categoryController.banners[index].title.toUpperCase(),
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
      ),
    );
  }
}
