import 'package:flutter/material.dart';



class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Yes Home Screen',
          style: TextStyle(),
        ),
      ),
      body: Center(
        child: MaterialButton(onPressed: () {}),
      ),
    );
  }
}
