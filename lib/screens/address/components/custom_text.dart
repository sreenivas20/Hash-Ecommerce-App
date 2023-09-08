import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomText extends StatelessWidget {
  const CustomText({
    super.key,
    required this.title,
    required this.subTitle,
  });
  final String title;
  final String subTitle;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "$title:",
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
        ),
        const SizedBox(
          width: 4,
        ),
        Text(
          subTitle,
          style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: Colors.blueGrey),
        )
      ],
    );
  }
}
