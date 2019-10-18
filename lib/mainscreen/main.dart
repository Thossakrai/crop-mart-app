import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../cart.dart';
import 'main_firebase.dart';
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
      appBar: new AppBar(
        backgroundColor: appColor,
        title: new Text(
          "CROP MART",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: HomePage(),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.white,
        backgroundColor: appColor,
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
              icon: new Icon(Icons.home), title: new Text("HOME")),
          BottomNavigationBarItem(
              icon: new Icon(Icons.shopping_cart), title: new Text("CART")),
          BottomNavigationBarItem(
              icon: Icon(Icons.person), title: new Text("PROFILE"))
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
//  Widget _buildBody(BuildContext context) {
//    return StreamBuilder<QuerySnapshot>(
//      stream: Firestore.instance.collection('crops').snapshots(),
//      builder: (context, snapshot) {
//        if (!snapshot.hasData) return LinearProgressIndicator();
//        return _buildList(context, snapshot.data.documents);
//      },
//    );
//  }
//
//  Widget _buildList(BuildContext context, List<DocumentSnapshot> snapshot) {
//    return ListView(
//      padding: const EdgeInsets.only(top: 20.0),
//      children: snapshot.map((data) => _buildListItem(context, data)).toList(),
//    );
//  }
//
//  Widget _buildListItem(BuildContext context, DocumentSnapshot data) {
//    final record = Record.fromSnapshot(data);
//    return ProductCard(record.productName, record.qty, record.price);
////    return Padding(
////      key: ValueKey(record.productName),
////      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
////      child: Container(
////        decoration: BoxDecoration(
////          border: Border.all(color: Colors.grey),
////          borderRadius: BorderRadius.circular(5.0),
////        ),
//////        child: ListTile(
//////          title: Text(record.productName),
//////          trailing: Text(record.qty.toString()),
////////          onTap: () =>
////////              record.reference.updateData({'votes': FieldValue.increment(1)}),
//////        ),
////      child: ProductCard(record.productName, record.qty, record.price),
////      ),
////    );
//  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      width: MediaQuery.of(context).size.width,
      decoration: new BoxDecoration(color: Colors.grey),
      child: new ListView(
        children: <Widget>[
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: <
              Widget>[
            Container(
                padding: EdgeInsets.only(left: 10, top: 20),
                child: Text(
                  "Category 1",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                )),
            Container(
              height: 220,
              child: StreamBuilder(
                  stream: Firestore.instance.collection('corps').snapshots(),
                  builder: (context, snapshot) {
                    return ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) =>
                          ProductCard(context, snapshot.data.documents[index]),
                    );
                  }),
            )
          ]),
          Divider(),
//          Column(
//              crossAxisAlignment: CrossAxisAlignment.start,
//              children: <Widget>[
//                Container(
//                    padding: EdgeInsets.only(left: 10, top: 20),
//                    child: Text(
//                      "Category 1",
//                      style: TextStyle(fontSize: 20, color: Colors.white),
//                    )),
//                Container(
//                  height: 220,
//                  child: ListView(
//                    shrinkWrap: true,
//                    scrollDirection: Axis.horizontal,
////                    children: <Widget>[ProductCard('1'), ProductCard('2')],
//                    children: <Widget>[_buildBody(context)],
//                  ),
//                )
//              ])
        ],
      ),
    );
  }
}
