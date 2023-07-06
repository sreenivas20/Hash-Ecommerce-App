import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Logics extends ChangeNotifier {
  final CollectionReference productDb =
      FirebaseFirestore.instance.collection('products');
}
