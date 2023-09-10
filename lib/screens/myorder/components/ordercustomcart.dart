import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hash_ecommerce_user_sideapp/constants/app_color.dart/app_color.dart';
import 'package:hash_ecommerce_user_sideapp/constants/constants.dart';
import 'package:hash_ecommerce_user_sideapp/constants/order/orderprovider.dart';
import 'package:hash_ecommerce_user_sideapp/screens/myorder/components/screentrackorder.dart';
import 'package:provider/provider.dart';

class OdersCustomCard extends StatelessWidget {
  const OdersCustomCard({
    super.key,
    required this.data,
    required this.index,
  });
  final QueryDocumentSnapshot<Map<String, dynamic>> data;
  final int index;
  @override
  Widget build(BuildContext context) {
    final orderProvider = Provider.of<OrdersProvider>(context);
    orderProvider.getOrderData(index);
    return SizedBox(
      height: 170.h,
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
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 350.h,
                width: 430.w,
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
                kSizedBox20,
                SizedBox(
                  width: 829.w,
                  child: Text(
                    data['productName'],
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
                    // overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ),
                const Spacer(),
                Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      width: 150.h,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                          foregroundColor: Colors.white,
                          fixedSize: Size(370.w, 5.h),
                          elevation: 2,
                        ),
                        onPressed: () {
                          dialogBuilder(context, data['id']);
                        },
                        child: const Text(
                          'Cancel',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 60.w,
                    ),
                    SizedBox(
                      width: 150.h,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppConstantsColor.materialThemeColor,
                          foregroundColor: Colors.white,
                          fixedSize: Size(270.w, 5.h),
                          elevation: 2,
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ScreenTrackOrder(
                                data: data,
                                index: index,
                              ),
                            ),
                          );
                        },
                        child: const Text(
                          'Track',
                          style: TextStyle(fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Future<void> dialogBuilder(BuildContext context, String id) {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        surfaceTintColor: Colors.transparent,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(2))),
        title: const Text('Cancel Order'),
        content: const Text(
          'Are you sure want to cancel.',
        ),
        actions: <Widget>[
          TextButton(
            style: TextButton.styleFrom(
              textStyle: Theme.of(context).textTheme.labelLarge,
            ),
            child: const Text('No'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            style: TextButton.styleFrom(
              textStyle: Theme.of(context).textTheme.labelLarge,
            ),
            child: const Text(
              'Yes',
              style: TextStyle(color: Colors.red),
            ),
            onPressed: () {
              Provider.of<OrdersProvider>(context, listen: false)
                  .cancelOrder(id);

              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
