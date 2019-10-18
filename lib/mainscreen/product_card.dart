import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../product_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class ProductCard extends StatefulWidget {
  ProductCard({Key key, this.id, this.productName, this.qty, this.price})
      : super(key: key);
  String productName;
  String id;
  int qty;
  int price;

  String getUrl(String id) {
    String url;
    switch (id) {
      case 'apple':
        url =
            'https://firebasestorage.googleapis.com/v0/b/seworkshop-895a0.appspot.com/o/apple.jpg?alt=media&token=f44f3226-1a8e-48d2-8181-d37dbdbaec61';
        break;
      case 'broccoli':
        url =
            'https://firebasestorage.googleapis.com/v0/b/seworkshop-895a0.appspot.com/o/broccoli.jpg?alt=media&token=ab808733-417c-45ac-9958-5182c02b756d';
        break;
      case 'corn':
        url =
            'https://firebasestorage.googleapis.com/v0/b/seworkshop-895a0.appspot.com/o/corn.jpg?alt=media&token=85b6fd04-2477-497c-86cb-998999efee22';
        break;
      case 'strawberry':
        url =
            'https://firebasestorage.googleapis.com/v0/b/seworkshop-895a0.appspot.com/o/strawberry.jpg?alt=media&token=16a57160-50c0-4d3a-abb4-9d1ef4d12f05';
        break;
      case 'tomato':
        url =
            'https://firebasestorage.googleapis.com/v0/b/seworkshop-895a0.appspot.com/o/tomato.jpg?alt=media&token=4aee1705-471f-4033-95c6-90f9eff25635';
        break;
      default:
        url = '';
        break;
    }
    return url;
  }

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
                    photoUrl: widget.getUrl(widget.id),
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
                // TODO add image
                child: Image.network(widget.getUrl(widget.id)),
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
