import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hash_ecommerce_user_sideapp/screens/wishlist/mywishlist_body.dart';

class WishListScreen extends StatelessWidget {
  const WishListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: MyWishListBody(),
    );
  }
}
