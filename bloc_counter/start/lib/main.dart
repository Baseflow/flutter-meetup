import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: BaseflowSwatch.color,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}

class BaseflowSwatch {
  static Map<int, Color> colorMap = {
    50:Color.fromRGBO(240,56,35, .1),
    100:Color.fromRGBO(240,56,35, .2),
    200:Color.fromRGBO(240,56,35, .3),
    300:Color.fromRGBO(240,56,35, .4),
    400:Color.fromRGBO(240,56,35, .5),
    500:Color.fromRGBO(240,56,35, .6),
    600:Color.fromRGBO(240,56,35, .7),
    700:Color.fromRGBO(240,56,35, .8),
    800:Color.fromRGBO(240,56,35, .9),
    900:Color.fromRGBO(240,56,35, 1),
  };

  static MaterialColor get color => MaterialColor(0xFFF03823, colorMap);
}