import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hash_ecommerce_user_sideapp/constants/constants.dart';
import 'package:hash_ecommerce_user_sideapp/screens/cart/cart.dart';
import 'package:hash_ecommerce_user_sideapp/screens/product_details/details_body.dart';

class ProductListWidgetScreen extends StatelessWidget {
  const ProductListWidgetScreen({super.key, required this.productdata});

  final DocumentSnapshot productdata;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      appBar: productscreenappbar(context),
      ////////////////////* The Full body widget of the product details///////////////////////////
      body: ProductDetailsBody(productData: productdata),
      ////////////////////* The Full body widget of the product details///////////////////////////
    );
  }

  AppBar productscreenappbar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: IconButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        icon: const Icon(
          color: Colors.black,
          Icons.arrow_back_ios,
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {
            Navigator.of(context).push(
              CupertinoPageRoute(
                builder: (context) => CartScreen(),
              ),
            );
          },
          icon: SvgPicture.asset('assets/icons/cart-svgrepo-com.svg',
              color: Colors.black),
        ),
        const SizedBox(
          width: kDefaultPadding / 2,
        ),
      ],
    );
  }
}
