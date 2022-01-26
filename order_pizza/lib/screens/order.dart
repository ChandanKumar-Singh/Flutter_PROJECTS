import 'dart:core';
import 'package:flutter/material.dart';
import 'package:order_pizza/screens/review.dart';
import 'package:order_pizza/code/pizza.dart';

class Order extends StatefulWidget {
  @override
  _State createState() => new _State();
}

class _State extends State<Order> {
  Pizza _pizzaOrder = new Pizza();

  void _setSize(String value) {
    setState(() {
      _pizzaOrder.size = value;
    });
  }

  void _setTopping(int index, bool value) {
    setState(() {
      String key = _pizzaOrder.toppings.keys.elementAt(index);
      _pizzaOrder.toppings[key] = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text('Order Pizza'),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(32),
          child: Column(
            children: [
              DropdownButton<String>(
                value: _pizzaOrder.size,
                items:
                    Pizza.sizes.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Row(
                      children: [
                        Icon(Icons.local_pizza),
                        Text("Size: $value"),
                      ],
                    ),
                  );
                }).toList(),
                onChanged: (String? value) {
                  _setSize(value!);
                },
              ),
              Expanded(
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: _pizzaOrder.toppings.length,
                      itemBuilder: (BuildContext context, int index) {
                        return CheckboxListTile(
                          value: _pizzaOrder.toppings.values.elementAt(index),
                          onChanged: (bool? value) {
                            _setTopping(index, value!);
                          },
                          controlAffinity: ListTileControlAffinity.leading,
                          title:
                              Text(_pizzaOrder.toppings.keys.elementAt(index)),
                        );
                      })),
              RaisedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) =>
                              Review(order: _pizzaOrder)));
                },
                child: Text('Continue'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
