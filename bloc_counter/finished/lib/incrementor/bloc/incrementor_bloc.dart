import 'dart:async';

import 'package:bloc_counter/incrementor/incrementor.dart';
import 'package:bloc_counter/src/bloc.dart';
import 'package:flutter/material.dart';

class IncrementorBloc implements Bloc {
  final Incrementor _incrementorUseCase;

  // Stream to handle output
  final StreamController<int> _counterController = StreamController<int>();
  StreamSink<int> get _inAdd => _counterController.sink;
  Stream<int> get outCounter => _counterController.stream;

  // Stream to handle incoming actions
  final StreamController _actionController = StreamController();
  StreamSink get incrementCounter => _actionController.sink;

  IncrementorBloc({@required Incrementor incrementor})
    : assert(incrementor != null),
      _incrementorUseCase = incrementor
  {
    _actionController.stream.listen(_handleAction);     
  }

  void _handleAction(data) {
    var newValue = _incrementorUseCase.updateCounter();
    _inAdd.add(newValue);
  }

  void dispose() {
    _actionController?.close();
    _counterController?.close();
  }
}