import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hash_ecommerce_user_sideapp/constants/constants.dart';

class CartProductListWidget extends StatelessWidget {
  const CartProductListWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          margin: const EdgeInsets.only(left: 15),
          height: 180.h,
          width: 800.w,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(
                'assets/images/S4.png',
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 0.0, left: 30),
          child: SizedBox(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                kSizedBox20,
                Text(
                  'Shirt',
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge
                      ?.copyWith(fontWeight: FontWeight.bold, fontSize: 15),
                ),
                kSizedBox5,
                Text(
                  'Merino Fleece Shirt',
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge
                      ?.copyWith(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                kSizedBox5,
                Text(
                  'Size: M',
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge
                      ?.copyWith(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                kSizedBox10,
                Text(
                  '\$ 243',
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall
                      ?.copyWith(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                Row(
                  children: [
                    cartbuildOutlinedButton(icon: Icons.remove, press: () {}),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        '01',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    cartbuildOutlinedButton(icon: Icons.add, press: () {}),
                    IconButton(
                        onPressed: () {}, icon: Icon(Icons.delete_outline))
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  cartbuildOutlinedButton({IconData? icon, Function()? press}) {
    return SizedBox(
      width: 30,
      height: 26,
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
