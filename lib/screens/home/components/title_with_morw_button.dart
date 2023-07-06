import 'package:flutter/material.dart';
import 'package:hash_ecommerce_user_sideapp/constants/constants.dart';

buttonPreview(double height, double width, String text, Function() press) {
  final ButtonStyle flatButtonStyle = TextButton.styleFrom(
    minimumSize: Size(width, height),
    backgroundColor: kPrimaryColor,
    padding: const EdgeInsets.all(0),
  );
  return TextButton(
    style: flatButtonStyle,
    onPressed: press,
    child: Text(
      text,
      style: const TextStyle(color: Colors.white),
    ),
  );
}
