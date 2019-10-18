import 'package:flutter/material.dart';

class ProductPage extends StatelessWidget {
  ProductPage({Key key, @required this.productid}) : super(key: key);
  final String productid;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Product Page"),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Hero(
              tag: 'product_picture' + this.productid,
              child: Image.asset('images/gettyimages-580833893.jpg'),
            ),
            Container(
              padding: EdgeInsets.all(10.0),
              child: Column(
                children: <Widget>[
                  Text("Product Name"),
                  Text("Price"),
                  Text("Description"),
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
