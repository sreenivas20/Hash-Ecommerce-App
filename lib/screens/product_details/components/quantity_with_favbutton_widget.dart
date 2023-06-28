import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hash_ecommerce_user_sideapp/screens/product_details/components/quantity.dart';

class QuantityWithfavbutton extends StatelessWidget {
  const QuantityWithfavbutton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const QuantityWidget(),
        Container(
            height: 52.h,
            width: 302.w,
            decoration: const BoxDecoration(
              color: Colors.red,
              shape: BoxShape.circle,
            ),
            child: const Center(
              child: Icon(
                Icons.favorite,
                color: Colors.white,
                size: 25,
              ),
            ))
      ],
    );
  }
  
}
