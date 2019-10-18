import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          CartItem(),CartItem(),
        ],
      ),
    );
  }
}

class CartItem extends StatefulWidget {
  @override
  _CartItemState createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  final String productName = "Cornstarch";
  int _quantity = 1;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 10, left: 10, top: 10),
      child: Container(
          padding: EdgeInsets.all(10),
          height: MediaQuery.of(context).size.height * 0.15,
          decoration: BoxDecoration(color: Colors.lightGreenAccent),
          child: Row(
            children: <Widget>[
              CircleAvatar(
                radius: MediaQuery.of(context).size.height * 0.045,
                backgroundImage: AssetImage('images/gettyimages-580833893.jpg'),
              ),
              Expanded(
                  child: new Container(
                padding: EdgeInsets.only(left: 10),
                child: Text(productName, style: TextStyle(fontSize: 18)),
              )),
              Container(
                  child: Row(
                children: <Widget>[
                  Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                        color: Colors.brown,
                        borderRadius: BorderRadius.circular(50)),
                    child: IconButton(
                      icon: Icon(Icons.remove),
                      iconSize: 15,
                      color: Colors.red,
                      onPressed: () {
                        setState(() {
                          _quantity--;
                        });
                      },
                    ),
                  ),
                  Text(_quantity.toString() + " pcs"),
                  Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                        color: Colors.brown,
                        borderRadius: BorderRadius.circular(50)),
                    child: IconButton(
                      icon: Icon(Icons.add),
                      iconSize: 15,
                      color: Colors.red,
                      onPressed: () {
                        setState(() {
                          _quantity++;
                        });
                      },
                    ),
                  ),
                ],
              )),
            ],
          )),
    );
  }
}