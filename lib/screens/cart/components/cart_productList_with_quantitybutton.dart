import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hash_ecommerce_user_sideapp/constants/app_color.dart/app_color.dart';
import 'package:hash_ecommerce_user_sideapp/constants/constants.dart';
import 'package:hash_ecommerce_user_sideapp/constants/logics/cart/cart_provider.dart';
import 'package:hash_ecommerce_user_sideapp/screens/cart/components/item_count.dart';
import 'package:hash_ecommerce_user_sideapp/screens/product_details/product_details_screen.dart';
import 'package:hash_ecommerce_user_sideapp/screens/widgets/price_widget.dart';
import 'package:provider/provider.dart';

class CartProductListWidget extends StatelessWidget {
  const CartProductListWidget({
    super.key,
    required this.index,
    required this.data,
  });
  final int index;
  final DocumentSnapshot data;
  @override
  Widget build(BuildContext context) {
    int price = int.parse(data['price']);
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => ProductListWidgetScreen(productdata: data),
        ));
      },
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.only(left: 15),
            height: 180.h,
            width: 800.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                  data['images'],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 0.0, left: 30),
            child: SizedBox(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  kSizedBox20,
                  Text(
                    'Shirt',
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge
                        ?.copyWith(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                  kSizedBox5,
                  Text(
                    data['productName'],
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge
                        ?.copyWith(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  kSizedBox5,
                  FutureBuilder(
                    future: Provider.of<CartProvider>(context)
                        .getCartDetails(data['id']),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return const Text('Default Size');
                      }
                      if (snapshot.data != null) {
                        return Text(
                          'Size: ${snapshot.data ?? ''}',
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge
                              ?.copyWith(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                        );
                      }
                      return const Text('Default Size');
                    },
                  ),
                  kSizedBox10,
                  // Text(
                  //   " ₹ ${price.toString()}",
                  //   style: Theme.of(context)
                  //       .textTheme
                  //       .headlineSmall
                  //       ?.copyWith(fontWeight: FontWeight.bold, fontSize: 20),
                  // ),
                  Row(
                    children: [
                      Container(
                        height: 40.h,
                        width: 680.w,
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            color: Colors.black),
                        child: Consumer<CartProvider>(
                            builder: (context, value, child) => ItemCount(
                                  id: data['id'],
                                  index: index,
                                )),
                      ),
                      SizedBox(
                        width: 50.sp,
                      ),
                      Consumer<CartProvider>(
                        builder: (context, value, child) => PriceWidget(
                          fontSize: 24,
                          price: '${value.itemCounts[index] * price}',
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  cartbuildOutlinedButton({IconData? icon, Function()? press}) {
    return SizedBox(
      width: 30,
      height: 26,
      child: OutlinedButton(
        style: ButtonStyle(
          backgroundColor: const MaterialStatePropertyAll(
              Color.fromARGB(255, 167, 208, 240)),
          padding: const MaterialStatePropertyAll(EdgeInsets.zero),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0))),
        ),
        onPressed: press,
        child: Icon(
          icon,
          size: 20,
          weight: 50,
          color: Colors.white,
        ),
      ),
    );
  }
}
