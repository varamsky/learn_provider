import 'package:flutter/material.dart';

// CounterProvider implementation
class CounterProvider extends ChangeNotifier{ // we can extend the ChangeNotifier class or else we can use with ChangeNotifier as a mixin.
  int counter = 0; // initializing counter value to 0.
  double multiplier = 7; // initializing multiplier value to 7.

  setCounter(int value){
    counter = value;

    notifyListeners(); // it notifies all the listeners about the changes in the Provider.
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