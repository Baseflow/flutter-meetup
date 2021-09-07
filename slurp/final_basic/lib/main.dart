import 'package:flutter/material.dart';
import 'package:slurp/bar_repository.dart';

import 'bar.dart';

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
  List<Bar> _bars = <Bar>[];

  @override
  void initState() {
    super.initState();
    listenForPlaces();
  }

  listenForPlaces() {
    BarRepository.getPlaces()
        .listen((Bar bar) => setState(() => _bars.add(bar)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView(
        children: _bars.map((bar) => BarTile(bar)).toList(),
      ),
    );
  }
}

class BarTile extends StatelessWidget {
  const BarTile(this._bar, {Key? key}) : super(key: key);

  final Bar _bar;

  Color getColor(double rating) {
    return Color.lerp(Colors.red, Colors.green, rating / 5) ?? Colors.grey;
  }

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(_bar.name),
      child: ListTile(
        leading: CircleAvatar(
          child: Text(_bar.rating.toString()),
          backgroundColor: getColor(_bar.rating),
        ),
        title: Text(_bar.name),
        subtitle: Text(_bar.address),
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
