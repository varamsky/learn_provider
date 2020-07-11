import 'package:flutter/material.dart';

class CounterProvider extends ChangeNotifier{
  int counter = 0;
  double multiplier = 7;

  setCounter(int value){
    counter = value;

    notifyListeners();
  }

  increment(){
    counter++;

    notifyListeners();
  }

  decrement(){
    counter--;

    notifyListeners();
  }

  multiply(){
    multiplier = multiplier * 7;

    notifyListeners();
  }

  divide(){
    multiplier = multiplier / 7;

    notifyListeners();
  }
}