import 'package:flutter/material.dart';
import 'package:learn_provider/providers/extra_provider.dart';
import 'package:provider/provider.dart';
import 'dart:math' as math;

class ExtraScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final extraProvider = Provider.of<ExtraProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(title: Text('Check Screen'),),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Container(
            width: 150.0,
            height: 150.0,
            color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
                .withOpacity(1.0),
            child: Column(
              children: <Widget>[
                Consumer<ExtraProvider>(
                  builder: (BuildContext context,
                      ExtraProvider extraProvider, Widget child) {
                    return Text(
                        'widget in ExtraScreen class extraCounter = ${extraProvider.extraCounter}');
                  },
                ),
                RaisedButton(
                  child: Text('-900'),
                  onPressed: () => extraProvider.setExtraCounter(-900),
                ),
              ],
            ),
          ),
          RaisedButton(
            child: Icon(Icons.add),
            color:
            Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
                .withOpacity(1.0),
            onPressed: () {
              extraProvider.increment();
            },
          ),
          RaisedButton(
            child: Icon(Icons.remove),
            color:
            Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
                .withOpacity(1.0),
            onPressed: () {
              extraProvider.decrement();
            },
          ),
        ],
      ),
    );
  }
}
