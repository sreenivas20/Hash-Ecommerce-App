import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hash_ecommerce_user_sideapp/constants/constants.dart';
import 'package:hash_ecommerce_user_sideapp/screens/cart/cart.dart';
import 'package:hash_ecommerce_user_sideapp/screens/home/components/body.dart';
import 'package:hash_ecommerce_user_sideapp/screens/myorder/myorder_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Body(),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: kPrimaryColor,
      elevation: 0,
      leading: IconButton(
        onPressed: () {},
        icon: SvgPicture.asset(
          "assets/icons/menu-alt-05-svgrepo-com.svg",
        ),
        iconSize: 35,
      ),
      actions: [
        Row(
          children: [
            IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  CupertinoPageRoute(
                    builder: (context) => CartScreen(),
                  ),
                );
              },
              icon: SvgPicture.asset(
                "assets/icons/cart-svgrepo-com.svg",
              ),
              iconSize: 35,
            ),
            IconButton(
              onPressed: () {
                Navigator.of(context).push(
                    CupertinoPageRoute(builder: (context) => MyOrderScreen()));
              },
              icon: Icon(
                CupertinoIcons.tag_fill,
                color: Colors.white,
              ),
            )
          ],
        ),
      ],
    );
  }
}
