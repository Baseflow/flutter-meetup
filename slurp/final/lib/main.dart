import 'package:flutter/material.dart';
import 'package:slurp/places_repository.dart';

import 'place.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Slurp App',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: MyHomePage(title: 'Slurp App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Place> _places = <Place>[];

  @override
  void initState() {
    super.initState();
    listenForPlaces();
  }

  listenForPlaces() {
    PlacesRepository.getPlaces("Enschede")
        .listen((Place place) => setState(() => _places.add(place)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView(
        children: _places.map((place) => PlaceTile(place)).toList(),
      ),
    );
  }
}

class PlaceTile extends StatelessWidget {
  const PlaceTile(this._place, {Key? key}) : super(key: key);

  final Place _place;

  Color getColor(double rating) {
    return Color.lerp(Colors.red, Colors.green, rating / 5) ?? Colors.grey;
  }

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(_place.name),
      child: ListTile(
        leading: CircleAvatar(
          child: Text(_place.rating.toString()),
          backgroundColor: getColor(_place.rating),
        ),
        title: Text(_place.name),
        subtitle: Text(_place.address),
      ),
      background: Container(color: Colors.green),
      secondaryBackground: Container(color: Colors.red),
      onDismissed: (direction) {
        String message = direction == DismissDirection.endToStart
            ? 'Warm beer'
            : 'Excellent cold beer';
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(message)));
      },
    );
  }
}
