import 'package:flutter/material.dart';

import 'places.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Slurp',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(title: 'Slurp'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  List<Place> _places = <Place>[];

  @override
  void initState() {
    super.initState();

    listenForPlaces();
  }

  void listenForPlaces() async {
    var stream = await getPlaces();

    stream.listen(
      (place) => 
        setState(
          () => _places.add(place)
        )
      );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new Center(
        child: new ListView(
          children: _places.map((place) => new PlaceWidget(place)).toList(),
        ),
      ),
    );
  }
}

class PlaceWidget extends StatelessWidget {
  final Place place;

  PlaceWidget(this.place);
  
  @override
  Widget build(BuildContext context) {
    var ratingColor = Color.lerp(Colors.red, Colors.green, place.rating / 5);

    var listTile = new ListTile(
      leading: new CircleAvatar(
        child: new Text(place.rating.toString()),
        backgroundColor: ratingColor,
      ),
      title: new Text(place.name),
      subtitle: new Text(place.address),
    );

    return new Dismissible(
      key: new Key(place.name),
      background: new Container(color: Colors.green),
      secondaryBackground: new Container(color: Colors.red),
      onDismissed: (dir) {
        if(dir == DismissDirection.startToEnd) {
          print("You liked ${place.name}");
        } else {
          print("You didn't like ${place.name}");
        }
      },
      child: listTile,
    );
  }
}
