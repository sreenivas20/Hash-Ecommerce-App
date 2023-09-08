import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class PaymentOptionsCard extends StatelessWidget {
  const PaymentOptionsCard({
    super.key,
    required this.image,
    required this.text,
    required this.onTap,
  });
  final String image;
  final String text;
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Material(
            elevation: 4,
            borderRadius: BorderRadiusDirectional.circular(20),
            child: Container(
              alignment: Alignment.topCenter,
              height: 400.h,
              // width: 500.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadiusDirectional.circular(20),
                border: Border.all(width: .1),
              ),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Lottie.asset(image),
                ),
              ),
            ),
          ),
          Positioned(
              bottom: 40.h,
              child: Text(
                text,
                style: const TextStyle(fontSize: 20),
              )),
        ],
      ),
    );
  }
}
