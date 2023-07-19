import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hash_ecommerce_user_sideapp/Infrastructure/model/wishlist_model.dart';

class Logics extends ChangeNotifier {
  User? currentUser = FirebaseAuth.instance.currentUser;

  final documentSnapshot = FirebaseFirestore.instance
      .collection('users')
      .doc(FirebaseAuth.instance.currentUser!.email)
      .get();
  final CollectionReference productDb =
      FirebaseFirestore.instance.collection('products');

  List showWishlist = [];
  String errorMsg = '';
  List wishListList = [];
  List<dynamic> wishlist = [];
  void updateFirebase() {
    Model wishListobj = Model(wishlist: wishListList);
    wishListobj.addWishlist();
    notifyListeners();
  }

  Future<void> getWishList() async {
    FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.email)
        .get()
        .then((snapshot) {
      if (snapshot.exists) {
        final userData = snapshot.data()!;
        if (userData.containsKey('Wishlist')) {
          final dataList = List.from(userData['Wishlist']);
          wishListList = List<String>.from(dataList);
          log(wishListList.toString());
        } else {
          log('Wishlist field does not exist in the document');
        }
      } else {
        log('Document does not exist');
      }
    }).catchError((error) {
      log("Failed to read document due to $error");
    });
    notifyListeners();
  }

  Future<void> deleteWishList(docId) async {
    try {
      final deletewishlist = FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.email);
      await deletewishlist.update({
        'Wishlist': FieldValue.arrayRemove([docId]),
      });
    } catch (e) {
      log(e.toString());
    }
    notifyListeners();
  }
}
