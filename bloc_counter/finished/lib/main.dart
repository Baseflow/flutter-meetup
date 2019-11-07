import 'package:bloc_counter/src/bloc_provider.dart';
import 'package:flutter/material.dart';

import 'incrementor/bloc/incrementor_bloc.dart';
import 'incrementor/incrementor.dart';
import 'incrementor/widgets/incrementor_widget.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: BaseflowSwatch.color,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocProvider<IncrementorBloc>(
      bloc: IncrementorBloc(incrementor: Incrementor()),
      child: IncrementorWidget(),
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