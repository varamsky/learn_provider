import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:learn_provider/providers/counter_provider.dart';
import 'package:provider/provider.dart';

class CounterContainer extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final counterProvider = Provider.of<CounterProvider>(context, listen: false);
    return Container(
      width: 150.0,
      height: 150.0,
      color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0),
      child: Column(
        children: <Widget>[
          Consumer<CounterProvider>(
            builder: (BuildContext context,CounterProvider counterProvider,Widget child){
              return Text('Separate widget class counter = ${counterProvider.counter} multiplier = ${counterProvider.multiplier}');
            },
          ),
          RaisedButton(
            child: Text('20'),
            onPressed: () => counterProvider.setCounter(20),
          ),
        ],
      ),
    );
  }
}


