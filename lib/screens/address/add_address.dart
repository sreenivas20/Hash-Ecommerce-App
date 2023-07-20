import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hash_ecommerce_user_sideapp/Infrastructure/model/address_model.dart';
import 'package:hash_ecommerce_user_sideapp/constants/constants.dart';
import 'package:hash_ecommerce_user_sideapp/constants/logics/logics.dart';
import 'package:hash_ecommerce_user_sideapp/constants/textfieldfuntions/textfieldfun.dart';
import 'package:hash_ecommerce_user_sideapp/screens/address/components/address_textfield.dart';
import 'package:provider/provider.dart';

class AddAddressScreen extends StatelessWidget {
  const AddAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        title: const Padding(
          padding: EdgeInsets.only(left: 8.0),
          child: Text(
            'Add Address',
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
        ),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios)),
      ),
      body: Form(
        key: formkeyAddress,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 10),
                child: AddressTextField(
                    height: 90.h,
                    width: 2300.w,
                    text: 'Name',
                    controller: nameontroller,
                    validator: addressValidator),
              ),
              kSizedBox20,
              AddressTextField(
                  height: 90.h,
                  width: 2300.w,
                  text: 'Phone Number',
                  controller: phNumbercontoller,
                  keyBoardType: TextInputType.number,
                  validator: addressValidator),
              kSizedBox20,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  AddressTextField(
                      height: 90.h,
                      width: 900.w,
                      text: 'Pincode',
                      controller: pincodecontroller,
                      keyBoardType: TextInputType.number,
                      validator: addressValidator),
                  AddressTextField(
                      height: 90.h,
                      width: 900.w,
                      text: 'City',
                      controller: cityController,
                      validator: addressValidator),
                ],
              ),
              kSizedBox20,
              AddressTextField(
                  height: 90.h,
                  width: 2300.w,
                  text: 'State',
                  controller: stateController,
                  validator: addressValidator),
              kSizedBox20,
              AddressTextField(
                  height: 90.h,
                  width: 2300.w,
                  text: 'House no: / building no:',
                  controller: houseNoController,
                  keyBoardType: TextInputType.number,
                  validator: addressValidator),
              kSizedBox20,
              AddressTextField(
                  height: 90.h,
                  width: 2300.w,
                  text: 'Area , street',
                  controller: areaController,
                  validator: addressValidator),
              const SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
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
                      if (formkeyAddress.currentState!.validate()) {
                        Provider.of<Logics>(context, listen: false)
                            .addAddressToDataBase(Address(
                                name: nameontroller.text,
                                phoneNumber: phNumbercontoller.text,
                                pinCode: pincodecontroller.text,
                                city: cityController.text,
                                state: stateController.text,
                                area: areaController.text,
                                houseNo: houseNoController.text))
                            .then((value) {
                          areaController.clear();
                          houseNoController.clear();
                          stateController.clear();
                          cityController.clear();
                          pincodecontroller.clear();
                          phNumbercontoller.clear();
                          nameontroller.clear();
                          Navigator.of(context).pop();
                        });
                        print('Clicked');
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
              )
            ],
          ),
        ),
      ),
    );
  }
}

final formkeyAddress = GlobalKey<FormState>();
final TextEditingController nameontroller = TextEditingController();
final TextEditingController phNumbercontoller = TextEditingController();
final TextEditingController pincodecontroller = TextEditingController();
final TextEditingController cityController = TextEditingController();
final TextEditingController stateController = TextEditingController();
final TextEditingController houseNoController = TextEditingController();
final TextEditingController areaController = TextEditingController();
