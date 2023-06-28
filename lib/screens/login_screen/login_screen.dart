import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hash_ecommerce_user_sideapp/constants/constants.dart';
import 'package:hash_ecommerce_user_sideapp/screens/home/mainhome_screen.dart';
import 'package:hash_ecommerce_user_sideapp/screens/login_screen/components/threetextfields.dart';
import 'package:hash_ecommerce_user_sideapp/screens/register/register_screen.dart';

// ignore: must_be_immutable
class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  TextEditingController namecontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
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
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 150.0),
              child: Column(
                children: [
                  Text(
                    'Login',
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall
                        ?.copyWith(color: const Color.fromARGB(255, 5, 5, 5)),
                  ),
                  kSizedBox20,
                  Container(
                    height: 200,
                    width: 200,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/registergif.png'),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 100.h,
                  ),
                  ThreeTextfield(
                      emailcontroller: emailcontroller,
                      passcontroller: passcontroller),
                ],
              ),
            ),
            LoginButton(),
            kSizedBox20,
            Text(
              'Forgot Password?...',
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(color: const Color.fromARGB(255, 162, 213, 255)),
            ),
            kSizedBox20,
            InkWell(
              onTap: () => Navigator.of(context).push(CupertinoPageRoute(
                fullscreenDialog: true,
                builder: (context) => RegisterScreen(),
              )),
              child: Text(
                'Register!',
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(color: const Color.fromARGB(255, 162, 213, 255)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LoginButton extends StatelessWidget {
  const LoginButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 36, left: 36, top: 30),
      decoration:
          BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(30.r))),
      width: 1000.h,
      height: 60.h,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Color.fromARGB(255, 156, 192, 243),
          foregroundColor: Colors.white,
        ),
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => ScreenMainPage(),
          ));
        },
        child: Text(
          'Login',
        ),
      ),
    );
  }
}
