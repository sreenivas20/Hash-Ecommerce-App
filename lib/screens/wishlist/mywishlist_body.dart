import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hash_ecommerce_user_sideapp/constants/constants.dart';
import 'package:hash_ecommerce_user_sideapp/constants/logics/logics.dart';
import 'package:hash_ecommerce_user_sideapp/screens/wishlist/components/wishlist_productlist_widget.dart';
import 'package:hash_ecommerce_user_sideapp/screens/wishlist/components/wishlist_title_and_searchbos.dart';
import 'package:provider/provider.dart';

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
        StreamBuilder(
          stream: Provider.of<Logics>(context)
              .productDb
              .where('id', whereIn: Provider.of<Logics>(context).wishListList)
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasData &&
                Provider.of<Logics>(context).wishListList.isNotEmpty &&
                Provider.of<Logics>(context).wishListList != []) {
              return Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.only(top: 20),
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    final DocumentSnapshot wishlistProducts =
                        snapshot.data!.docs[index];
                    return WishListProductListWidget(
                      wishListProducts: wishlistProducts,
                    );
                  },
                ),
              );
            }
            return Center(child: CircularProgressIndicator());
          },
        ),
      ],
    );
  }
}
