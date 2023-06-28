import 'package:flutter/material.dart';
import 'package:hash_ecommerce_user_sideapp/constants/constants.dart';

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
          controller: namecontroller,
          hintText: 'Name',
          icon: Icons.abc,
        ),
        kSizedBox20,
        RegTextField(
          controller: emailcontroller,
          hintText: 'Email',
          icon: Icons.person,
        ),
        kSizedBox20,
        RegTextField(
          controller: passcontroller,
          hintText: 'Password',
          icon: Icons.password,
          obscureText: true,
        ),
      ],
    );
  }
}
