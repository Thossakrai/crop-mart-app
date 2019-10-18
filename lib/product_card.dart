import 'package:flutter/material.dart';
import './product_page.dart';

class ProductCard extends StatefulWidget {
  ProductCard({
    Key key,
    this.id,
    this.productName,
    this.qty,
    this.price,
    this.imagePath,
    this.collection,
  }) : super(key: key);

  final String productName;
  final String id;
  final int qty;
  final int price;
  final String imagePath;
  final String collection;

  @override
  State<StatefulWidget> createState() {
    return ProductCardState();
  }
}

class ProductCardState extends State<ProductCard> {
  Widget _buildImage(String imageFromInternet) {
    if (imageFromInternet != null) {
      return Image.network(imageFromInternet, fit: BoxFit.contain);
    }
    return Image.asset('images/gettyimages-580833893.jpg', fit: BoxFit.contain);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          // print("widget id = ${widget.id}");
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ProductPage(
                        id: widget.id,
                        productName: widget.productName,
                        collection: widget.collection,
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
                child: _buildImage(widget.imagePath),
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
}
