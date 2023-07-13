import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Model {
  List<dynamic> wishlist;

  Model({required this.wishlist});

  Future<void> addWishlist() async {
    final refrence = FirebaseFirestore.instance.collection('user');
    final docreference = refrence.doc(FirebaseAuth.instance.currentUser!.email);

    final wishListadd = {
      'Wishlist': wishlist,
    };

    docreference.set(wishListadd);
  }
}
