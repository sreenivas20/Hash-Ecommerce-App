import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hash_ecommerce_user_sideapp/Infrastructure/model/wishlist_model.dart';

class Logics extends ChangeNotifier {
  final CollectionReference productDb =
      FirebaseFirestore.instance.collection('products');

  String errorMsg = '';
  List wishListList = [];
  void updateFirebase() {
    Model wishListobj = Model(wishlist: wishListList);
    wishListobj.addWishlist();
    notifyListeners();
  }
}
