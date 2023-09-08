// ignore_for_file: public_member_api_docs, sort_constructors_first, prefer_typing_uninitialized_variables
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:hash_ecommerce_user_sideapp/constants/app_color.dart/app_color.dart';
import 'package:hash_ecommerce_user_sideapp/constants/constants.dart';
import 'package:hash_ecommerce_user_sideapp/constants/logics/logics.dart';
import 'package:hash_ecommerce_user_sideapp/screens/product_details/product_details_screen.dart';
import 'package:hash_ecommerce_user_sideapp/screens/widgets/price_widget.dart';
import 'package:provider/provider.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({
    Key? key,
    this.allDetails,
  }) : super(key: key);

  final allDetails;
  @override
  Widget build(BuildContext context) {
    // final wishlistProvider = Provider.of<WishListProvider>(context);
    return GestureDetector(
      onTap: () {
        Get.to(() => ProductListWidgetScreen(productdata: allDetails),
            transition: Transition.fadeIn,
            duration: const Duration(seconds: 1));
      },
      child: Card(
        surfaceTintColor: Colors.transparent,
        color: AppConstantsColor.lightTextColor,
        elevation: 5,
        semanticContainer: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Padding(
          padding: const EdgeInsets.only(left: 8, right: 8, top: 8),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  PriceWidget(fontSize: 24, price: allDetails['price']),
                  Consumer<Logics>(
                    builder: (context, provider, child) {
                      return InkWell(
                        onTap: () {
                          if (provider.wishListList
                              .contains(allDetails['id'])) {
                            provider.wishListList.remove(allDetails['id']);
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
                            provider.wishListList.add(allDetails['id']);
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
                        child: Icon(
                          provider.wishListList.contains(allDetails['id'])
                              ? CupertinoIcons.heart_solid
                              : CupertinoIcons.heart,
                          size: 29,
                          color:
                              provider.wishListList.contains(allDetails['id'])
                                  ? Colors.red
                                  : null,
                        ),
                      );
                    },
                  )
                ],
              ),
              Hero(
                tag: allDetails['id'],
                child: CachedNetworkImage(
                  height: 110,
                  width: 120,
                  filterQuality: FilterQuality.high,
                  fit: BoxFit.contain,
                  imageUrl: allDetails['images'],
                  placeholder: (context, url) => Center(
                    child: CircularProgressIndicator(),
                  ),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
              kSizedBox10,
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          allDetails['productName'],
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: const TextStyle(
                              fontSize: 17, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          allDetails['size'][0],
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
