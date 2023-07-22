import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hash_ecommerce_user_sideapp/constants/constants.dart';
import 'package:hash_ecommerce_user_sideapp/constants/logics/logics.dart';

import 'package:hash_ecommerce_user_sideapp/screens/address/address_screen.dart';
import 'package:hash_ecommerce_user_sideapp/screens/ordersummary/components/ordersummarycardlist.dart';
import 'package:provider/provider.dart';

class OrderSummaryBody extends StatelessWidget {
  const OrderSummaryBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   Provider.of<Logics>(context, listen: false).updateFirebase();
    // });
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 12),
                  child: Text(
                    "Delever to:-",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                TextButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateColor.resolveWith(
                          (states) => const Color.fromARGB(255, 130, 126, 126)
                              .withOpacity(0.2))),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const AddressScreen(),
                    ));
                  },
                  child: const Text(
                    'Change Address',
                    style: TextStyle(color: Color.fromARGB(255, 110, 109, 109)),
                  ),
                ),
              ],
            ),
          ),
          StreamBuilder(
            stream: Provider.of<Logics>(context)
                .addressDb
                .where('Bool', isEqualTo: true)
                .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else if (snapshot.data?.docs.isEmpty ?? true) {
                return const Text('No address selected.');
              } else {
                final selectedAddressSnapshot = snapshot.data!.docs[0];

                return Container(
                  height: 450.h,
                  width: 2100.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            offset: const Offset(0, 3),
                            blurRadius: 5,
                            spreadRadius: 0,
                            color: Colors.black.withOpacity(0.2)),
                      ]),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 18.0, top: 18),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Name : ${selectedAddressSnapshot['Name']} ',
                          style: const TextStyle(
                              fontSize: 17, fontWeight: FontWeight.bold),
                        ),
                        kSizedBox20,
                        Text(
                          'Phone Number : ${selectedAddressSnapshot['PhoneNumber']} ',
                          style: const TextStyle(
                              fontSize: 17, fontWeight: FontWeight.bold),
                        ),
                        kSizedBox20,
                        Text(
                          'Pin Code : ${selectedAddressSnapshot['pincode']}',
                          style: const TextStyle(
                              fontSize: 17, fontWeight: FontWeight.bold),
                        ),
                        kSizedBox20,
                        Text(
                          'City : ${selectedAddressSnapshot['city']}',
                          style: const TextStyle(
                              fontSize: 17, fontWeight: FontWeight.bold),
                        ),
                        kSizedBox20,
                        Text(
                          'State : ${selectedAddressSnapshot['state']}',
                          style: const TextStyle(
                              fontSize: 17, fontWeight: FontWeight.bold),
                        ),
                        kSizedBox20,
                        Text(
                          'House no : ${selectedAddressSnapshot['House no']}',
                          style: const TextStyle(
                              fontSize: 17, fontWeight: FontWeight.bold),
                        ),
                        kSizedBox20,
                        Text(
                          'Area,street : ${selectedAddressSnapshot['Area']}',
                          style: const TextStyle(
                              fontSize: 17, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                );
              }
            },
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15),
            child: Row(
              children: [
                Text(
                  'Order Details :',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 900.h,
            child: ListView.builder(
              itemCount: 2,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return const Padding(
                  padding:
                      EdgeInsets.only(right: 18.0, left: 18, bottom: 8, top: 8),
                  child: OrderSummaryCardListWidget(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
