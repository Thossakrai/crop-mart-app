import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProductPage extends StatelessWidget {
  ProductPage({Key key, this.id, this.productName, this.collection})
      : super(key: key);

  final String id;
  final String productName;
  final String collection;

  Widget _buildImage(String imageFromInternet) {
    if (imageFromInternet != null) {
      return Image.network(imageFromInternet, fit: BoxFit.contain);
    }
    return Image.asset('images/gettyimages-580833893.jpg', fit: BoxFit.contain);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${productName.toUpperCase()}"),
      ),
      body: StreamBuilder(
        stream:
            Firestore.instance.collection(collection).document(id).snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return new Text("Loading");
          }
          var document = snapshot.data;
          return Container(
              child: Column(children: <Widget>[
            Hero(
              tag: 'product_picture' + id,
              child: _buildImage(document['imageUrl']),
            ),
            Container(
              padding: EdgeInsets.all(10.0),
              child: Column(
                children: <Widget>[
                  // Hero(
                  //   tag: 'product_picture' + id,
                  //   child: _buildImage(document['imageUrl']),
                  // ),
                  Container(
                    padding: EdgeInsets.all(10.0),
                    child: Column(
                      children: <Widget>[
                        Text(document['productName']),
                        Text(document['price'].toString()),
                        Text(document['quantity'].toString())
                      ],
                    ),
                  )
                ],
              ),
            ),
          ]));
        },
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
