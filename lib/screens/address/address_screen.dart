import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hash_ecommerce_user_sideapp/constants/app_color.dart/app_color.dart';
import 'package:hash_ecommerce_user_sideapp/constants/constants.dart';
import 'package:hash_ecommerce_user_sideapp/constants/logics/address/address_provider.dart';
import 'package:hash_ecommerce_user_sideapp/screens/address/add_address.dart';
import 'package:hash_ecommerce_user_sideapp/screens/address/components/addresslisttile.dart';
import 'package:provider/provider.dart';

class ScreenAddAddress extends StatelessWidget {
  const ScreenAddAddress({super.key});

  @override
  Widget build(BuildContext context) {
    final addressProvider =
        Provider.of<AddressProvider>(context, listen: false);

    final String email = FirebaseAuth.instance.currentUser!.email!;
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        title: Text(
          'Address',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Flexible(
              child: StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection('users')
                      .doc(email)
                      .collection('Address')
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                          child: CupertinoActivityIndicator(
                        radius: 40,
                      ));
                    }
                    if (snapshot.data!.docs.isEmpty) {
                      return const Center(
                          child: Text('No Address Found!',
                              style: TextStyle(fontSize: 20)));
                    }

                    return ListView.separated(
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return Consumer<AddressProvider>(
                            builder: (context, value, child) => RadioListTile(
                              activeColor: AppConstantsColor.materialThemeColor,
                              contentPadding: const EdgeInsets.all(0),
                              value: index,
                              groupValue: value.selectedAddressIndex,
                              onChanged: (value) {
                                addressProvider.setSelectedAddressIndex(index);
                                addressProvider.updateSelectedAddress(
                                    snapshot.data!.docs[index].id);
                                addressProvider.getDefaultAddress();
                              },
                              title: AddAddressCard(
                                  data: snapshot.data!.docs[index]),
                            ),
                          );
                        },
                        separatorBuilder: (context, index) => kSizedBox10,
                        itemCount: snapshot.data!.docs.length);
                  }),
            ),
            kSizedBox10,
            ElevatedButton(
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
                    CupertinoPageRoute(
                      fullscreenDialog: true,
                      builder: (context) => const EditOrAddAddress(
                        editOrAdd: true,
                      ),
                    ));
              },
              child: const Text(
                'Add',
                style: TextStyle(fontWeight: FontWeight.w700),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
