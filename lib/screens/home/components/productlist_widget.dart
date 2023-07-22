import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hash_ecommerce_user_sideapp/constants/logics/logics.dart';
import 'package:provider/provider.dart';

class ProductWidgetList extends StatelessWidget {
  const ProductWidgetList({
    Key? key,
    required this.image,
    required this.title,
    required this.price,
    required this.press,
    required this.productData,
  }) : super(key: key);

  final String image;
  final String title;
  final double price;
  final Function() press;
  final DocumentSnapshot productData;

  @override
  Widget build(BuildContext context) {
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   Provider.of<Logics>(context, listen: false).getWishList();
    // });
    return Column(
      children: [
        Consumer<Logics>(
          builder: (context, provider, _) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              provider.getWishList();
            });
            return Stack(children: [
              Container(
                // color: Colors.transparent,
                // color: Colors.white.withOpacity(0.15),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    image: DecorationImage(
                      image: NetworkImage(
                        productData['images'],
                      ),
                      fit: BoxFit.cover,
                    )),

                width: 1110.w,
                height: 350.h,
              ),
              Positioned(
                right: 8,
                top: 0,
                left: 125,
                bottom: 190,
                child: Container(
                  width: 40,
                  height: 35,
                  decoration: BoxDecoration(
                      color: Colors.white, shape: BoxShape.circle),
                  child: Padding(
                    padding: const EdgeInsets.only(right: 5.0),
                    child: Center(
                      child: IconButton(
                        onPressed: () {
                          if (provider.wishListList
                              .contains(productData['id'])) {
                            provider.wishListList.remove(productData['id']);
                            provider.updateFirebase();
                            Fluttertoast.showToast(
                                msg: "Item Removed from wishlist 💔",
                                toastLength: Toast.LENGTH_LONG,
                                gravity: ToastGravity.TOP,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Colors.white,
                                textColor: Colors.red,
                                fontSize: 16.0);
                          } else {
                            provider.wishListList.add(productData['id']);
                            provider.updateFirebase();
                            Fluttertoast.showToast(
                                msg: "Item added to wishlist ❤️",
                                toastLength: Toast.LENGTH_LONG,
                                gravity: ToastGravity.TOP,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Colors.white,
                                textColor: Colors.red,
                                fontSize: 16.0);
                          }
                        },
                        icon: Icon(
                          provider.wishListList.contains(productData['id'])
                              ? Icons.favorite
                              : Icons.favorite_border_outlined,
                          color: Colors.red,
                          size: 19,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ]);
          },
        ),
        GestureDetector(
            onTap: press,
            child: Container(
              width: 900.w,
              height: 78.h,
              padding: EdgeInsets.all(40.r),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // kSizedBox5,
                        RichText(
                          overflow: TextOverflow.ellipsis,
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: '${productData['productName']} ',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                        Text(
                          '₹ ${productData['price']}',
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(color: Colors.white),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )
            )
      ],
    );
  }
}
