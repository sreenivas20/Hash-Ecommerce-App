import 'package:flutter/material.dart';
import 'package:hash_ecommerce_user_sideapp/screens/dashboard/dashboardbody.dart';

class DashBoardScreen extends StatelessWidget {
  const DashBoardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: dashboardAppBar(context),
        body: const DashBoardBody());
  }

  AppBar dashboardAppBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      title: const Center(
        child: Padding(
          padding: EdgeInsets.only(right: 50.0),
          child: Text(
            'My Dashboard 🏷️',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
