import 'package:flutter/material.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hash_ecommerce_user_sideapp/constants/constants.dart';
import 'package:hash_ecommerce_user_sideapp/constants/logics/address/address_provider.dart';
import 'package:hash_ecommerce_user_sideapp/constants/logics/logics.dart';
import 'package:hash_ecommerce_user_sideapp/payment/payment_methods.dart';
import 'package:provider/provider.dart';

class BottomSheetcontinueButton extends StatelessWidget {
  const BottomSheetcontinueButton({
    super.key,
    required this.totalPrice,
  });
  final int totalPrice;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
          boxShadow: [
            BoxShadow(
                offset: const Offset(0, -5),
                blurRadius: 2,
                color: Colors.black.withOpacity(0.2))
          ]),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 28.0, vertical: 8),
        child: Row(children: [
          Column(
            children: [
              const Text(
                'Total Amount :',
                style: TextStyle(fontSize: 19),
              ),
              Text(
                ' \$ ${totalPrice.toString()}',
                style:
                    const TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
              )
            ],
          ),
          const Spacer(),
          AnimatedButton(
            animationDuration: const Duration(seconds: 1),
            onPress: () {
              Provider.of<AddressProvider>(context, listen: false)
                      .selectedAddressId
                      .isNotEmpty
                  ? Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            ScreenPaymet(totalPrice: totalPrice),
                      ))
                  : Fluttertoast.showToast(
                      msg: 'Select one address to continue',
                      toastLength: Toast.LENGTH_SHORT,
                    );
            },
            animatedOn: AnimatedOn.onTap,
            height: 60,
            width: 150,
            text: 'Continue',
            isReverse: true,
            selectedTextColor: Colors.black,
            borderRadius: 20,
            transitionType: TransitionType.RIGHT_CENTER_ROUNDER,
            // textStyle: submitTextStyle,
            backgroundColor: kPrimaryColor,
            borderColor: Colors.white,
            borderWidth: 1,
          ),
        ]),
      ),
    );
  }
}
