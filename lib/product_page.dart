import 'package:flutter/material.dart';

class ProductPage extends StatelessWidget {
  ProductPage({Key key,  this.id, this.productName, this.photoUrl}) : super(key: key);
  String productName;
  String id;
  String photoUrl;

  @override
  Widget build(BuildContext context) {
    print("recieve id = " + id);
    return Scaffold(
      appBar: AppBar(
        title: Text("${productName.toUpperCase()}"),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Hero(
              tag: 'product_picture' + id,
              child: Image.network(photoUrl),
            ),
            Container(
              padding: EdgeInsets.all(10.0),
              child: Column(
                children: <Widget>[
                  Text("Product Name"),
                  Text("Price"),
                  Text("Qty")
                ],
              ),
            )
          ],
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        // TODO ProductPage: set onPressed Action
        onPressed: null,
        child: Icon(
          Icons.add,
          size: 30,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

}
