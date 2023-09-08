import 'package:flutter/material.dart';
import 'package:hash_ecommerce_user_sideapp/constants/app_color.dart/app_color.dart';

class PriceWidget extends StatelessWidget {
  const PriceWidget({
    super.key,
    required this.fontSize,
    required this.price,
  });
  final String price;
  final double fontSize;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          '\$ ',
          style: TextStyle(
              fontSize: fontSize,
              color: AppConstantsColor.darkTextColor,
              fontWeight: FontWeight.w600),
        ),
        Text(
          price,
          style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.w600),
        ),
      ],
    );
  }
}
