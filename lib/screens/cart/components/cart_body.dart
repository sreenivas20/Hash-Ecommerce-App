import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hash_ecommerce_user_sideapp/constants/constants.dart';
import 'package:hash_ecommerce_user_sideapp/screens/cart/components/cart_productList_with_quantitybutton.dart';
import 'package:hash_ecommerce_user_sideapp/screens/cart/components/promocodecart_widet.dart';
import 'package:hash_ecommerce_user_sideapp/screens/ordersummary/oder_summary_screen.dart';

class CartBody extends StatelessWidget {
  const CartBody({
    super.key,
  });

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
              itemCount: 3,
              itemBuilder: (context, index) {
                return const CartProductListWidget();
              },
            ),
          ),
          // kSizedBox5,
          const PromocodecartWidget(),
          const BillingTextWidget(),
          cartbuttonPreview(60.h, 1900.w, 'Proceed to Checout', () {
            Navigator.of(context).push(CupertinoPageRoute(
              builder: (context) => OrdersummaryScreen(),
            ));
          })
        ],
      ),
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

class BillingTextWidget extends StatelessWidget {
  const BillingTextWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      height: 220.h,
      child: const Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            child: BillingTextFormatWidget(text1: 'Sub Total', text2: '334'),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child:
                BillingTextFormatWidget(text1: 'Shipping fee', text2: 'Free'),
          ),
          Text(
              '---------------------------------------------------------------------------------------------------'),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            child: BillingTextFormatWidget(text1: 'Total Amount', text2: '334'),
          )
        ],
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
