import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hash_ecommerce_user_sideapp/constants/constants.dart';
import 'package:hash_ecommerce_user_sideapp/screens/dashboard/components/dasboard_menu_and_title.dart';
import 'package:hash_ecommerce_user_sideapp/screens/dashboard/components/title_with_photo_dasboard_widget.dart';
import 'package:hash_ecommerce_user_sideapp/screens/myorder/myorder_screen.dart';

class DashBoardBody extends StatelessWidget {
  const DashBoardBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const TitleWithPhotoWidget(),
          kSizedBox40,
          DasboardMenuTiles(
              title: 'My Order',
              press: () {
                Navigator.of(context).push(CupertinoPageRoute(
                  fullscreenDialog: true,
                  builder: (context) => const MyOrderScreen(),
                ));
              }),
          DasboardMenuTiles(title: 'My Account', press: () {}),
          DasboardMenuTiles(title: 'Privacy Policy', press: () {}),
          DasboardMenuTiles(title: 'Address', press: () {}),
          dashBoardLogoutButton(70.h, 2200.w, 'Logout', () {})
        ],
      ),
    );
  }

  dashBoardLogoutButton(
      double height, double width, String text, Function press) {
    final ButtonStyle flatButtonStyle = TextButton.styleFrom(
      minimumSize: Size(width, height),
      backgroundColor: kPrimaryColor,
      padding: const EdgeInsets.all(10),
    );
    return TextButton(
      style: flatButtonStyle,
      onPressed: () {},
      child: Text(
        text,
        style: const TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
      ),
    );
  }
}
