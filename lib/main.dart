import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      appBar: new AppBar(
//        title: new Text("SIIE Workshop"),
//      ),
      body: new Container(
        decoration: new BoxDecoration(
          gradient: LinearGradient(
            begin : Alignment.topCenter,
            end : Alignment.bottomCenter,
            colors: [Color(0xff11998e),Color(0xff38ef7d)],
          ),
        ),
            child: ProductCard(),
      ),
//      drawer: Drawer(
//        child: ListView(
//          // Important: Remove any padding from the ListView.
//          padding: EdgeInsets.zero,
//          children: <Widget>[
//            DrawerHeader(
//              child: Text('Drawer Header'),
//              decoration: BoxDecoration(
//                color: Colors.blue,
//              ),
//            ),
//            ListTile(
//              title: Text('Item 1'),
//              onTap: () {
//                // Update the state of the app.
//                // ...
//              },
//            ),
//            ListTile(
//              title: Text('Item 2'),
//              onTap: () {
//                // Update the state of the app.
//                // ...
//              },
//            ),
//          ],
//        ),
//      ),
    );
  }
}

class ProductCard extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ProductCardState();
  }
}

class ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      onTap: () => print("tapped"),
      child: Container(
//        decoration: new BoxDecoration(
//            gradient: LinearGradient(
//                begin: Alignment.topCenter,
//                end: Alignment.bottomCenter,
//                colors: [Colors.blue, Colors.red])),
//        height: MediaQuery.of(context).size.height * 0.3,
//        width: MediaQuery.of(context).size.width * 0.4,
        child: Column(
          children: <Widget>[
            Image.asset('images/gettyimages-580833893.jpg'),
            Column(children: <Widget>[
              Text(
                'Product Name',
                style: TextStyle(fontSize: 20),
              ),
              Row(
                children: <Widget>[
                  Expanded(child: Text('Price')),
                  Expanded(child: Text('QTY'))
                ],
              )
            ]),
          ],
        ),
      ),
    );
  }

  void doNothing() {
    print("do nothing");
  }
}
