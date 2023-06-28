import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TitleWithPhotoWidget extends StatelessWidget {
  const TitleWithPhotoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 100.0, left: 10),
          child: Text(
            'Hello,Sreenivas ',
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Colors.black,
                ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(right: 18, top: 20),
          height: 220.h,
          width: 950.w,
          decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(
                'assets/images/useravatar-removebg-preview.png',
              ),
            ),
          ),
        )
      ],
    );
  }
}
