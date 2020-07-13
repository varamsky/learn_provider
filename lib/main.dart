import 'package:flutter/material.dart';
import 'package:learn_provider/providers/counter_provider.dart';
import 'package:learn_provider/providers/extra_provider.dart';
import 'package:learn_provider/screens/home_screen.dart';
import 'package:provider/provider.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    // This doesn't work for the ExtraProvider, because Provider doesn't work across Navigation. Therefore, to make it work wrap it above the MaterialApp.
    /*return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Learn Provider',
      home: ChangeNotifierProvider<CounterProvider>(
        create: (BuildContext context) => CounterProvider(),
        child: HomeScreen(),
      ),
    );*/


    // This is commented out because there are 2 providers so, MultiProvider should be used.
    /*return ChangeNotifierProvider<CounterProvider>(
      create: (BuildContext context) => CounterProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Learn Provider',
        home: HomeScreen(),
      ),
    );*/

    // This works fine. MultiProvider for both the providers and wrapping it above MaterialApp makes it accessible across Navigation.push() .
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
        title: 'Learn Provider',
        home: HomeScreen(),
      ),
    );
  }
}
