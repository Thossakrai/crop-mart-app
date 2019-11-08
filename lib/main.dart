import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'cart.dart';
import 'product_card.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'KMITL',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'KMITL'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  State<StatefulWidget> createState() {
    return MyHomePageState();
  }
}

class MyHomePageState extends State<MyHomePage> {
  final Color appColor = Colors.brown[200];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  int _currentIndex = 0;
  final List<Widget> _children = [
    HomePage(),
    CartPage(),
    PlaceholderWidget(Colors.green)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appColor,
        title: Text(
          "CROP MART",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.white,
        backgroundColor: appColor,
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("HOME")),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart), title: Text("CART")),
          BottomNavigationBarItem(
              icon: Icon(Icons.person), title: Text("PROFILE"))
        ],
      ),
    );
  }
}

class PlaceholderWidget extends StatelessWidget {
  final Color color;
  PlaceholderWidget(this.color);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
    );
  }
}

class HomePage extends StatelessWidget {
  Widget _buildCatList(String collection) {
    return Container(
      child: StreamBuilder<QuerySnapshot>(
        stream: Firestore.instance.collection(collection).snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) return new Text('Error: ${snapshot.error}');
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return Text('Loading...');
            default:
              return ListView(
                scrollDirection: Axis.horizontal,
                children:
                    snapshot.data.documents.map((DocumentSnapshot document) {
                  return ProductCard(
                    id: document.documentID,
                    productName: document['productName'],
                    qty: document['qty'],
                    price: document['price'],
                    imagePath: document['imageUrl'],
                    collection: collection,
                  );
                }).toList(),
              );
          }
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(color: Colors.grey),
      child: ListView(
        children: <Widget>[
          Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                    padding: EdgeInsets.only(left: 10, top: 20),
                    child: Text(
                      "Category 1",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    )),
                Container(
                  height: 220,
                  child: _buildCatList('crops'),
                )
              ]),
          Divider(),
          Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                    padding: EdgeInsets.only(left: 10, top: 20),
                    child: Text(
                      "Category 2",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    )),
                Container(
                  height: 220,
                  child: _buildCatList('fruits'),
                )
              ]),
        ],
      ),
    );
  }
}
