import 'package:flutter/material.dart';
import 'package:learn_provider/providers/counter_provider.dart';
import 'package:learn_provider/providers/extra_provider.dart';
import 'package:learn_provider/screens/home_screen.dart';
import 'package:provider/provider.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    /*return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter App',
      home: ChangeNotifierProvider<CounterProvider>(
        create: (BuildContext context) => CounterProvider(),
        child: HomeScreen(),
      ),
    );*/

/*
    return ChangeNotifierProvider<CounterProvider>(
      create: (BuildContext context) => CounterProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter App',
        home: HomeScreen(),
      ),
    );
*/

    return MultiProvider(
      providers: [
        ChangeNotifierProvider<CounterProvider>(
          create: (BuildContext context) => CounterProvider(),
        ),
        ChangeNotifierProvider<ExtraProvider>(
          create: (BuildContext context) => ExtraProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter App',
        home: HomeScreen(),
      ),
    );
  }
}
