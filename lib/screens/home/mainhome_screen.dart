import 'package:flutter/material.dart';
import 'package:hash_ecommerce_user_sideapp/screens/bottonnavbar/bottomnavbar.dart';
import 'package:hash_ecommerce_user_sideapp/screens/dashboard/dashboard.dart';
import 'package:hash_ecommerce_user_sideapp/screens/home/components/home_screen.dart';
import 'package:hash_ecommerce_user_sideapp/screens/wishlist/wishlist_screen.dart';

class ScreenMainPage extends StatelessWidget {
  ScreenMainPage({super.key});

  final _pages = [HomeScreen(), WishListScreen(), DashBoardScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ValueListenableBuilder(
            valueListenable: indexChangeNotifier,
            builder: (context, int index, _) {
              return _pages[index];
            }),
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}
