import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../product_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProductCard extends StatefulWidget {
  ProductCard(BuildContext context, DocumentSnapshot document);
  DocumentSnapshot document;
//  final String productName;
//  final int qty;
//  final int price;

  @override
  State<StatefulWidget> createState() {
    return ProductCardState();
  }
}

class ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    return new Center(
      child: new GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ProductPage(
                    productid: widget.document['productName'],
                  )));
        },
        child: Container(
          height: 200,
          width: 200,
          padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 10.0),
          margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
          decoration: new BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: new Column(
            children: <Widget>[
              Hero(
                tag: 'product_picture' + widget.document['productName'],
                child: Image.asset('images/gettyimages-580833893.jpg'),
              ),
              Column(children: <Widget>[
                Text(
                  widget.document['productName'],
                  style: TextStyle(fontSize: 20),
                ),
                Row(
                  children: <Widget>[
                    Expanded(child: Text(widget.document['qty'].toString())),
                    Expanded(child: Text(widget.document['price'].toString()))
                  ],
                )
              ]),
            ],
          ),
        ),
      ),
    );
  }

  void doNothing() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ProductPage(
              productid: '1',
            )));
  }
}
