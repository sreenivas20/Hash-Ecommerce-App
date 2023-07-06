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
        return SizedBox(
          height: 115.h,
          child: FloatingNavbar(
              backgroundColor: Colors.white,
              // padding: const EdgeInsets.all(10),
              elevation: 0,
              selectedBackgroundColor: kPrimaryColor,
              unselectedItemColor: kPrimaryColor,
              margin: const EdgeInsets.only(bottom: 0, top: 0),
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
