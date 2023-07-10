import 'package:flutter/material.dart';
import 'package:hash_ecommerce_user_sideapp/screens/ordersummary/components/ordersummarybottomsheet.dart';
import 'package:hash_ecommerce_user_sideapp/screens/ordersummary/ordersummary_body.dart';

class OrdersummaryScreen extends StatelessWidget {
  const OrdersummaryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Order Summary',
          style: TextStyle(fontSize: 26),
        ),
      ),
      body: OrderSummaryBody(),
      bottomSheet: const BottomSheetcontinueButton(),
    );
  }
}
