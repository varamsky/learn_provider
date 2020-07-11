import 'package:flutter/material.dart';
import 'package:learn_provider/providers/counter_provider.dart';
import 'package:learn_provider/providers/extra_provider.dart';
import 'package:learn_provider/screens/check_screen.dart';
import 'package:learn_provider/screens/extra_screen.dart';
import 'package:learn_provider/widgets/counterContainer.dart';
import 'package:provider/provider.dart';
import 'dart:math' as math;

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final counterProvider =
        Provider.of<CounterProvider>(context, listen: false);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text("Home")),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CounterContainer(),
              Container(
                width: 150.0,
                height: 150.0,
                color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
                    .withOpacity(1.0),
                child: Column(
                  children: <Widget>[
                    Consumer<CounterProvider>(
                      builder: (BuildContext context,
                          CounterProvider counterProvider, Widget child) {
                        return Text(
                            'widget in HomeScreen class counter = ${counterProvider.counter} multiplier = ${counterProvider.multiplier}');
                      },
                    ),
                    RaisedButton(
                      child: Text('50'),
                      onPressed: () => counterProvider.setCounter(50),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  RaisedButton(
                    child: Icon(Icons.add),
                    color:
                        Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
                            .withOpacity(1.0),
                    onPressed: () {
                      counterProvider.increment();
                      counterProvider.multiply();
                    },
                  ),
                  RaisedButton(
                    child: Icon(Icons.remove),
                    color:
                        Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
                            .withOpacity(1.0),
                    onPressed: () {
                      counterProvider.decrement();
                      counterProvider.divide();
                    },
                  ),
                  RaisedButton(
                    child: Icon(Icons.navigation),
                    color:
                        Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
                            .withOpacity(1.0),
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (BuildContext context) => CheckScreen(),
                        ),
                      );
                      /*Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (BuildContext context) =>
                              ChangeNotifierProvider<CounterProvider>(
                            create: (BuildContext context) => CounterProvider(),
                            child: CheckScreen(),
                          ),
                        ),
                      );*/
                    },
                  ),
                  RaisedButton(
                    child: Icon(Icons.navigate_next),
                    color:
                    Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
                        .withOpacity(1.0),
                    onPressed: () {
                      /*Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (BuildContext context) =>
                              ChangeNotifierProvider<ExtraProvider>(
                                create: (BuildContext context) => ExtraProvider(),
                                child: ExtraScreen(),
                              ),
                        ),
                      );*/
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (BuildContext context) => ExtraScreen(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
