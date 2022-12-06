import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class ScreenPayment extends StatefulWidget {
  const ScreenPayment({super.key});

  @override
  State<ScreenPayment> createState() => _ScreenPaymentState();
}

class _ScreenPaymentState extends State<ScreenPayment> {
  Razorpay _razorpay = Razorpay();

  @override
  void initState() {
    super.initState();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    // Do something when payment succeeds
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    // Do something when payment fails
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    // Do something when an external wallet is selected
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(),
    );
  }

  @override
  void dispose() {
    _razorpay.clear(); // Removes all listeners

    super.dispose();
  }
}
