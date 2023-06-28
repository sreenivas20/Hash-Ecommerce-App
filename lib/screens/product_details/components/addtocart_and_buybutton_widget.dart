import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hash_ecommerce_user_sideapp/constants/constants.dart';
import 'package:hash_ecommerce_user_sideapp/screens/home/components/title_with_morw_button.dart';

class AddToCartAndBuyButton extends StatelessWidget {
  const AddToCartAndBuyButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          margin: const EdgeInsets.only(right: kDefaultPadding / 2),
          height: 60.h,
          width: 388.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            border: Border.all(color: kPrimaryColor),
          ),
          child: IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              'assets/icons/cart-svgrepo-com.svg',
              color: kPrimaryColor,
            ),
          ),
        ),
        buttonPreview(66.h, 1500.r, 'BUY NOW', () {}),
      ],
    );
  }
}
