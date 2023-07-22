import 'package:flutter/material.dart';

class AddressTextField extends StatelessWidget {
  const AddressTextField({
    super.key,
    this.height,
    this.width,
    required this.text,
    required this.controller,
    this.keyBoardType,
    required this.validator,
  });
  final String? Function(String?) validator;
  final double? height;
  final  double? width;
  final keyBoardType;
  final TextEditingController controller;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(),
              borderRadius: BorderRadius.circular(20)),
          child: Center(
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              keyboardType: keyBoardType,
              validator: validator,
              controller: controller,
              style: const TextStyle(color: Colors.black),
              cursorColor: Colors.black,
              decoration: const InputDecoration(
                hintText: 'Tap to add',
                disabledBorder: InputBorder.none,
                border: InputBorder.none,
              ),
            ),
          )),
        ),
      ],
    );
  }
}
