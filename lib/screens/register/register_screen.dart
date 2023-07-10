import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hash_ecommerce_user_sideapp/constants/authentication/auth.dart';
import 'package:hash_ecommerce_user_sideapp/constants/constants.dart';
import 'package:hash_ecommerce_user_sideapp/screens/login_screen/login_screen.dart';
import 'package:hash_ecommerce_user_sideapp/screens/register/components/threeregtextfield.dart';
import 'package:hash_ecommerce_user_sideapp/screens/widgettree.dart';

// ignore: must_be_immutable
class RegisterScreen extends StatefulWidget {
  RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController namecontroller = TextEditingController();

  TextEditingController emailcontroller = TextEditingController();

  TextEditingController passcontroller = TextEditingController();

  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formkey,
        child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(
                'assets/images/loginscreenuserapp.png',
              ),
            ),
          ),
          child: ListView(
            children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 100.0),
                    child: Column(
                      children: [
                        Text(
                          'Register',
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall
                              ?.copyWith(
                                  color: const Color.fromARGB(255, 5, 5, 5)),
                        ),
                        kSizedBox20,
                        Container(
                          height: 200,
                          width: 200,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image:
                                  AssetImage('assets/images/registergif.png'),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 70.h,
                        ),
                        ThreeRegTextField(
                            namecontroller: namecontroller,
                            emailcontroller: emailcontroller,
                            passcontroller: passcontroller),
                      ],
                    ),
                  ),
                  RegLoginButton(
                      formkey: formkey,
                      email: emailcontroller.text,
                      name: namecontroller.text,
                      password: passcontroller.text),
                  kSizedBox20,
                  InkWell(
                    onTap: () => Navigator.of(context)
                        .pushReplacement(CupertinoPageRoute(
                      fullscreenDialog: true,
                      allowSnapshotting: true,
                      builder: (context) => LoginScreen(),
                    )),
                    child: Text(
                      'Already have account Login..!',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: const Color.fromARGB(255, 162, 213, 255)),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RegLoginButton extends StatelessWidget {
  const RegLoginButton({
    super.key,
    required this.email,
    required this.password,
    required this.name,
    required this.formkey,
  });
  final email;
  final password;
  final String name;
  final GlobalKey<FormState> formkey;
  @override
  Widget build(BuildContext context) {
    Future<void> createUserWithEmailAndPassword(BuildContext context) async {
      try {
        await Auth()
            .createUserWithEmailAndPassword(email: email, passsword: password);
        await FirebaseAuth.instance.currentUser!.updateDisplayName(name);
        await Auth().savecredential(name, email).then((value) =>
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => Widgettree())));
      } on FirebaseAuthException catch (e) {
        log(e.message.toString());
      }
    }

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
          log('clicked');

          if (formkey.currentState!.validate()) {
            formkey.currentState!.save();
            createUserWithEmailAndPassword(context);
          }
        },
        child: const Text(
          'Register',
        ),
      ),
    );
  }
}
