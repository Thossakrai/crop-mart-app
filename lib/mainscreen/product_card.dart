import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../product_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProductCard extends StatefulWidget {
  ProductCard({Key key, this.id, this.productName, this.qty, this.price})
      : super(key: key);
  String productName;
  String id;
  int qty;
  int price;

//  final int price;

  @override
  State<StatefulWidget> createState() {
    return ProductCardState();
  }
}

class ProductCardState extends State<ProductCard> {
//  print(wid)

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          print("widget id = ${widget.id}");
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ProductPage(
                        id: widget.id,
                        productName: widget.productName,
                      )));
        },
        child: Container(
          height: 200,
          width: 200,
          padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 10.0),
          margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            children: <Widget>[
              Hero(
                tag: 'product_picture' + widget.id,
                child: Image.asset('images/gettyimages-580833893.jpg'),
              ),
              Column(children: <Widget>[
                Text(
                  widget.productName,
                  style: TextStyle(fontSize: 20),
                ),
                Row(
                  children: <Widget>[
                    Expanded(child: Text('${widget.qty.toString()} Pcs. left')),
                    Expanded(child: Text('${widget.price.toString()} Baht'))
                  ],
                )
              ]),
            ],
          ),
        ),
      ),
    );
  }

//  void doNothing() {
//    Navigator.push(
//        context,
//        MaterialPageRoute(
//            builder: (context) => ProductPage(
//                  productName: '1',
//                )));

}
