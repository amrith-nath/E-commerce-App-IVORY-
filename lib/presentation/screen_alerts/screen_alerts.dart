import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
import 'package:ivory/presentation/core/constant/font/google_font.dart';

class ScreenAlerts extends StatelessWidget {
  const ScreenAlerts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(child: Text('No Orders Yet'));
    // return ListView.separated(
    //   physics: const BouncingScrollPhysics(),
    //   itemCount: 10,
    //   separatorBuilder: (context, index) => const Divider(),
    //   itemBuilder: (context, index) =>
    //       // itemBuilder: (context, index) => Padding(
    //       //       padding: const EdgeInsets.symmetric(horizontal: 17),
    //       //       child: Card(
    //       //         color: Colors.grey.shade100,
    //       //         child: Row(children: [
    //       //           Container(
    //       //             width: 60,
    //       //             height: 60,
    //       //             margin: const EdgeInsets.only(
    //       //                 top: 20, bottom: 20, left: 10, right: 20),
    //       //             decoration: BoxDecoration(
    //       //                 shape: BoxShape.circle, color: Colors.grey.shade400),
    //       //             child: const Icon(Icons.notifications_outlined),
    //       //           ),
    //       //           Column(
    //       //             crossAxisAlignment: CrossAxisAlignment.start,
    //       //             children: [
    //       //               Text(
    //       //                 "30% Special Discount!",
    //       //                 style: GoogleFont.textButtonStyle,
    //       //               ),
    //       //               Text(
    //       //                 "30% Special Discount!",
    //       //                 style: GoogleFont.cardSubText,
    //       //               ),
    //       //             ],
    //       //           )
    //       //         ]),
    //       //       ),
    //       //     ));
    //       Text('No Orders Yet'),
    // );
  }
}
