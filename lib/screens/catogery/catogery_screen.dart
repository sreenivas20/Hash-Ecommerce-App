import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hash_ecommerce_user_sideapp/constants/constants.dart';
import 'package:hash_ecommerce_user_sideapp/constants/logics/logics.dart';
import 'package:provider/provider.dart';

class CatogeryScreen extends StatelessWidget {
  const CatogeryScreen({super.key});

  get productData => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: DefaultTabController(
        length: 5, // Number of tabs
        child: Stack(
          children: [
            Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                leading: IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(Icons.arrow_back_ios),
                ),
                title: const Text('Category'),
                bottom: PreferredSize(
                  preferredSize: const Size(10, 50),
                  child: Container(
                    color: Colors.white,
                    child: const TabBar(
                      isScrollable: true,
                      tabs: [
                        // Define tabs here
                        CatogerySlideWidget(text: 'Casuals'),
                        CatogerySlideWidget(text: 'Formals'),
                        CatogerySlideWidget(),
                        CatogerySlideWidget(),
                        CatogerySlideWidget(),
                      ],
                    ),
                  ),
                ),
              ),
              body: const TabBarView(
                children: [
                  // kSizedBox40,
                  // Define the content for each tab here
                  CatogeryListlite(),
                  CatogerySlideWidget(text: 'Formals'),
                  CatogerySlideWidget(text: 'Sports'),
                  CatogerySlideWidget(text: 'Ethnic'),
                  CatogerySlideWidget(text: 'Party'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CatogeryListlite extends StatelessWidget {
  const CatogeryListlite({
    super.key,
    // required this.productData,
  });

  // final var productData;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: 6,
      padding: const EdgeInsets.only(top: 20),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 5,
        mainAxisSpacing: 10,
      ),
      itemBuilder: (context, index) {
        return Consumer<Logics>(
          builder: (context, provider, _) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              provider.getWishList();
            });
            return Column(
              children: [
                Expanded(
                  child: Stack(children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          image: const DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage('assets/images/S4.png'))),
                      width: 900.w,
                      height: 570.h,
                    ),
                  ]),
                ),
                Container(
                  width: 800.w,
                  height: 78.h,
                  // padding: EdgeInsets.all(40.r),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // kSizedBox5,
                              RichText(
                                overflow: TextOverflow.ellipsis,
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: 'Name ',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge!
                                          .copyWith(color: Colors.black),
                                    ),
                                  ],
                                ),
                              ),
                              Text(
                                '₹  price',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(color: Colors.black),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            );
          },
        );
      },
    );
  }
}

class CatogerySlideWidget extends StatelessWidget {
  const CatogerySlideWidget({
    super.key,
    this.text = 'Category', // Provide a default value for text
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 10,
      ),
      height: 50.h,
      width: 520.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: kPrimaryColor,
      ),
      child: Center(
        child: Text(
          text,
          style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
