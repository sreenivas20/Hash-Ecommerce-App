import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:hash_ecommerce_user_sideapp/screens/myorder/myorder_body_widget.dart';

class MyOrderScreen extends StatelessWidget {
  const MyOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: ScreenOrders(),
    );
  }
}
