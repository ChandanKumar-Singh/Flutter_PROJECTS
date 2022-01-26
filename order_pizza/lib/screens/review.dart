import 'package:flutter/material.dart';
import 'package:order_pizza/code/pizza.dart';

class Review extends StatelessWidget {

  late Pizza _pizzaOrder;
  List<String> _list = new List.empty(growable: true);

  Review({order: null}) {
    _pizzaOrder = order;
    _list.add('Size: ${_pizzaOrder.size}');
    _list.add('');
    _list.add('Toppings:');

    _pizzaOrder.toppings.forEach((String name, bool value) {
      if (value) _list.add(name);
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text('Review Pizza Order'),
      ),
      body: new Container(
        padding: EdgeInsets.all(32),
        child: Column(
          children: [
            Text(
              "Review",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
            Expanded(
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: _list.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Text(_list.elementAt(index));
                    }))
          ],
        ),
      ),
    );
  }
}
