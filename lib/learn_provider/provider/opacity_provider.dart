import 'package:flutter/cupertino.dart';

class OpacityProvider with ChangeNotifier {
  double _val = 1.0;

  double get val => _val;

  void newValue(double newval) {
    _val = newval;
    notifyListeners();
  }
}
