import 'package:flutter/material.dart';

// ExtraProvider implementation
class ExtraProvider extends ChangeNotifier{ // we can extend the ChangeNotifier class or else we can use with ChangeNotifier as a mixin.

  int extraCounter=-1;

  setExtraCounter(int value){
    extraCounter = value;

    notifyListeners();
  }

  increment(){
    extraCounter++;

    notifyListeners();
  }

  decrement(){
    extraCounter--;

    notifyListeners();
  }

}