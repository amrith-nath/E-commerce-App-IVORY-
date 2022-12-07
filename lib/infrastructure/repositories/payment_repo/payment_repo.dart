import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ivory/applicatoin/bloc/cart_bloc/cart_bloc.dart';
import 'package:ivory/domine/i_repositories/i_payment_repo/i_payment_repo.dart';
import 'package:ivory/domine/models/order/order_model.dart';
import 'package:ivory/domine/models/user/user_model.dart';
import 'package:ivory/infrastructure/repositories/order_repo/order_repo.dart';
import 'package:ivory/infrastructure/repositories/user_repo/user_repo.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

import '../../../presentation/core/keys/scaffold_key.dart';

class PaymentRepo extends IPaymentRepo {
  final _razorpay = Razorpay();
  final userRepo = UserRepo();
  final orderRepo = OrderRepo();
  PaymentRepo(this.amount) {
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }
  final double amount;

  void _handlePaymentSuccess(PaymentSuccessResponse response) async {
    var user = await userRepo.getuser();
    await orderRepo.createOrder(OrderModel(
      customerId: user.email,
      productId: user.cart.keys.toList(),
      deliveryFee: 100,
      total: amount - 100,
      subTotal: amount,
      isAccepted: false,
      isShiped: false,
      isDeliverd: false,
      isRejected: false,
    ));
    await userRepo.updateUser(UserModel(
        id: user.id,
        image: user.image,
        name: user.name,
        email: user.email,
        allOrders: user.allOrders,
        cart: const {},
        currentOrder: user.currentOrder,
        address: user.address,
        favourites: user.favourites));
    homeScaffoldMessengerKey.currentState?.showSnackBar(const SnackBar(
        backgroundColor: Colors.green, content: Text('payment success')));
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    homeScaffoldMessengerKey.currentState?.showSnackBar(const SnackBar(
        backgroundColor: Colors.red, content: Text('payment failed')));
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    // Do something when an external wallet is selected
  }

  @override
  void startPayment(Map<String, Object> options) {
    _razorpay.open(options);
  }
}
