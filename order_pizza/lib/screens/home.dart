import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:order_pizza/screens/order.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Pizza ')),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(32),
          child: Column(
            children: [
              Image(
                image:NetworkImage('https://th.bing.com/th/id/OIP.rSVMUJcs_IS40pYN1h0maAHaEm?pid=ImgDet&rs=1'),
              ),
              RaisedButton(
                onPressed: ()=>Navigator.of(context).pushNamed('/Order'),
                child: Text('Order'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
