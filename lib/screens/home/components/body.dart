import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

import 'package:hash_ecommerce_user_sideapp/constants/constants.dart';
import 'package:hash_ecommerce_user_sideapp/constants/logics/logics.dart';
import 'package:hash_ecommerce_user_sideapp/screens/catogery/catogery_screen.dart';
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
                  'Category',
                  () {
                    Get.to(() => const CatogeryScreen(),
                        transition: Transition.circularReveal,
                        duration: const Duration(seconds: 2));
                  },
                ),
              ],
            ),
          ),

          ////////////////////////////////*Product List widgets*///////////////////////////////////////

          StreamBuilder(
            stream: Provider.of<Logics>(context).productDb.snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return StaggeredGridView.countBuilder(
                  physics: const NeverScrollableScrollPhysics(),
                  addAutomaticKeepAlives: true,
                  shrinkWrap: true,
                  crossAxisCount: 2,
                  mainAxisSpacing: 30,
                  // crossAxisSpacing: 30,
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    final DocumentSnapshot productData =
                        snapshot.data!.docs[index];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ProductWidgetList(
                        productData: productData,
                        image: 'assets/images/S4.png',
                        price: 243,
                        title: 'Merino Fleece Shirt',
                        press: () {
                          Get.to(
                              () => ProductListWidgetScreen(
                                  productdata: productData),
                              transition: Transition.fadeIn,
                              duration: const Duration(seconds: 1));
                        },
                      ),
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
