import 'package:flutter/material.dart';

class CounterNotifier extends ChangeNotifier {
  int _counter = 0;

  void add() {
    _counter == 0 ? _counter = 1 : ++_counter;
    notifyListeners();
  }


  int get counter => _counter ?? -1;
}