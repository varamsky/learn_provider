import 'package:flutter/material.dart';

class ExtraProvider extends ChangeNotifier{

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