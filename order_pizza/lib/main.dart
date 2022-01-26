import 'package:flutter/material.dart';
import 'package:order_pizza/screens/home.dart';
import 'package:order_pizza/screens/order.dart';
import 'package:order_pizza/screens/review.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        title: 'Order Item',
        theme: ThemeData(primarySwatch: Colors.yellow),
      routes: <String,WidgetBuilder>{
          '/Home': (BuildContext context )=> new Home(),
          '/Order': (BuildContext context )=> new Order(),
          '/Review': (BuildContext context )=> new Review(),
      },
      home: new Home(),
    );
  }
}
