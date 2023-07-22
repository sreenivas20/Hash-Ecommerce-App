
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hash_ecommerce_user_sideapp/constants/constants.dart';
import 'package:hash_ecommerce_user_sideapp/constants/logics/logics.dart';
import 'package:hash_ecommerce_user_sideapp/screens/address/edit_address.dart';
import 'package:provider/provider.dart';

class AddressTileWidget extends StatelessWidget {
  const AddressTileWidget({
    super.key,
    required this.addressData,
  });
  final  addressData;
  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: const EdgeInsets.all(5),
      height: 450.h,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                offset: const Offset(2, 2),
                blurRadius: 5,
                color: Colors.black.withOpacity(0.2))
          ]),
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Name: ${addressData['Name']}',
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            kSizedBox10,
            Text(
              'Phone Number: ${addressData['PhoneNumber']}',
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            kSizedBox10,
            Text(
              'Pincode: ${addressData['pincode']}',
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            kSizedBox10,
            Text(
              'City: ${addressData['city']}',
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            kSizedBox10,
            Text(
              'State: ${addressData['state']}',
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            kSizedBox10,
            Text(
              'House No: ${addressData['House no']}',
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            kSizedBox10,
            Text(
              'Area: ${addressData['Area']}',
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.of(context).push(CupertinoPageRoute(
                        builder: (context) =>
                            EditAddressScreen(addressEditData: addressData),
                      ));
                    },
                    icon: const Icon(Icons.edit)),
                IconButton(
                    onPressed: () {
                      Provider.of<Logics>(context, listen: false)
                          .deleteAddress(addressData['id']);
                      Fluttertoast.showToast(
                        gravity: ToastGravity.SNACKBAR,
                        timeInSecForIosWeb: 1,
                        msg: 'Address deleted',
                        backgroundColor: Colors.red,
                        fontSize: 15,
                      );
                    },
                    icon: const Icon(Icons.delete_outline))
              ],
            )
          ],
        ),
      ),
    );
  }
}
