import 'package:bloc_counter/incrementor/bloc/incrementor_bloc.dart';
import 'package:bloc_counter/src/bloc_provider.dart';
import 'package:flutter/material.dart';

class IncrementorWidget extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    var bloc = BlocProvider.of<IncrementorBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Incrementor'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            StreamBuilder<int>(
              stream: bloc.outCounter,
              initialData: 0,
              builder: (context, snapshot) => Text(
                '${snapshot.data}',
                style: Theme.of(context).textTheme.display1,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => bloc.incrementCounter.add(null),
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
