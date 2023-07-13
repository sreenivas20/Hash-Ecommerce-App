import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hash_ecommerce_user_sideapp/constants/constants.dart';
import 'package:hash_ecommerce_user_sideapp/constants/logics/pallettprovider.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:provider/provider.dart';

class WishListProductListWidget extends StatelessWidget {
  const WishListProductListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.only(left: 12.0, right: 12.0, top: 8, bottom: 8),
      child: FutureBuilder<PaletteGenerator>(
        future: Provider.of<PaletteProvider>(context).generatePalette(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done &&
              snapshot.hasData) {
            final PaletteGenerator paletteGenerator = snapshot.data!;
            final Color containerColor = paletteGenerator.dominantColor!.color;

            return Container(
              height: 160.h,
              width: 200.w,
              decoration: BoxDecoration(
                color: containerColor,
                borderRadius: BorderRadius.circular(50),
              ),
              child: Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 40),
                    height: 100.h,
                    width: 500.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('assets/images/S4.png'),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10.0, left: 20),
                    child: SizedBox(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          kSizedBox20,
                          Text(
                            'Merino Fleece Shirt',
                            style:
                                Theme.of(context).textTheme.bodyLarge?.copyWith(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                          ),
                          Text(
                            'Size: M',
                            style:
                                Theme.of(context).textTheme.bodyLarge?.copyWith(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                    ),
                          ),
                          Row(
                            children: [
                              Text(
                                '\$ 243',
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineSmall
                                    ?.copyWith(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.favorite,
                                  color: Colors.red,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          } else {
            return Container(); // You can show a placeholder or loading indicator while the palette is being generated
          }
        },
      ),
    );
  }
}
