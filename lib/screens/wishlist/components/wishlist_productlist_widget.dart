import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hash_ecommerce_user_sideapp/constants/constants.dart';
import 'package:hash_ecommerce_user_sideapp/constants/logics/logics.dart';
import 'package:provider/provider.dart';

class WishListProductListWidget extends StatelessWidget {
  const WishListProductListWidget({Key? key, required this.wishListProducts})
      : super(key: key);
  final DocumentSnapshot wishListProducts;
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<Logics>(context, listen: false);

    return Padding(
      padding:
          const EdgeInsets.only(left: 12.0, right: 12.0, top: 8, bottom: 8),
      child: Container(
        height: 160.h,
        width: 200.w,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            // border: Border.all(),
            boxShadow: [
              BoxShadow(
                  offset: const Offset(0, 5),
                  spreadRadius: 0,
                  blurRadius: 2,
                  color: Colors.black.withOpacity(0.3))
            ]),
        child: Row(
          children: [
            Container(
              margin: const EdgeInsets.only(left: 40),
              height: 100.h,
              width: 500.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(wishListProducts['images']),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 5.0, left: 20),
              child: SizedBox(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    kSizedBox20,
                    Text(
                      wishListProducts['productName'],
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                    ),
                    Text(
                      wishListProducts['size'][0],
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                    ),
                    Row(
                      children: [
                        Text(
                          '₹ ${wishListProducts['price']}',
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall
                              ?.copyWith(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                        ),
                        IconButton(
                          onPressed: () async {
                            provider.wishListList
                                .remove(wishListProducts['id']);
                            provider.deleteWishList(wishListProducts['id']);
                            Fluttertoast.showToast(
                                msg: "Item Removed From Wishlist 💔",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.CENTER,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Colors.black,
                                textColor: Colors.white,
                                fontSize: 16.0);
                          },
                          icon: const Icon(
                            Icons.delete_outline,
                            color: Colors.red,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
