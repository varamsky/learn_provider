import 'package:flutter/material.dart';
import 'package:learn_provider/providers/counter_provider.dart';
import 'package:provider/provider.dart';
import 'dart:math' as math;

class CheckScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    // reference to CounterProvider
    final counterProvider = Provider.of<CounterProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(title: Text('Check Screen'),),
      body: Container(
        width: 150.0,
        height: 150.0,
        color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0),
        child: Column(
          children: <Widget>[

            // Consumer allows the wrapped widget to listen for any changes in the CounterProvider
            Consumer<CounterProvider>(
              builder: (BuildContext context,
                  CounterProvider counterProvider, Widget child) {
                return Text(
                    'widget in CheckScreen class counter = ${counterProvider.counter} multiplier = ${counterProvider.multiplier}');
              },
            ),
            RaisedButton(
              child: Text('700'),
              onPressed: () => counterProvider.setCounter(700),
            ),
          ],
        ),
      ),
    );
  }
}
