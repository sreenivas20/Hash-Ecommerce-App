import 'package:flutter/material.dart';

import 'package:hash_ecommerce_user_sideapp/constants/constants.dart';
import 'package:hash_ecommerce_user_sideapp/screens/home/components/header_with_searchbox.dart';
import 'package:hash_ecommerce_user_sideapp/screens/home/components/productlist_widget.dart';
import 'package:hash_ecommerce_user_sideapp/screens/home/components/title_with_morw_button.dart';

import '../../product_details/product_details_screen.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const HeaderWithSearchBox(),
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: kDefaultPadding, vertical: kDefaultPadding),
            child: Row(
              children: <Widget>[
                const TitleWithCustomUnderline(text: 'Shirts '),
                const Spacer(),
                buttonPreview(30, 60, 'more', () {}),
              ],
            ),
          ),
          ////////////////////////////////*Product List widgets*///////////////////////////////////////
          GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 10,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 20,
            ),
            itemBuilder: (context, index) {
              return ProductWidgetList(
                  image: 'assets/images/S4.png',
                  price: 243,
                  title: 'Merino Fleece Shirt',
                  press: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const ProductListWidgetScreen(),
                      ),
                    );
                  });
            },
          ),
        ],
      ),
    );
  }
}

class TitleWithCustomUnderline extends StatelessWidget {
  const TitleWithCustomUnderline({
    super.key,
    required this.text,
  });
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 24,
      child: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 1),
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              margin: const EdgeInsets.only(right: 2),
              height: 2,
              color: kPrimaryColor.withOpacity(0.2),
            ),
          )
        ],
      ),
    );
  }
}