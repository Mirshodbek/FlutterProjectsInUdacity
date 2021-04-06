import 'dart:async';

import 'package:project_one_flutter/model/counter_event.dart';

class PicturesBloc {
  int _counter = 0;

  final _counterStateController = StreamController<int>();
  StreamSink<int> get _inCounter => _counterStateController.sink;
  Stream<int> get counter => _counterStateController.stream;

  final _counterEventController = StreamController<CounterEvent>();
  Sink<CounterEvent> get counterEventSink => _counterEventController.sink;

  PicturesBloc() {
    _counterEventController.stream.listen(_mapEventToState);
  }

  void _mapEventToState(CounterEvent event) {
    if (event is IncrementEvent) {
      if (_counter <= 9) {
        _counter++;
      } else if (_counter >= 10) {
        _counter = 2;
      }
    } else {
      if (_counter >= 3) {
        _counter--;
      } else if (_counter <= 2) {
        _counter = 10;
      }
    }
    _inCounter.add(_counter);
  }

  void dispose() {
    _counterStateController.close();
    _counterEventController.close();
  }
}
