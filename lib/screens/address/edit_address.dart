import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hash_ecommerce_user_sideapp/Infrastructure/model/address_model.dart';
import 'package:hash_ecommerce_user_sideapp/constants/constants.dart';
import 'package:hash_ecommerce_user_sideapp/constants/logics/logics.dart';
import 'package:hash_ecommerce_user_sideapp/constants/textfieldfuntions/textfieldfun.dart';
import 'package:hash_ecommerce_user_sideapp/screens/address/components/address_textfield.dart';
import 'package:provider/provider.dart';

class EditAddressScreen extends StatefulWidget {
  const EditAddressScreen({super.key, required this.addressEditData});
  final DocumentSnapshot addressEditData;

  @override
  State<EditAddressScreen> createState() => _EditAddressScreenState();
}

class _EditAddressScreenState extends State<EditAddressScreen> {
  @override
  void initState() {
    nameeditontroller.text = widget.addressEditData['Name'];
    phNumbereditcontoller.text = widget.addressEditData['PhoneNumber'];
    pincodeeditcontroller.text = widget.addressEditData['pincode'];
    cityeditController.text = widget.addressEditData['city'];
    stateeditController.text = widget.addressEditData['state'];
    houseNoeditController.text = widget.addressEditData['House no'];
    areaeditController.text = widget.addressEditData['Area'];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    log(widget.addressEditData['Name']);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(Icons.arrow_back_ios)),
        title: const Padding(
          padding: EdgeInsets.only(left: 8.0),
          child: Text(
            'Edit Address',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
          ),
        ),
      ),
      body: Form(
        key: formkeyAddressedit,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: AddressTextField(
                    height: 90.h,
                    width: 2300.w,
                    text: "Name",
                    controller: nameeditontroller,
                    validator: addressValidator),
              ),
              kSizedBox20,
              AddressTextField(
                  height: 90.h,
                  width: 2300.w,
                  text: "Phone Number",
                  controller: phNumbereditcontoller,
                  validator: addressValidator),
              kSizedBox20,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  AddressTextField(
                      height: 90.h,
                      width: 1100.w,
                      text: "Pincode",
                      controller: pincodeeditcontroller,
                      validator: addressValidator),
                  AddressTextField(
                      height: 90.h,
                      width: 1100.w,
                      text: "City",
                      controller: cityeditController,
                      validator: addressValidator),
                ],
              ),
              kSizedBox20,
              AddressTextField(
                  height: 90.h,
                  width: 2300.w,
                  text: "State",
                  controller: stateeditController,
                  validator: addressValidator),
              kSizedBox20,
              AddressTextField(
                  height: 90.h,
                  width: 2300.w,
                  text: "House no:/ Building no:",
                  controller: houseNoeditController,
                  validator: addressValidator),
              kSizedBox20,
              AddressTextField(
                  height: 90.h,
                  width: 2300.w,
                  text: "Area",
                  controller: areaeditController,
                  validator: addressValidator),
              kSizedBox40,
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: SizedBox(
                  width: 300,
                  height: 70,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      elevation:
                          MaterialStateProperty.resolveWith((states) => 10),
                      backgroundColor: MaterialStateColor.resolveWith(
                          (states) => kPrimaryColor),
                    ),
                    onPressed: () {
                      if (formkeyAddressedit.currentState!.validate()) {
                        Provider.of<Logics>(context, listen: false)
                            .updateAddress(
                                Address(
                                    name: nameeditontroller.text,
                                    phoneNumber: phNumbereditcontoller.text,
                                    pinCode: pincodeeditcontroller.text,
                                    city: cityeditController.text,
                                    state: stateeditController.text,
                                    area: areaeditController.text,
                                    houseNo: houseNoeditController.text),
                                widget.addressEditData['id'])
                            .then((value) {
                          Navigator.of(context).pop();
                          areaeditController.clear();
                          houseNoeditController.clear();
                          cityeditController.clear();
                          pincodeeditcontroller.clear();
                          phNumbereditcontoller.clear();
                          nameeditontroller.clear();
                        });
                      }
                    },
                    child: const Text(
                      'Add Address',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
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

final formkeyAddressedit = GlobalKey<FormState>();
final TextEditingController nameeditontroller = TextEditingController();
final TextEditingController phNumbereditcontoller = TextEditingController();
final TextEditingController pincodeeditcontroller = TextEditingController();
final TextEditingController cityeditController = TextEditingController();
final TextEditingController stateeditController = TextEditingController();
final TextEditingController houseNoeditController = TextEditingController();
final TextEditingController areaeditController = TextEditingController();
