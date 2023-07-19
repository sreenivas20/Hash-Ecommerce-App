import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hash_ecommerce_user_sideapp/constants/logics/logics.dart';
import 'package:hash_ecommerce_user_sideapp/screens/wishlist/mywishlist_body.dart';
import 'package:provider/provider.dart';

class WishListScreen extends StatelessWidget {
  const WishListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Provider.of<Logics>(context).wishListList.isNotEmpty
          ? const MyWishListBody()
          : const Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
