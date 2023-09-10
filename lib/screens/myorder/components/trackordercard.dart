import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hash_ecommerce_user_sideapp/constants/constants.dart';
import 'package:hash_ecommerce_user_sideapp/screens/widgets/price_widget.dart';

class TrackOrderCard extends StatelessWidget {
  const TrackOrderCard({
    super.key,
    this.data,
    required this.orderData,
  });
  final QueryDocumentSnapshot<Map<String, dynamic>>? data;
  final Map<String, dynamic>? orderData;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250.h,
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
                  height: 350.h,
                  width: 880.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(data!['images']),
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
                    width: 740.w,
                    child: Text(
                      data!['productName'] ?? '',
                      style: const TextStyle(
                          fontWeight: FontWeight.w600, fontSize: 20),
                      // overflow: TextOverflow.ellipsis,
                      // maxLines: 2,
                    ),
                  ),
                  kSizedBox10,
                  Text(
                    '${orderData!.isNotEmpty ? orderData!['count'] : 1} Item',
                    style: const TextStyle(
                        fontWeight: FontWeight.w600, fontSize: 18),
                  ),
                  Row(
                    children: [
                      const Text(
                        'Size: ',
                        style: TextStyle(fontSize: 17),
                      ),
                      orderData!['size'] != null
                          ? Text(orderData!['size'] ?? '')
                          : const SizedBox(),
                    ],
                  ),
                  // constSizedBox20,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      PriceWidget(
                        fontSize: 25,
                        price: data!['price'] ?? '',
                      ),
                      SizedBox(
                        width: 60.w,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
