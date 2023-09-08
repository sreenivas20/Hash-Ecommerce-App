import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hash_ecommerce_user_sideapp/constants/app_color.dart/app_color.dart';
import 'package:hash_ecommerce_user_sideapp/constants/constants.dart';
import 'package:hash_ecommerce_user_sideapp/screens/home/mainhome_screen.dart';
import 'package:lottie/lottie.dart';

Future<dynamic> successShowdialog(BuildContext context, bool successOrFail) {
  return showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) => Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      surfaceTintColor: Colors.transparent,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Lottie.asset(
              successOrFail
                  ? 'assets/images/animation_lmag315s.json'
                  : 'assets/images/order failed animation_lmal7erm.json',
              repeat: successOrFail ? false : true),
          Text(
            successOrFail ? 'Order  Confirmed' : 'Order Failed',
            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
          ElevatedButton(
            style: ButtonStyle(
                fixedSize: MaterialStateProperty.all(Size(800.w, 50.h)),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                )),
                backgroundColor: MaterialStateProperty.all(successOrFail
                    ? AppConstantsColor.materialThemeColor
                    : Colors.red),
                foregroundColor:
                    MaterialStateProperty.all(AppConstantsColor.darkTextColor)),
            onPressed: () {
              successOrFail
                  ? Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ScreenMainPage(),
                      ),
                      (route) => false)
                  : Navigator.pop(context);
            },
            child: Text(
              successOrFail ? 'Go Home' : 'Retry',
              style: TextStyle(
                  fontSize: 16,
                  color: successOrFail
                      ? AppConstantsColor.darkTextColor
                      : Colors.black),
            ),
          ),
          kSizedBox10,
        ],
      ),
    ),
  );
}
