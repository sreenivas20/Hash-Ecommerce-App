import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hash_ecommerce_user_sideapp/constants/order/orderprovider.dart';
import 'package:hash_ecommerce_user_sideapp/screens/myorder/components/orderCustomCart.dart';
import 'package:hash_ecommerce_user_sideapp/screens/myorder/components/ordercompletedscreen.dart';
import 'package:provider/provider.dart';

class ScreenOrders extends StatefulWidget {
  const ScreenOrders({super.key});

  @override
  State<ScreenOrders> createState() => _ScreenOrdersState();
}

class _ScreenOrdersState extends State<ScreenOrders> {
  @override
  void initState() {
    Provider.of<OrdersProvider>(context, listen: false).getOrderIds();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final orderHistoryProvider = Provider.of<OrdersProvider>(
      context,
    );
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text(
          'My Orders',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const OrderCompletedScreen(),
                  ));
            },
            icon: const Icon(Icons.history),
          )
        ],
      ),
      body: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20).r,
          child: orderHistoryProvider.myFields.isNotEmpty
              ? Consumer<OrdersProvider>(
                  builder: (context, value, child) => StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection('products')
                        .where('id', whereIn: orderHistoryProvider.myFields)
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return const Text('An error occurred');
                      }

                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                            child: CupertinoActivityIndicator(
                          radius: 40,
                        ));
                      }

                      if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                        return const Text('No data found');
                      }

                      return ListView.separated(
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index) => OdersCustomCard(
                          data: snapshot.data!.docs[index],
                          index: index,
                        ),
                        separatorBuilder: (context, index) =>
                            const SizedBox(height: 10),
                        itemCount: snapshot.data!.docs.length,
                      );
                    },
                  ),
                )
              : const Center(
                  child: Text(
                  'No Item Found',
                  style: TextStyle(fontSize: 20),
                ))),
    );
  }
}
