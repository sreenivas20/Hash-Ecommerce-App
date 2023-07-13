import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hash_ecommerce_user_sideapp/constants/constants.dart';

class ProductTitleImageWidget extends StatelessWidget {
  const ProductTitleImageWidget({
    super.key,
    required this.productData,
  });
  final DocumentSnapshot productData;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "${productData['category']} Shirts",
            style: Theme.of(context)
                .textTheme
                .headlineSmall
                ?.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          Text(
            productData['productName'],
            style: Theme.of(context).textTheme.displaySmall?.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.normal,
                fontSize: 18.5),
          ),
          Container(
            // margin: EdgeInsets.only(top: 50),
            child: Row(
              children: [
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Price\n',
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(color: Colors.white),
                      ),
                      TextSpan(
                        text: '₹ ${productData['price']}',
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall
                            ?.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                kwSizedBox40,
                Container(
                  // margin: EdgeInsets.only(left: 150),
                  width: 250,
                  height: 280,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      // fit: BoxFit.cover,
                      image: NetworkImage(productData['images']),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
