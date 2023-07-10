import 'package:flutter/material.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';

class BottomSheetcontinueButton extends StatelessWidget {
  const BottomSheetcontinueButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 12, 154, 219),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 28.0, vertical: 10),
        child: Row(children: [
          const Column(
            children: [
              Text(
                'Total Amount :',
                style: TextStyle(fontSize: 20),
              ),
              Text(
                '₹ 455',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              )
            ],
          ),
          const Spacer(),
          AnimatedButton(
            animationDuration: const Duration(seconds: 1),
            onPress: () {},
            animatedOn: AnimatedOn.onTap,
            height: 70,
            width: 200,
            text: 'Continue',
            isReverse: true,
            selectedTextColor: Colors.black,
            borderRadius: 20,
            transitionType: TransitionType.RIGHT_CENTER_ROUNDER,
            // textStyle: submitTextStyle,
            backgroundColor: const Color.fromARGB(255, 122, 183, 233),
            borderColor: Colors.white,
            borderWidth: 1,
          ),
        ]),
      ),
    );
  }
}
