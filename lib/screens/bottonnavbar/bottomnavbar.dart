import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hash_ecommerce_user_sideapp/constants/constants.dart';

ValueNotifier<int> indexChangeNotifier = ValueNotifier(0);

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: indexChangeNotifier,
      builder: (context, int newIndex, _) {
        return Container(
          color: kPrimaryColor,
          child: FloatingNavbar(
              backgroundColor: kPrimaryColor,
              // padding: const EdgeInsets.all(10),
              elevation: 0,
              selectedBackgroundColor: Colors.white,
              unselectedItemColor: Colors.white,
              margin: const EdgeInsets.only(top: 0, right: 8, left: 8),
              items: [
                FloatingNavbarItem(
                  icon: Icons.home,
                ),
                FloatingNavbarItem(
                  icon: null, // Set icon to null

                  customWidget: HeartIcon(newIndex == 1), // Use a custom widget
                ),
                FloatingNavbarItem(
                  icon: Icons.person,
                ),
              ],
              currentIndex: newIndex,
              onTap: (index) {
                indexChangeNotifier.value = index;
              }),
        );
      },
    );
  }
}

class HeartIcon extends StatelessWidget {
  final bool isSelected;

  const HeartIcon(this.isSelected, {super.key});

  @override
  Widget build(BuildContext context) {
    return Icon(
      isSelected ? CupertinoIcons.heart_fill : CupertinoIcons.heart_fill,
      color: isSelected ? Colors.red : Colors.red,
    );
  }
}
