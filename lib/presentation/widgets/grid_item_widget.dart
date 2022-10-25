import 'package:flutter/material.dart';
import 'package:ivory/presentation/core/constant/font/google_font.dart';

class GridItemWidget extends StatelessWidget {
  const GridItemWidget({
    Key? key,
    required this.image,
  }) : super(key: key);

  final String image;

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
                            image: AssetImage(
                              image,
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
                              '  4.4',
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
                          'Spring Dress',
                          style: GoogleFont.cardMainText,
                        ),
                        Text(
                          '\$2400',
                          style: GoogleFont.cardMainText,
                        ),
                      ],
                    ),
                    const CircleAvatar(
                      backgroundColor: Colors.grey,
                      radius: 16,
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 15,
                        child: Icon(
                          Icons.favorite_outline_outlined,
                          color: Colors.black,
                          size: 15,
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
