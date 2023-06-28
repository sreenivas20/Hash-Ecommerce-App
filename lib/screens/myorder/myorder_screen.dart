import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:hash_ecommerce_user_sideapp/screens/myorder/myorder_body_widget.dart';

class MyOrderScreen extends StatelessWidget {
  const MyOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: MyOrderBody(),
    );
  }
}
