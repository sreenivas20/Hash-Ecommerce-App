import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hash_ecommerce_user_sideapp/Infrastructure/model/address_model.dart';
import 'package:hash_ecommerce_user_sideapp/Infrastructure/model/wishlist_model.dart';

class Logics extends ChangeNotifier {
  User? currentUser = FirebaseAuth.instance.currentUser;
  String selectedAddressId = '';

  // final documentSnapshot = FirebaseFirestore.instance
  //     .collection('users')
  //     .doc(FirebaseAuth.instance.currentUser!.email)
  //     .get();
  final CollectionReference productDb =
      FirebaseFirestore.instance.collection('products');
  // final User? currentUser = FirebaseAuth.instance.currentUser!.email;

  final CollectionReference addressDb = FirebaseFirestore.instance
      .collection('users')
      .doc(FirebaseAuth.instance.currentUser!.email)
      .collection('Address');

  Stream<QuerySnapshot<Map<String, dynamic>>> getSelectedAddressStream() {
    final ref = FirebaseFirestore.instance.collection('users');
    final userDocRef = ref.doc(FirebaseAuth.instance.currentUser!.email);
    final addressCollectionRef = userDocRef.collection('Address');

    return addressCollectionRef.where('Bool', isEqualTo: true).snapshots();
  }

  dynamic selectedAddress;
  dynamic currentAddress;
  List showWishlist = [];
  String errorMsg = '';
  List wishListList = [];
  List<dynamic> wishlist = [];
  bool onTap = false;

  void updateFirebase() {
    Model wishListobj = Model(wishlist: wishListList);
    wishListobj.addWishlist();
    notifyListeners();
  }

  void addressseleted(
    index,
  ) {
    selectedAddress = index;

    notifyListeners();
  }

  Future<void> updateCurrentAddress(String selectedAddress) async {
    // selectedAddressId = selectedAddress;
    final ref = FirebaseFirestore.instance.collection('users');
    final userDocRef = ref.doc(FirebaseAuth.instance.currentUser!.email);
    final addressCollectionRef = userDocRef.collection('Address');

    final batch = FirebaseFirestore.instance.batch();

    final querySnapshot = await addressCollectionRef.get();

    for (final addressDoc in querySnapshot.docs) {
      final docRef = addressDoc.reference;
      final addressId = addressDoc.id;
      final bool isSelected = (addressId == selectedAddress);

      batch.update(docRef, {'Bool': isSelected});
      notifyListeners();
    }

    await batch.commit();
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
          // log(wishListList.toString());
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

  Future<void> addAddressToDataBase(Address address) async {
    try {
      final ref = FirebaseFirestore.instance.collection('users');
      final docRefcollection = ref
          .doc(FirebaseAuth.instance.currentUser!.email)
          .collection('Address')
          .doc();
      final id = docRefcollection.id;

      await docRefcollection.set({
        'id': id,
        'Name': address.name,
        'PhoneNumber': address.phoneNumber,
        'pincode': address.pinCode,
        'city': address.city,
        'state': address.state,
        'House no': address.houseNo,
        'Area': address.area,
        'Bool': false,
      });
    } catch (e) {
      log(e.toString());
    }
  }

  Future<void> updateAddress(Address updatedAddress, docId) async {
    try {
      final ref = FirebaseFirestore.instance.collection('users');
      final docrefCollection = ref
          .doc(FirebaseAuth.instance.currentUser!.email)
          .collection('Address')
          .doc(docId);

      await docrefCollection.update({
        'Name': updatedAddress.name,
        'PhoneNumber': updatedAddress.phoneNumber,
        'pincode': updatedAddress.pinCode,
        'city': updatedAddress.city,
        'state': updatedAddress.state,
        'House no': updatedAddress.houseNo,
        'Area': updatedAddress.area,
      });
    } catch (e) {
      log(e.toString());
    }
  }

  Future<void> deleteAddress(docId) async {
    try {
      final ref = FirebaseFirestore.instance.collection('users');
      final docrefCollection = ref
          .doc(FirebaseAuth.instance.currentUser!.email)
          .collection('Address')
          .doc(docId);
      await docrefCollection.delete();
    } catch (e) {
      log(e.toString());
    }
  }
}
