import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hash_ecommerce_user_sideapp/constants/constants.dart';
import 'package:hash_ecommerce_user_sideapp/screens/product_details/components/addtocart_and_buybutton_widget.dart';
import 'package:hash_ecommerce_user_sideapp/screens/product_details/components/product_title_with_image.dart';
import 'package:hash_ecommerce_user_sideapp/screens/product_details/components/quantity_with_favbutton_widget.dart';

class ProductDetailsBody extends StatelessWidget {
  const ProductDetailsBody({super.key, required this.productData});
  final DocumentSnapshot productData;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: size.height,
            width: size.width,
            child: Stack(
              children: [
                Container(
                  margin: EdgeInsets.only(top: size.height * 0.3),
                  padding: EdgeInsets.only(
                    top: size.height * 0.12,
                    left: kDefaultPadding,
                    right: kDefaultPadding,
                  ),
                  height: 500,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24),
                    ),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.all(3.0),
                              child: Text(
                                'Size',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                            ),
                            const Row(
                              children: [
                                ////////////////////* Size Dots Widgets*////////////////////////////
                                SizeDot(size: 'S'),
                                SizeDot(size: 'M'),
                                SizeDot(size: 'L', isSelected: true),
                                SizeDot(size: 'XL'),
                                ////////////////////* Size Dots Widgets*////////////////////////////
                              ],
                            ),
                            ////////////////////* Description Widgets*////////////////////////////
                            Description(
                                description: productData['description']),
                            ////////////////////* Description Widgets*////////////////////////////

                            const SizedBox(
                              height: kDefaultPadding,
                            ),
                            ////////////////////////////////* Quantity and Fav Button Widget*////////////////////////////////
                            const QuantityWithfavbutton(),
                            ////////////////////////////////* Quantity and Fav Button Widget*////////////////////////////////*
                            const SizedBox(
                              height: kDefaultPadding,
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: kDefaultPadding),
                              ////////////////////* Cart and Buy Now button Widget*////////////////////////////
                              child: AddToCartAndBuyButton(),
                              ////////////////////* Cart and Buy Now button Widget*////////////////////////////
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                ////////////////*The Image And Price Widget*/////////////
                 ProductTitleImageWidget(productData: productData,)
              ],
            ),
          )
        ],
      ),
    );
  }
}

class Description extends StatelessWidget {
  const Description({
    super.key,
    required this.description,
  });
  final description;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kDefaultPadding),
      child: Text(
        description,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
      ),
    );
  }
}

class SizeDot extends StatelessWidget {
  const SizeDot({
    super.key,
    required this.size,
    this.isSelected = false,
  });
  final String size;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: kDefaultPadding / 4,
        right: kDefaultPadding / 2,
      ),
      height: 34,
      width: 34,
      decoration: BoxDecoration(
        color: isSelected
            ? const Color.fromARGB(255, 190, 221, 241)
            : Colors.transparent,
        shape: BoxShape.circle,
        border: Border.all(
          color: const Color.fromARGB(255, 65, 196, 235),
        ),
      ),
      child: Center(
          child: Text(
        size,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
      )),
    );
  }
}
