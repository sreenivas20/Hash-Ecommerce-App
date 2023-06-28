import 'package:flutter/material.dart';
import 'package:hash_ecommerce_user_sideapp/constants/constants.dart';
import 'package:hash_ecommerce_user_sideapp/screens/login_screen/components/textfields.dart';

class ThreeTextfield extends StatelessWidget {
  const ThreeTextfield({
    super.key,
   
    required this.emailcontroller,
    required this.passcontroller,
  });

  
  final TextEditingController emailcontroller;
  final TextEditingController passcontroller;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFeild(
          controller: emailcontroller,
          hintText: 'Email',
          icon: Icons.person,
        ),
        kSizedBox20,
        TextFeild(
          controller: passcontroller,
          hintText: 'Password',
          icon: Icons.password,
          obscureText: true,
        ),
      ],
    );
  }
}
