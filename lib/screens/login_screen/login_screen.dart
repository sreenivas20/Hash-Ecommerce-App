import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hash_ecommerce_user_sideapp/constants/authentication/auth.dart';
import 'package:hash_ecommerce_user_sideapp/constants/constants.dart';
import 'package:hash_ecommerce_user_sideapp/screens/login_screen/components/forgetpassword.dart';
import 'package:hash_ecommerce_user_sideapp/screens/login_screen/components/textfields.dart';
import 'package:hash_ecommerce_user_sideapp/screens/login_screen/components/threetextfields.dart';
import 'package:hash_ecommerce_user_sideapp/screens/register/register_screen.dart';
import 'package:hash_ecommerce_user_sideapp/screens/widgettree.dart';

// ignore: must_be_immutable
class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailcontroller = TextEditingController();

  TextEditingController passcontroller = TextEditingController();

  bool login = false;

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
                    padding: const EdgeInsets.only(top: 40.0),
                    child: Column(
                      children: [
                        Text(
                          'Login',
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
                          height: 100.h,
                        ),
                        ThreeTextfield(
                            emailcontroller: emailcontroller,
                            passcontroller: passcontroller),
                        kSizedBox10,
                        Text(
                          errorMsg,
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.red,
                          ),
                        )
                      ],
                    ),
                  ),
                  LoginButton(
                      formkey: formkey,
                      email: emailcontroller.text,
                      password: passcontroller.text),
                  kSizedBox20,
                  GestureDetector(
                    onTap: () {
                      log('clicked');
                      signinWithGoogle();
                    },
                    child: Container(
                      height: 62.h,
                      width: 1900.w,
                      decoration: BoxDecoration(
                          // color: kPrimaryColor,
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all()),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 8,
                                bottom: 8,
                                left: 8,
                              ),
                              child: SvgPicture.asset(
                                'assets/icons/icons8-google.svg',
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(right: 20.0),
                              child: Text(
                                'Continue with Google signup..',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                            )
                          ]),
                    ),
                  ),
                  kSizedBox20,
                  GestureDetector(
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ForgetpasswordScreen(),
                    )),
                    child: Text(
                      'Forgot Password?...',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: const Color.fromARGB(255, 162, 213, 255)),
                    ),
                  ),
                  kSizedBox20,
                  InkWell(
                    onTap: () => Navigator.of(context)
                        .pushReplacement(CupertinoPageRoute(
                      fullscreenDialog: true,
                      builder: (context) => RegisterScreen(),
                    )),
                    child: Text(
                      'Register!',
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

  Future<void> signinWithGoogle() async {
    try {
      await Auth().signinwithGoogle().then(
          (value) => Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => Widgettree(),
              )));
    } catch (e) {
      log(e.toString());
    }
  }
}
