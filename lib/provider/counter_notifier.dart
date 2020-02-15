import 'package:flutter/cupertino.dart';

class CounterNotifier extends ChangeNotifier {
 int _counter = 0;

 void plus() {
   ++_counter;
   notifyListeners();

 }

 get counter => _counter;
}