import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:hash_ecommerce_user_sideapp/constants/constants.dart';
import 'package:hash_ecommerce_user_sideapp/constants/logics/logics.dart';
import 'package:hash_ecommerce_user_sideapp/screens/catogery/catogery_screen.dart';
import 'package:hash_ecommerce_user_sideapp/screens/home/components/header_with_searchbox.dart';
import 'package:hash_ecommerce_user_sideapp/screens/home/components/productlist_widget.dart';
import 'package:hash_ecommerce_user_sideapp/screens/home/components/title_with_morw_button.dart';
import 'package:provider/provider.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_tile.dart';

import '../../product_details/product_details_screen.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_grid_view.dart';

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
                buttonPreview(
                  30,
                  70,
                  'Catogery',
                  () {
                    Navigator.of(context).push(
                      CupertinoPageRoute(
                        builder: (context) => CatogeryScreen(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          ////////////////////////////////*Product List widgets*///////////////////////////////////////
          // StreamBuilder(
          //   stream: Provider.of<Logics>(context).productDb.snapshots(),
          //   builder: (context, snapshot) {
          //     if (snapshot.hasData) {
          //       return GridView.builder(
          //         physics: const NeverScrollableScrollPhysics(),
          //         shrinkWrap: true,
          //         itemCount: snapshot.data!.docs.length,
          //         gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          //           crossAxisCount: 2,
          //           mainAxisSpacing: 20,
          //         ),
          //         itemBuilder: (context, index) {
          //           final DocumentSnapshot productData =
          //               snapshot.data!.docs[index];
          //           return ProductWidgetList(
          //               productData: productData,
          //               image: 'assets/images/S4.png',
          //               price: 243,
          //               title: 'Merino Fleece Shirt',
          //               press: () {
          //                 Navigator.of(context).push(
          //                   MaterialPageRoute(
          //                     builder: (context) =>
          //                         const ProductListWidgetScreen(),
          //                   ),
          //                 );
          //               });
          //         },
          //       );
          //     }
          //     return const Center(
          //       child: CircularProgressIndicator(),
          //     );
          //   },
          // ),
          StreamBuilder(
            stream: Provider.of<Logics>(context).productDb.snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return StaggeredGridView.countBuilder(
                  physics: const NeverScrollableScrollPhysics(),
                  addAutomaticKeepAlives: true,
                  shrinkWrap: true,
                  crossAxisCount: 2,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 0,
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    final DocumentSnapshot productData =
                        snapshot.data!.docs[index];
                    return ProductWidgetList(
                      productData: productData,
                      image: 'assets/images/S4.png',
                      price: 243,
                      title: 'Merino Fleece Shirt',
                      press: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) =>
                                  ProductListWidgetScreen(productdata: productData),
                          ),
                        );
                      },
                    );
                  },
                  staggeredTileBuilder: (index) => const StaggeredTile.fit(1),
                );
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
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
