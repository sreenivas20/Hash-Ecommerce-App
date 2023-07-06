import 'package:flutter/material.dart';
import 'package:hash_ecommerce_user_sideapp/constants/constants.dart';
import 'package:hash_ecommerce_user_sideapp/constants/textfieldfuntions/textfieldfun.dart';

import 'package:hash_ecommerce_user_sideapp/screens/register/components/regtextfield.dart';

class ThreeRegTextField extends StatelessWidget {
  const ThreeRegTextField({
    super.key,
    required this.emailcontroller,
    required this.passcontroller,
    required this.namecontroller,
  });
  final TextEditingController namecontroller;

  final TextEditingController emailcontroller;
  final TextEditingController passcontroller;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RegTextField(
          validator: validatorname,
          controller: namecontroller,
          hintText: 'Name',
          icon: Icons.abc,
        ),
        kSizedBox20,
        RegTextField(
          validator: validatorEmail,
          controller: emailcontroller,
          hintText: 'Email',
          icon: Icons.person,
        ),
        kSizedBox20,
        RegTextField(
          validator: validatorpass,
          controller: passcontroller,
          hintText: 'Password',
          icon: Icons.password,
          obscureText: true,
        ),
      ],
    );
  }
}
