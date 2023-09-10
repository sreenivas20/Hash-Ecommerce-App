import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hash_ecommerce_user_sideapp/constants/constants.dart';
import 'package:hash_ecommerce_user_sideapp/constants/order/orderprovider.dart';
import 'package:hash_ecommerce_user_sideapp/screens/product_details/product_details_screen.dart';
import 'package:provider/provider.dart';

class OrderCompleteCard extends StatelessWidget {
  const OrderCompleteCard({super.key, required this.orderData});
  final QueryDocumentSnapshot<Map<String, dynamic>> orderData;

  @override
  Widget build(BuildContext context) {
    late DocumentSnapshot<Object?> data;
    return StreamBuilder<DocumentSnapshot>(
      stream: Provider.of<OrdersProvider>(context, listen: false)
          .getProductData(orderData['cartList']),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CupertinoActivityIndicator());
        } else if (snapshot.hasError) {
          return const Center(child: Text('Error loading data'));
        } else {
          data = snapshot.data!;

          return GestureDetector(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      ProductListWidgetScreen(productdata: snapshot.data!),
                )),
            child: SizedBox(
              height: 200.h,
              child: Card(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  side: BorderSide(
                    width: .5,
                    color: Colors.black,
                  ),
                ),
                surfaceTintColor: Colors.transparent,
                elevation: 5,
                child: Padding(
                  padding: const EdgeInsets.all(20.0).r,
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 250.h,
                          width: 830.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(data['images']),
                            ),
                          ),
                        ),
                      ),
                      // const Spacer(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          kSizedBox10,
                          SizedBox(
                            width: 629.w,
                            child: Text(
                              data['productName'],
                              style: const TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 20),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                            ),
                          ),
                          const Spacer(),
                          const Text(
                            'Delivered',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: Colors.green),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        }
      },
    );
  }
}
