import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slurp/bar_cubit.dart';
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
      home: BlocProvider<BarCubit>(
          create: (_) => BarCubit()..load(),
          child: MyHomePage(title: 'Slurp App')),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: BlocBuilder<BarCubit, List<Bar>>(
        builder: (context, state) {
          return ListView.builder(
              itemCount: state.length,
              itemBuilder: (context, index) {
                return BarTile(state[index]);
              });
        },
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
        trailing: Icon(
          _bar.isFavorite ? Icons.favorite : Icons.favorite_border,
          color: _bar.isFavorite ? Colors.red : null,
        ),
        onTap: () => context.read<BarCubit>().toggleFavorite(_bar),
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
