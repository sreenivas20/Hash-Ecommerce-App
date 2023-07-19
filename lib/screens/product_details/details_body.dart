import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hash_ecommerce_user_sideapp/constants/constants.dart';
import 'package:input_quantity/input_quantity.dart';

class ProductDetailsBody extends StatelessWidget {
  const ProductDetailsBody({super.key, required this.productData});
  final DocumentSnapshot productData;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          bottom: 10,
          child: Container(
            height: 100,
            color: Colors.red.withOpacity(0.2),
          ),
        ),
        ListView(
          children: [
            ProductimageandFavButton(productData: productData),
            Padding(
              padding: const EdgeInsets.only(top: 18.0, left: 18, right: 18),
              child: ProductNameAndPriceWidget(productData: productData),
            ),
            SizedBox(
              height: 90.h,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: productData['size'].length,
                itemBuilder: (context, index) {
                  return SizeButton(size: productData['size'][index]);
                },
              ),
            ),
            Center(
              child: Description(
                description: productData['description'],
              ),
            )
          ],
        ),
        Positioned(
          bottom: 15,
          left: 0,
          right: 0,
          child: Padding(
            padding: const EdgeInsets.only(left: 48.0, right: 48.0),
            child: SizedBox(
              height: 80.h,
              child: TextButton(
                style: ButtonStyle(
                    // maximumSize: MaterialStateProperty.all(Size(50, 10)),
                    elevation: MaterialStateProperty.all(15),
                    backgroundColor: MaterialStateColor.resolveWith(
                        (states) => Colors.black)),
                onPressed: () {},
                child: Row(
                  children: [
                    kwSizedBox40,
                    SvgPicture.asset(
                      "assets/icons/cart-svgrepo-com.svg",
                      height: 40,
                      width: 40,
                    ),
                    kwSizedBox20,
                    Text(
                      'ADD TO CART',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class SizeButton extends StatelessWidget {
  const SizeButton({
    super.key,
    required this.size,
    this.color,
  });
  final String size;
  final color;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 18, right: 8, left: 8, bottom: 18),
      height: 10,
      width: 60,
      decoration: BoxDecoration(
        color: color,
        border: Border.all(),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Center(
        child: Text(
          size,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
      ),
    );
  }
}

class ProductNameAndPriceWidget extends StatelessWidget {
  const ProductNameAndPriceWidget({
    super.key,
    required this.productData,
  });

  final DocumentSnapshot<Object?> productData;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${productData['category']} Shirts',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: kPrimaryColor,
                  fontSize: 20),
            ),
            Text(
              productData['productName'],
              style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: kPrimaryColor,
                  fontSize: 30),
            ),
          ],
        ),
        const Spacer(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 19.5),
              child: Text(
                'Price:-',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: kPrimaryColor,
                    ),
              ),
            ),
            Text(
              '₹ ${productData['price']}',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: kPrimaryColor,
                  ),
            ),
            InputQty(
              maxVal: 5,
              initVal: 1,
              steps: 1,
              minVal: 1,
              showMessageLimit: false,
              borderShape: BorderShapeBtn.circle,
              boxDecoration: const BoxDecoration(),
              minusBtn: const Icon(Icons.remove, size: 18),
              plusBtn: const Icon(
                Icons.add,
                size: 18,
              ),
              btnColor1: Colors.black,
              onQtyChanged: (val) {
                if (kDebugMode) {
                  print(val);
                }
              },
            ),
          ],
        )
      ],
    );
  }
}

class ProductimageandFavButton extends StatelessWidget {
  const ProductimageandFavButton({
    super.key,
    required this.productData,
  });

  final DocumentSnapshot<Object?> productData;

  @override
  Widget build(BuildContext context) {
    return Row(
      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      // crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          margin: const EdgeInsets.only(left: 10, top: 300),
          height: 40,
          width: 40,
          decoration: BoxDecoration(
              shape: BoxShape.circle, border: Border.all(color: Colors.red)),
          child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.favorite_outline,
                color: Colors.red,
              )),
        ),
        Container(
          height: 500.h,
          width: 1900.w,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                productData['images'],
              ),
            ),
          ),
        ),
      ],
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
        child: RichText(
          text: TextSpan(
            text: description,
            style: const TextStyle(
                fontWeight: FontWeight.bold, fontSize: 15, color: Colors.black),
          ),
        ));
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
