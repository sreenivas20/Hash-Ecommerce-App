import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hash_ecommerce_user_sideapp/constants/authentication/auth.dart';


class TextFeild extends StatelessWidget {
  const TextFeild(
      {super.key,
      required this.controller,
      required this.hintText,
      required this.icon,
      this.obscureText = false,
      required this.validator});
  final controller;
  final hintText;
  final IconData icon;
  final bool obscureText;
  final String? Function(String?) validator;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 2000.w,
      height: 70.h,
      child: TextFormField(
        obscureText: obscureText,
        validator: validator,
        controller: controller,
        cursorColor: const Color.fromARGB(255, 134, 188, 228),
        decoration: InputDecoration(
          prefixIcon: Icon(icon),
          hintText: hintText,
          filled: true,
          fillColor: const Color.fromARGB(255, 183, 232, 239).withOpacity(0.4),
          border: const OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(
              Radius.circular(50),
            ),
          ),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class LoginButton extends StatefulWidget {
  LoginButton({
    super.key,
    required this.email,
    required this.password,
    required this.formkey,
  });
  final email;
  final password;
  final GlobalKey<FormState> formkey;

  @override
  State<LoginButton> createState() => _LoginButtonState();
}

class _LoginButtonState extends State<LoginButton> {
  Future<void> signInWithEmailAndPassword(BuildContext context) async {
    try {
      await Auth().signInWithEmailAndPassword(
          email: widget.email, passsword: widget.password);
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMsg = e.message!;
      });
      log(" hibh${e.message.toString()}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 36, left: 36, top: 30),
      decoration:
          BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(30.r))),
      width: 1000.h,
      height: 60.h,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromARGB(255, 156, 192, 243),
          foregroundColor: Colors.white,
        ),
        onPressed: () {
          if (widget.formkey.currentState!.validate()) {
            widget.formkey.currentState!.save();
            signInWithEmailAndPassword(context);
           }
        },
        child: const Text(
          'Login',
        ),
      ),
    );
  }
}

String errorMsg = '';
