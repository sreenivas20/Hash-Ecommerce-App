import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hash_ecommerce_user_sideapp/constants/logics/cart/cart_provider.dart';
import 'package:hash_ecommerce_user_sideapp/screens/cart/components/cart_body.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            )),
      ),
      body: Consumer<CartProvider>(
        builder: (context, value, child) => Padding(
          padding: const EdgeInsets.all(0.0),
          child: value.ids.isNotEmpty
              ? StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                  stream: FirebaseFirestore.instance
                      .collection('products')
                      .where('id', whereIn: value.ids)
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                          child: CupertinoActivityIndicator(
                        radius: 20,
                      ));
                    }
                    if (snapshot.hasError) {
                      return const Text('Somthing went wrong');
                    }
                    return CartBody(
                      snapshot: snapshot,
                    );
                  },
                )
              : const Center(
                  child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Cart is empty!',
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                )),
        ),
      ),
    );
  }
}
