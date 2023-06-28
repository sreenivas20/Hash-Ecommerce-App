import 'package:flutter/material.dart';
import 'package:hash_ecommerce_user_sideapp/constants/constants.dart';
import 'package:hash_ecommerce_user_sideapp/screens/wishlist/components/wishlist_productlist_widget.dart';
import 'package:hash_ecommerce_user_sideapp/screens/wishlist/components/wishlist_title_and_searchbos.dart';

class MyWishListBody extends StatelessWidget {
  const MyWishListBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        kSizedBox40,
        const WishListTitltandSearchbox(),
        Expanded(
          child: ListView.separated(
            padding: const EdgeInsets.only(top: 20),
            itemCount: 5,
            itemBuilder: (context, index) {
              return const WishListProductListWidget();
            },
            separatorBuilder: (context, index) {
              return const Divider(
                color: Colors.black,
              );
            },
          ),
        ),
      ],
    );
  }
}
