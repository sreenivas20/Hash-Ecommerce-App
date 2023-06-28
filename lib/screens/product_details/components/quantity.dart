import 'package:flutter/material.dart';
import 'package:hash_ecommerce_user_sideapp/constants/constants.dart';

class QuantityWidget extends StatefulWidget {
  const QuantityWidget({
    super.key,
  });

  @override
  State<QuantityWidget> createState() => _QuantityWidgetState();
}

class _QuantityWidgetState extends State<QuantityWidget> {
  int numberOfItems = 1;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        buildOutlinedButton(press: () {}, icon: Icons.remove),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding / 2),
          child: Text("01", style: Theme.of(context).textTheme.headlineSmall),
        ),
        buildOutlinedButton(press: () {}, icon: Icons.add),
      ],
    );
  }

  buildOutlinedButton({IconData? icon, Function()? press}) {
    return SizedBox(
      width: 40,
      height: 32,
      child: OutlinedButton(
        style: ButtonStyle(
          backgroundColor: const MaterialStatePropertyAll(
              Color.fromARGB(255, 167, 208, 240)),
          padding: const MaterialStatePropertyAll(EdgeInsets.zero),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0))),
        ),
        onPressed: press,
        child: Icon(
          icon,
          size: 20,
          weight: 50,
          color: Colors.white,
        ),
      ),
    );
  }
}
