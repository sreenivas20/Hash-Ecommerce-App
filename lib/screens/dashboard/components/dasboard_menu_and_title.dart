import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DasboardMenuTiles extends StatelessWidget {
  const DasboardMenuTiles({
    super.key,
    required this.title,
    required this.press,
  });
  final String title;
  final Function() press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        margin: const EdgeInsets.all(12),
        height: 80.h,
        width: 2200.w,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 200, 200, 200),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 18.0, horizontal: 30),
          child: Text(
            title,
            style: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(fontWeight: FontWeight.bold, fontSize: 18),
          ),
        ),
      ),
    );
  }
}
