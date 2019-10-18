import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Record {
  final String productName;
  final int qty;
  final int price;
  final DocumentReference reference;

  Record.fromMap(Map<String, dynamic> map, {this.reference})
      : assert(map['productName'] != null),
        assert(map['qty'] != null),
        assert(map['price'] != null),
        productName = map['productName'],
        qty = map['qty'],
        price = map['price'];

  Record.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data, reference: snapshot.reference);

  @override
  String toString() => "Record<$productName:$qty>";
}