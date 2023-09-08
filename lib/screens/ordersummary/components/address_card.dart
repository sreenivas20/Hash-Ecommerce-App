// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hash_ecommerce_user_sideapp/constants/app_color.dart/app_color.dart';
import 'package:hash_ecommerce_user_sideapp/constants/constants.dart';
import 'package:hash_ecommerce_user_sideapp/screens/address/address_screen.dart';
import 'package:hash_ecommerce_user_sideapp/screens/address/components/custom_text.dart';

class AddressCard extends StatelessWidget {
  const AddressCard({super.key, required this.data});
  final data;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400.h,
      width: double.infinity,
      child: Card(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          side: BorderSide(
            width: .5,
            color: Colors.black,
          ),
        ),
        surfaceTintColor: Colors.transparent,
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.only(left: 50.0, right: 20, top: 30).r,
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  kSizedBox10,
                  CustomText(title: 'Name', subTitle: data['name']),
                  kSizedBox10,
                  CustomText(title: 'City', subTitle: data['city']),
                  kSizedBox10,
                  CustomText(title: 'State', subTitle: data['state']),
                  kSizedBox10,
                  CustomText(
                      title: 'Phone number',
                      subTitle: data['phoneNumber'].toString()),
                  kSizedBox10,
                  CustomText(
                      title: 'Pin code', subTitle: data['pin code'].toString()),
                  kSizedBox10,
                  CustomText(
                      title: 'Country code', subTitle: data['country code']),
                  kSizedBox10,
                  CustomText(
                      title: 'Permanent Address',
                      subTitle: data['permanent adress']),
                ],
              ),
              Positioned(
                top: 5,
                right: 5,
                height: 25,
                width: 70,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(0),
                    backgroundColor: AppConstantsColor.materialThemeColor,
                    foregroundColor: Colors.white,
                    fixedSize: Size(270.w, 10.h),
                    elevation: 2,
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ScreenAddAddress(),
                        ));
                  },
                  child: const Text(
                    'Change',
                    style: TextStyle(fontWeight: FontWeight.w700),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
