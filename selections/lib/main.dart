import 'package:flutter/material.dart';
import 'dart:core';
import 'DropDown.dart';

void main() => runApp(new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: new MyApp(),
    ));

class MyApp extends StatefulWidget {
  @override
  MyAppState createState() => new MyAppState();
}

class MyAppState extends State<MyApp> {
  bool _isChecked = false;
  bool _isChecked2 = false;
  int _selected = 0;
  int _selected2 = 0;
  double _value = 0;
  String dropdownValue = 'Prakhar';

  void onChanged(bool value) {
    setState(() {
      _isChecked = value;
    });
  }

  void onChanged2(int value2) {
    setState(() {
      _selected2 = value2;
    });
  }

  void onChanged3(bool value3) {
    setState(() {
      _isChecked2 = value3;
    });
  }

  void onChanged4(double value4) {
    setState(() {
      _value = value4;
    });
  }

  List<Widget> makeRadios() {
    List<Widget> list = new List.empty(growable: true);

    for (int i = 0; i < 3; i++) {
      list.add(new Row(
        children: [
          new Text('Radio $i'),
          new Radio(
              value: i,
              groupValue: _selected2,
              onChanged: (int? value2) {
                onChanged2(value2!);
              })
        ],
      ));
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text('Selections'),
        backgroundColor: Colors.purple,
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Row(
          children: [
            Expanded(
              child: Row(
                children: [
                  new Icon(Icons.check_box),
                  new Icon(Icons.radio_button_off),
                  new Icon(Icons.arrow_drop_down_circle_outlined),
                  Expanded(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text('Click me!'),
                            Checkbox(
                                value: _isChecked,
                                onChanged: (bool? value) {
                                  onChanged(value!);
                                }),
                          ],
                        ),
                        new CheckboxListTile(
                            title: Text('Click me!'),
                            activeColor: Colors.pink,
                            secondary: Icon(Icons.ondemand_video_rounded),
                            value: _isChecked,
                            onChanged: (bool? value) {
                              onChanged(value!);
                            }),
                        new Radio(
                            value: 0,
                            groupValue: _selected,
                            onChanged: (int? value2) {
                              onChanged2(value2!);
                            }),
                        new Row(
                          children: makeRadios(),
                        ),
                        Column(
                          children: <Widget>[
                            ListTile(
                              title: const Text('First one'),
                              leading: Radio(
                                value: 0,
                                groupValue: _selected2,
                                onChanged: (int? value) {
                                  setState(() {
                                    _selected2 = value!;
                                  });
                                },
                              ),
                            ),
                            ListTile(
                              title: const Text('Second one'),
                              leading: Radio(
                                value: 0,
                                groupValue: _selected2,
                                onChanged: (int? value) {
                                  setState(() {
                                    _selected2 = value!;
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                        Switch(
                            value: _isChecked2,
                            onChanged: (bool value3) {
                              onChanged3(value3);
                            }),
                        SwitchListTile(
                            secondary: Icon(
                              Icons.radio_button_on,
                              color: Colors.blue,
                            ),
                            title: Text('Switch me'),
                            activeColor: Colors.red,
                            value: _isChecked2,
                            onChanged: (bool value3) {
                              onChanged3(value3);
                            }),
                        Text('Value is : $_value'),
                        Slider(
                          value: _value,
                          onChanged: (double value4) {
                            onChanged4(value4);
                          },
                          min: 0.0,
                          max: 100.0,
                        ),
                        Text('Value is : ${_value * .01}'),
                        LinearProgressIndicator(
                          value: _value * .01,
                        ),
                        DropdownButton<String>(
                          value: dropdownValue,
                          icon: const Icon(Icons.arrow_downward),
                          iconSize: 24,
                          elevation: 16,
                          style: const TextStyle(color: Colors.deepPurple),
                          underline: Container(
                            height: 2,
                            color: Colors.red,
                          ),
                          items: <String>[
                            'Prakhar',
                            'Abhishek',
                            'Aditya',
                            'Chandan'
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Row(
                                children: [
                                  Icon(Icons.home),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    value,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 20),
                                  )
                                ],
                              ),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              dropdownValue = newValue!;
                            });
                          },
                        ),
                        RaisedButton(
                          child: Text('ListView'),
                          onPressed: () {
                            setState(() {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Listview()));
                            });
                          },
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
