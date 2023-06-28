import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TitleWithSearchBoxMyOrder extends StatelessWidget {
  const TitleWithSearchBoxMyOrder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.all(18.0),
          child: Text(
            'My Order',
            style: Theme.of(context)
                .textTheme
                .titleLarge
                ?.copyWith(fontWeight: FontWeight.bold, fontSize: 26),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(right: 10),
          height: 80.h,
          width: 1400.w,
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.black,
            ),
            borderRadius: BorderRadius.circular(40),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: TextFormField(
                cursorColor: Colors.black,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Search',
                  prefixIcon: Icon(
                    CupertinoIcons.search,
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
