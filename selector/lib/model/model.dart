import 'package:flutter/material.dart';

class Model extends ChangeNotifier {
  String name = "ahmed";
  String friend = "mohamed";
  int counter2 = 0;

  void changeName() {
    name = "ali";
    notifyListeners();
  }

  void changeFriend() {
    friend = "ahmed";
    notifyListeners();
  }

  void incrementCounter2() {
    counter2++;
    notifyListeners();
  }
}
