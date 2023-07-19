import 'package:carousel_images/carousel_images.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hash_ecommerce_user_sideapp/constants/constants.dart';
import 'package:hash_ecommerce_user_sideapp/screens/cart/cart.dart';
import 'package:hash_ecommerce_user_sideapp/screens/home/components/body.dart';
import 'package:hash_ecommerce_user_sideapp/screens/myorder/myorder_screen.dart';


class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final List<String> listImages = [
    'assets/images/PE_D_HB_cavalry.jpg',
    'assets/images/PE_D_HB_boardroom_formal.jpg',
    'assets/images/12072023-UHP-D-MAIN-P3-ivocDennislingo-starting499extraupto35.png',
    // 'assets/5.jpg',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: buildAppBar(context),
      backgroundColor: kPrimaryColor,
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            CustomSilverAppBar(),
            CustomPictersilverAppbar(
              listImages: listImages,
            )
          ];
        },
        body: Body(),
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: IconButton(
        onPressed: () {},
        icon: SvgPicture.asset(
          "assets/icons/menu-alt-05-svgrepo-com.svg",
        ),
        iconSize: 35,
      ),
      actions: [
        Row(
          children: [
            IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  CupertinoPageRoute(
                    builder: (context) => const CartScreen(),
                  ),
                );
              },
              icon: SvgPicture.asset(
                "assets/icons/cart-svgrepo-com.svg",
              ),
              iconSize: 35,
            ),
            IconButton(
              onPressed: () {
                Navigator.of(context).push(CupertinoPageRoute(
                    builder: (context) => const MyOrderScreen()));
              },
              icon: const Icon(
                CupertinoIcons.tag_fill,
                color: Colors.white,
              ),
            )
          ],
        ),
      ],
    );
  }
}

class CustomPictersilverAppbar extends StatelessWidget {
  const CustomPictersilverAppbar({
    super.key,
    this.listImages,
  });
  final listImages;
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      snap: false,
      pinned: false,
      floating: false,
      backgroundColor: kPrimaryColor.withOpacity(0.9),
      elevation: 0,
      expandedHeight: 200,
      flexibleSpace: FlexibleSpaceBar(
          title: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 35.0),
            child: Text(
              "MENS'S\n  BEST\nSELLER",
              style: TextStyle(
                  fontSize: 20, fontWeight: FontWeight.bold, wordSpacing: 2),
            ),
          ),
          background: CarouselImages(
            scaleFactor: 0.6,
            listImages: listImages ?? 'no image',
            height: 300.0,
            borderRadius: 30.0,
            cachedNetworkImage: true,
            verticalAlignment: Alignment.topCenter,
            onTap: (index) {
              print('Tapped on page $index');
            },
          )),
    );
  }
}

class CustomSilverAppBar extends StatelessWidget {
  const CustomSilverAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
        backgroundColor: Colors.black.withOpacity(0.5),
        elevation: 0,
        leading: IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(
            "assets/icons/menu-alt-05-svgrepo-com.svg",
          ),
          iconSize: 35,
        ),
        actions: [
          Row(
            children: [
              IconButton(
                onPressed: () {
                  Navigator.of(context).push(
                    CupertinoPageRoute(
                      builder: (context) => const CartScreen(),
                    ),
                  );
                },
                icon: SvgPicture.asset(
                  "assets/icons/cart-svgrepo-com.svg",
                ),
                iconSize: 35,
              ),
              IconButton(
                onPressed: () {
                  Navigator.of(context).push(CupertinoPageRoute(
                    builder: (context) => const MyOrderScreen(),
                  ));
                },
                icon: const Icon(
                  CupertinoIcons.tag_fill,
                  color: Colors.white,
                ),
              )
            ],
          )
        ]);
  }
}
