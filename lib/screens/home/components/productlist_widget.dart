import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hash_ecommerce_user_sideapp/constants/constants.dart';

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
    return Column(
      children: [
        Stack(
          children: [
            BlurryContainer(
              color: Colors.transparent,
              // color: Colors.white.withOpacity(0.15),
              blur: 180,
              width: 900.w,
              height: 170.h,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10), topRight: Radius.circular(10)),
              child: Image.network(
                productData['images'],
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              right: 0,
              top: 0,
              left: 100,
              bottom: 150,
              child: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.favorite_border_outlined,
                  color: Colors.red,
                ),
              ),
            ),
          ],
        ),
        GestureDetector(
          onTap: press,
          child: AnimatedContainer(
            duration: Duration(seconds: 500),
            width: 900.w,
            height: 78.h,
            padding: EdgeInsets.all(40.r),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
              color: Colors.white70,
              boxShadow: [
                BoxShadow(
                  offset: const Offset(0, 10),
                  blurRadius: 50,
                  color: kPrimaryColor.withOpacity(0.23),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      kSizedBox5,
                      RichText(
                        overflow: TextOverflow.ellipsis,
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: '${productData['productName']} ',
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                          ],
                        ),
                      ),
                      Text(
                        '₹ ${productData['price']}',
                        style: Theme.of(context).textTheme.bodyLarge,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
