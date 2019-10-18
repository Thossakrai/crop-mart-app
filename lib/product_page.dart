import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProductPage extends StatelessWidget {
  ProductPage({Key key, this.id, this.productName}) : super(key: key);
  String id;
  String productName;

  @override
  Widget build(BuildContext context) {
    print("recieve id = " + id);
    return Scaffold(
      appBar: AppBar(
        title: Text("${productName.toUpperCase()}"),
      ),
      body: StreamBuilder(
          stream:
              Firestore.instance.collection('records').document(id).snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return new Text("Loading");
            }
            var document = snapshot.data;
            return Container(
              child: Column(
                children: <Widget>[
                  Hero(
                    tag: 'product_picture' + id,
                    child: Image.asset('images/gettyimages-580833893.jpg'),
                  ),
                  Container(
                    padding: EdgeInsets.all(10.0),
                    child: Column(
                      children: <Widget>[
                        Text(document['productName']),
                        Text(Int.parse()),
                        Text("Qty")
                      ],
                    ),
                  )
                ],
              ),
            );
          }),
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
