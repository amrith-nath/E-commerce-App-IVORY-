import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:im_stepper/stepper.dart';
import 'package:ivory/domine/models/order/order_model.dart';
import 'package:ivory/infrastructure/repositories/order_repo/order_repo.dart';
import 'package:ivory/infrastructure/repositories/product_repo/product_repo.dart';
import 'package:ivory/presentation/core/constant/color/colors.dart';
// import 'package:flutter_svg/flutter_svg.dart';
import 'package:ivory/presentation/core/constant/font/google_font.dart';

import '../core/constant/size/constant_size.dart';

class ScreenAlerts extends StatelessWidget {
  ScreenAlerts({Key? key}) : super(key: key);
  OrderRepo orderRepo = OrderRepo();
  ProductRepo productRepo = ProductRepo();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: productRepo.getProductsAsList(),
        builder: (context, snap) {
          String getProductPic(String id) {
            var product = snap.data!.firstWhere((element) => element.id == id);

            return product.images[0];
          }

          return StreamBuilder(
              stream: orderRepo.getOrders(),
              builder: ((context, snapshot) {
                if (snapshot.hasData &&
                    snapshot.data != null &&
                    FirebaseAuth.instance.currentUser != null) {
                  log('this stream has data');
                  var orders = snapshot.data!
                      .where(
                        (element) =>
                            element.customerId ==
                            FirebaseAuth.instance.currentUser!.email,
                      )
                      .toList();

                  var currentOrders =
                      orders.where((element) => element.isAccepted).toList();
                  var deliverdOrders = currentOrders
                      .where((element) => element.isDeliverd)
                      .toList();
                  var rejectedOrders =
                      orders.where((element) => element.isRejected).toList();

                  var currentOrdersWidget = orders.map((e) => orderWodget(
                      e,
                      e.id,
                      getProductPic(e.productId[0]),
                      e.total,
                      e.productId.length));
                  log(currentOrdersWidget.length.toString());
                  if (orders.isEmpty) {
                    return const Text('NO orders yet');
                  }
                  return ListView(
                    children: [
                      ...currentOrdersWidget,
                    ],
                  );
                }

                return const Text('Something went Wrong');
              }));
        });
  }

  List<Step> steps = [Step(title: Text('Pending'), content: Container())];

  orderWodget(
      OrderModel order, String? name, String image, double price, int count) {
    var iconIndex = 0;
    var status = 'Pending';

    statusUpdateWidget() {
      if (order.isDeliverd) {
        iconIndex = 3;
        status = 'Deliverd';
      } else if (order.isShiped) {
        iconIndex = 2;
        status = 'Shipped';
      } else if (order.isAccepted) {
        iconIndex = 1;
        status = 'Accepted';
      } else {
        iconIndex = 0;
        status = 'Pending';
      }

      return Column(
        children: [
          Text(
            status.toUpperCase(),
            style: GoogleFont.cardCountText,
          ),
          IconStepper(
            enableNextPreviousButtons: false,
            enableStepTapping: false,
            stepColor: Colors.grey,
            activeStepColor: xYellow,
            activeStepBorderColor: xYellow,
            stepRadius: 15,
            lineColor: Colors.black,
            icons: const [
              Icon(Icons.pending_actions),
              Icon(Icons.done_outline_rounded),
              Icon(Icons.local_shipping),
              Icon(Icons.where_to_vote_outlined),
            ],

            activeStep: iconIndex,

            // This ensures step-tapping updates the activeStep.
          ),
        ],
      );
    }

    return Card(
      clipBehavior: Clip.hardEdge,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.grey.shade200,
            border: Border.all(color: Colors.black12)),
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
                    child: Image.network(
                      image,
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
                      name ?? 'no id found',
                      style: GoogleFont.cardCountText,
                    ),
                    kHeight10,
                    Text('$count Items'),
                    kHeight10,
                    Text(
                      '\$ $price',
                      style: GoogleFont.cardMainText,
                    ),
                  ],
                ),
                const SizedBox(
                  width: 20,
                ),
                const Spacer(),
                kWidth,
              ],
            ),
            const Divider(),
            statusUpdateWidget(),
          ],
        ),
      ),
    );
  }
}
