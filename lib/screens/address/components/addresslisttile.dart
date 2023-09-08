import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hash_ecommerce_user_sideapp/constants/constants.dart';
import 'package:hash_ecommerce_user_sideapp/constants/logics/address/address_provider.dart';
import 'package:hash_ecommerce_user_sideapp/screens/address/add_address.dart';
import 'package:hash_ecommerce_user_sideapp/screens/address/components/custom_text.dart';
import 'package:hash_ecommerce_user_sideapp/screens/address/function/address_function.dart';
import 'package:provider/provider.dart';

class AddAddressCard extends StatelessWidget {
  const AddAddressCard({super.key, required this.data});
  final QueryDocumentSnapshot<Map<String, dynamic>> data;
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
                      title: 'Zip code', subTitle: data['pin code'].toString()),
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
                top: 0,
                right: 30,
                width: 70,
                child: IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        CupertinoPageRoute(
                          fullscreenDialog: true,
                          builder: (context) =>
                              EditOrAddAddress(editOrAdd: false, data: data),
                        ));
                  },
                  icon: const Icon(Icons.edit),
                ),
              ),
              Positioned(
                top: 0,
                right: 0,
                child: IconButton(
                  onPressed: () {
                    AdressFunctions().detleteShowDialoge(context, data['id']);
                    Provider.of<AddressProvider>(context, listen: false)
                        .getDefaultAddress();
                  },
                  icon: const Icon(
                    Icons.delete_forever_outlined,
                    color: Colors.red,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
