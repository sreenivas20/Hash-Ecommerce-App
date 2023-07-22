import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:hash_ecommerce_user_sideapp/constants/constants.dart';
import 'package:hash_ecommerce_user_sideapp/constants/logics/logics.dart';
import 'package:hash_ecommerce_user_sideapp/screens/address/add_address.dart';
import 'package:hash_ecommerce_user_sideapp/screens/address/components/addresslisttile.dart';
import 'package:provider/provider.dart';

class AddressScreen extends StatelessWidget {
  const AddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    log('updated');
    return Scaffold(
      appBar: addressBuildAppbar(context),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Select address',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                addAddressButton(30, 50, "+ Add Address", () {
                  Navigator.of(context).push(CupertinoPageRoute(
                    builder: (context) => const AddAddressScreen(),
                  ));
                })
              ],
            ),
          ),
          Consumer<Logics>(
            builder: (context, provider, _) {
              // WidgetsBinding.instance.addPostFrameCallback((_) {
              //   provider.updateFirebase();
              // });
              return StreamBuilder(
                stream: Provider.of<Logics>(context).addressDb.snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Expanded(
                      child: ListView.builder(
                        padding: const EdgeInsets.only(top: 10),
                        itemCount: snapshot.data!.docs.length,
                        shrinkWrap: true,
                        // physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          final addressData = snapshot.data!.docs[index];
                          final bool isSelected =
                              index == provider.selectedAddress;

                          return RadioListTile(
                            activeColor: Color.fromARGB(255, 137, 7, 157),
                            value: index,
                            title: AddressTileWidget(
                              addressData: addressData,
                            ),
                            selected: isSelected,
                            groupValue: provider.selectedAddress,
                            onChanged: (value) {
                              // provider.selectedAddress = index;
                              provider.addressseleted(
                                index,
                              );
                              provider.updateFirebase();
                              provider.updateCurrentAddress(addressData['id']);
                              Fluttertoast.showToast(
                                msg: 'Address selected',
                                backgroundColor: Colors.green,
                                fontSize: 15,
                              );
                              log(provider.onTap.toString());
                            },
                          );
                        },
                      ),
                    );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              );
            },
          )
        ],
      ),
    );
  }

  AppBar addressBuildAppbar(BuildContext context) {
    return AppBar(
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      leading: IconButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        icon: const Icon(Icons.arrow_back_ios),
      ),
      title: Padding(
        padding: const EdgeInsets.only(left: 48),
        child: Text(
          'Address 🏠',
          style: Theme.of(context)
              .textTheme
              .headlineMedium
              ?.copyWith(fontSize: 25, color: Colors.black),
        ),
      ),
    );
  }

  addAddressButton(double height, double width, String text, Function() press) {
    final ButtonStyle flatButtonStyle = TextButton.styleFrom(
      minimumSize: Size(width, height),
      backgroundColor: kPrimaryColor,
      padding: const EdgeInsets.all(10),
    );
    return TextButton(
      style: flatButtonStyle,
      onPressed: press,
      child: Text(
        text,
        style: const TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
      ),
    );
  }
}
