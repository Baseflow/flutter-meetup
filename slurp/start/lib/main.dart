import 'package:flutter/material.dart';
import 'package:slurp/places.dart';

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
      (place) => setState(() => _places.add(place))
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
          children: _places.map((place) => new Text(place.name)).toList(),
        ),
      ),
    );
  }
}
