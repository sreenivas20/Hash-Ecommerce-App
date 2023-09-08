import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hash_ecommerce_user_sideapp/constants/constants.dart';
import 'package:hash_ecommerce_user_sideapp/constants/logics/cart/cart_provider.dart';
import 'package:hash_ecommerce_user_sideapp/screens/cart/components/cart_productList_with_quantitybutton.dart';
import 'package:hash_ecommerce_user_sideapp/screens/functions/cartfunctions.dart';
import 'package:hash_ecommerce_user_sideapp/screens/ordersummary/oder_summary_screen.dart';
import 'package:provider/provider.dart';

class CartBody extends StatelessWidget {
  const CartBody({
    super.key,
    required this.snapshot,
  });
  final AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 10),
            child: Text(
              'MY CART',
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 500.h,
            child: ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                DocumentSnapshot data = snapshot.data!.docs[index];
                return Slidable(
                    endActionPane:
                        ActionPane(motion: const BehindMotion(), children: [
                      SlidableAction(
                        borderRadius: BorderRadius.circular(10),
                        backgroundColor: Colors.black,
                        icon: Icons.delete,
                        label: 'Delete',
                        onPressed: (context) {
                          CartFunctions.dialogBuilder(context, data['id']);
                        },
                      )
                    ]),
                    child: CartProductListWidget(
                      data: data,
                      index: index,
                    ));
              },
            ),
          ),
          // kSizedBox5,
          // const PromocodecartWidget(),
          const BillingTextWidget(),
          kSizedBox40,
        ],
      ),
    );
  }
}

class BillingTextWidget extends StatelessWidget {
  const BillingTextWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    int? totalPrice;
    return FutureBuilder<int>(
      future: Provider.of<CartProvider>(context).getTotalPrice(),
      builder: (context, snapshot) {
        totalPrice = snapshot.data ?? 0;
        return Container(
          margin: const EdgeInsets.all(5),
          height: 350.h,
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                child: BillingTextFormatWidget(
                    text1: 'Sub Total', text2: totalPrice.toString()),
              ),
              const Divider(height: 2, color: Colors.black),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                child: BillingTextFormatWidget(
                    text1: 'Shipping fee', text2: 'Free'),
              ),
              // Text(
              //     '---------------------------------------------------------------------------------------------------'),
              const Divider(height: 2, color: Colors.black),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: BillingTextFormatWidget(
                    text1: 'Total Amount', text2: totalPrice.toString()),
              ),
              kSizedBox40,
              cartbuttonPreview(60.h, 1900.w, 'Proceed to Checout', () {
                log(Provider.of<CartProvider>(context, listen: false)
                    .ids
                    .toString());
                Provider.of<CartProvider>(context, listen: false).ids.isNotEmpty
                    ? Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              OrdersummaryScreen(totalPrice: totalPrice!),
                        ),
                      )
                    : Fluttertoast.showToast(
                        msg: 'Add some items in cart to checkout');
              })
            ],
          ),
        );
      },
    );
  }

  cartbuttonPreview(
      double height, double width, String text, Function() press) {
    final ButtonStyle flatButtonStyle = TextButton.styleFrom(
      minimumSize: Size(width, height),
      backgroundColor: kPrimaryColor,
      padding: const EdgeInsets.all(10),
    );
    return TextButton(
      style: flatButtonStyle,
      onPressed: press,
      child: Text(
        text,
        style: const TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
      ),
    );
  }
}

class BillingTextFormatWidget extends StatelessWidget {
  const BillingTextFormatWidget({
    super.key,
    required this.text1,
    required this.text2,
  });
  final text1;
  final text2;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text1,
          style: Theme.of(context)
              .textTheme
              .bodyMedium
              ?.copyWith(fontWeight: FontWeight.bold, fontSize: 15),
        ),
        Text(
          '\$ $text2 ',
          style: Theme.of(context)
              .textTheme
              .bodyMedium
              ?.copyWith(fontWeight: FontWeight.bold, fontSize: 15),
        ),
      ],
    );
  }
}
