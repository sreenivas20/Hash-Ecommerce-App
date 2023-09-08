import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hash_ecommerce_user_sideapp/constants/logics/cart/cart_provider.dart';
import 'package:provider/provider.dart';

class OrderSummaryCardListWidget extends StatelessWidget {
  const OrderSummaryCardListWidget({
    super.key,
    required this.data,
  });
  final DocumentSnapshot data;

  @override
  Widget build(BuildContext context) {
    return BlurryContainer(
      elevation: 10,
      color: Colors.transparent,
      blur: 30,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              width: 500.w,
              height: 110.h,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      fit: BoxFit.cover, image: NetworkImage(data['images']))),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data['productName'],
                  style: const TextStyle(fontSize: 20),
                ),
                FutureBuilder(
                  future: Provider.of<CartProvider>(context)
                      .getCartDetails(data['id']),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Text('Default Size ${snapshot.error}');
                    }
                    if (snapshot.data != null) {
                      return Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'Size : ${snapshot.data}',
                          style: TextStyle(fontSize: 18),
                        ),
                      );
                    }
                    return const Text('Default Size');
                  },
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    " \$ ${data['price']}",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
