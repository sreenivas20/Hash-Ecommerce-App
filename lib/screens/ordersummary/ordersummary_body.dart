import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hash_ecommerce_user_sideapp/constants/app_color.dart/app_color.dart';
import 'package:hash_ecommerce_user_sideapp/constants/constants.dart';
import 'package:hash_ecommerce_user_sideapp/constants/logics/address/address_provider.dart';
import 'package:hash_ecommerce_user_sideapp/constants/logics/cart/cart_provider.dart';
import 'package:hash_ecommerce_user_sideapp/constants/logics/logics.dart';

import 'package:hash_ecommerce_user_sideapp/screens/address/address_screen.dart';
import 'package:hash_ecommerce_user_sideapp/screens/ordersummary/components/address_card.dart';
import 'package:hash_ecommerce_user_sideapp/screens/ordersummary/components/continuorder_button.dart';
import 'package:hash_ecommerce_user_sideapp/screens/ordersummary/components/ordersummarycardlist.dart';
import 'package:provider/provider.dart';

class OrderSummaryBody extends StatelessWidget {
  const OrderSummaryBody({
    super.key,
    required this.totalPrice,
  });
  final int totalPrice;
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<AddressProvider>(context, listen: false).getDefaultAddress();
    });

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
                      builder: (context) => const ScreenAddAddress(),
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
          Consumer<AddressProvider>(
              builder: (context, value, child) =>
                  value.selectedAddressId.isNotEmpty
                      ? StreamBuilder(
                          stream: value.getSelectedAddressStream(),
                          builder: (context, snapshot) {
                            if (snapshot.data == null) {
                              return Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                            if (snapshot.hasError) {
                              return Text('Error: ${snapshot.error}');
                            } else {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: AddressCard(data: snapshot.data),
                              );
                            }
                          },
                        )
                      : Container(
                          padding: const EdgeInsets.all(25).r,
                          decoration: BoxDecoration(
                              border: Border.all(),
                              borderRadius: BorderRadius.circular(10)),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Center(
                                child: Text('No Address were added',
                                    style: TextStyle(fontSize: 20)),
                              ),
                              TextButton.icon(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      CupertinoPageRoute(
                                        builder: (context) =>
                                            const ScreenAddAddress(),
                                      ));
                                },
                                icon: const Icon(CupertinoIcons.add),
                                label: const Text(
                                  'Add Address',
                                  style: TextStyle(fontSize: 20),
                                ),
                                style: ButtonStyle(
                                    foregroundColor: MaterialStateProperty.all(
                                        AppConstantsColor.materialThemeColor)),
                              )
                            ],
                          ),
                        )),
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
            child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
              stream: FirebaseFirestore.instance
                  .collection('products')
                  .where('id',
                      whereIn:
                          Provider.of<CartProvider>(context, listen: false).ids)
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.data == null) {
                  return const Center(
                      child: CupertinoActivityIndicator(
                    radius: 40,
                  ));
                }
                if (snapshot.hasError) {
                  return const Text('Somthing went wrong');
                }
                if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      DocumentSnapshot data = snapshot.data!.docs[index];
                      return Padding(
                        padding: const EdgeInsets.only(
                            right: 18.0, left: 18, bottom: 8, top: 8),
                        child: OrderSummaryCardListWidget(data: data),
                      );
                    },
                  );
                }
                return Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
