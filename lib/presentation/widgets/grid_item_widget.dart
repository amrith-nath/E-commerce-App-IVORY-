import 'package:flutter/material.dart';
import 'package:ivory/domine/models/product/product_model.dart';
import 'package:ivory/presentation/core/constant/font/google_font.dart';

class GridItemWidget extends StatelessWidget {
  const GridItemWidget({
    Key? key,
    required this.product,
  }) : super(key: key);

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 5,
        clipBehavior: Clip.hardEdge,
        child: Column(
          children: [
            Expanded(
              flex: 7,
              child: Stack(
                children: [
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(
                              product.images[0],
                            ),
                            fit: BoxFit.cover)),
                  ),
                  Positioned(
                    top: 20,
                    left: 0,
                    child: Container(
                      width: 57,
                      height: 20,
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(10),
                              bottomRight: Radius.circular(10))),
                      child: PhysicalModel(
                        color: Colors.white,
                        borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(10),
                            bottomRight: Radius.circular(10)),
                        elevation: 3,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.star_border_rounded,
                              size: 15,
                            ),
                            Text(
                              product.rating.toString(),
                              style: GoogleFont.cardSubText,
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                width: double.infinity,
                height: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          product.name,
                          style: GoogleFont.cardMainText,
                        ),
                        Text(
                          '\$${product.price}',
                          style: GoogleFont.cardMainText,
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: const CircleAvatar(
                        backgroundColor: Colors.grey,
                        radius: 16,
                        child: PhysicalModel(
                          elevation: 3,
                          shape: BoxShape.circle,
                          color: Colors.white,
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 15,
                            child: Icon(
                              Icons.favorite_outline_outlined,
                              color: Colors.black,
                              size: 15,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
