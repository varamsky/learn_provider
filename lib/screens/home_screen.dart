import 'package:flutter/material.dart';
import 'package:learn_provider/providers/counter_provider.dart';
import 'package:learn_provider/screens/check_screen.dart';
import 'package:learn_provider/screens/extra_screen.dart';
import 'package:learn_provider/widgets/counterContainer.dart';
import 'package:provider/provider.dart';
import 'dart:math' as math;

class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    // reference to CounterProvider
    final counterProvider = Provider.of<CounterProvider>(context, listen: false);

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
                color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0), // generating a random color.
                child: Column(
                  children: <Widget>[

                    // Consumer allows the wrapped widget to listen for any changes in the CounterProvider
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
                  Tooltip(
                    message: 'increase counter and multiplier',
                    child: RaisedButton(
                      child: Icon(Icons.add),
                      color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0),
                      onPressed: () {
                        counterProvider.increment();
                        counterProvider.multiply();
                      },
                    ),
                  ),
                  Tooltip(
                    message: 'decrease counter and multiplier',
                    child: RaisedButton(
                      child: Icon(Icons.remove),
                      color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0),
                      onPressed: () {
                        counterProvider.decrement();
                        counterProvider.divide();
                      },
                    ),
                  ),
                  Tooltip(
                    message: 'Move to CheckScreen',
                    child: RaisedButton(
                      child: Icon(Icons.navigation),
                      color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0),
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (BuildContext context) => CheckScreen(),
                          ),
                        );

                        // no need to wrap CheckScreen Navigation in Provider as the Providers are already wrapped above MaterialApp.
                        // Moreover, wrapping Provider with Navigation doesn't work.
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
                  ),
                  Tooltip(
                    message: 'Move to ExtraScreen',
                    child: RaisedButton(
                      child: Icon(Icons.navigate_next),
                      color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0),
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (BuildContext context) => ExtraScreen(),
                          ),
                        );

                        // no need to wrap ExtraScreen Navigation in Provider as the Providers are already wrapped above MaterialApp.
                        // Moreover, wrapping Provider with Navigation doesn't work.
                        /*Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (BuildContext context) =>
                                ChangeNotifierProvider<ExtraProvider>(
                                  create: (BuildContext context) => ExtraProvider(),
                                  child: ExtraScreen(),
                                ),
                          ),
                        );*/
                      },
                    ),
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
