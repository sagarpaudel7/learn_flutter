import 'package:flutter/cupertino.dart';

class CounterProvider with ChangeNotifier {
  int _count = 10;
  int get count => _count;

  void newCount() {
    _count++;
    notifyListeners();
  }
}
