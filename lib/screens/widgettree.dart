import 'package:flutter/material.dart';
import 'package:hash_ecommerce_user_sideapp/constants/authentication/auth.dart';
import 'package:hash_ecommerce_user_sideapp/screens/home/mainhome_screen.dart';
import 'package:hash_ecommerce_user_sideapp/screens/login_screen/login_screen.dart';


class Widgettree extends StatefulWidget {
  const Widgettree({super.key});

  @override
  State<Widgettree> createState() => _WidgettreeState();
}

class _WidgettreeState extends State<Widgettree> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Auth().authStateChanges,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ScreenMainPage();
        } else {
          return LoginScreen();
        }
      },
    );
  }
}
