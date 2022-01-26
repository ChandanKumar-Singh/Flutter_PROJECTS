import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Listview extends StatefulWidget {
  const Listview({Key? key}) : super(key: key);

  @override
  _ListviewState createState() => _ListviewState();
}

class _ListviewState extends State<Listview> {
  List<bool> _data = new List.empty(growable: true);

  @override
  void initState() {
    setState(() {
      for (int i = 0; i < 1000; i++) {
        _data.add(false);
      }
    });
  }

  void _onChanged(bool value, int index) {
    setState(() {
      _data[index] = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      drawer: DropdownMenuItem(
          child: Column(

        children: [
          UserAccountsDrawerHeader(
              accountName: Text('CKS'),
              accountEmail: Text('mmsweb0@gmail.com')),
          Column(
            children: [
              Container(
                color: Colors.pink,
                child: Column(
                  children: [
                    ListTile(
                      leading: Icon(Icons.phone),
                      title: Text('Contact'),
                    ),
                    ListTile(
                      leading: Icon(Icons.phone),
                      title: Text('Contact'),
                    ),
                    ListTile(
                      leading: Icon(Icons.phone),
                      title: Text('Contact'),
                    ),
                    ListTile(
                      leading: Icon(Icons.phone),
                      title: Text('Contact'),
                    ),
                    ListTile(
                      leading: Icon(Icons.phone),
                      title: Text('Contact'),
                    ),
                    ListTile(
                      leading: Icon(Icons.phone),
                      title: Text('Contact'),
                    ),
                    ListTile(
                      leading: Icon(Icons.phone),
                      title: Text('Contact'),
                    ),
                  ],
                ),
              )
            ],
          ),
          BottomAppBar(
            child: ListTile(
              leading: Icon(Icons.phone),
              title: Text('Contact'),
            ),
          )
        ],
      )),
      appBar: AppBar(
        title: Text('ListView'),
      ),
      body: ListView.builder(itemBuilder: (BuildContext context, int index) {
        return Card(
          child: Container(
            padding: EdgeInsets.all(5),
            child: Column(
              children: [
                Text('This is item $index'),
                CheckboxListTile(
                    value: _data[index],
                    controlAffinity: ListTileControlAffinity.leading,
                    title: Text('Click me item $index'),
                    onChanged: (bool? value) {
                      _onChanged(value!, index);
                    }),
              ],
            ),
          ),
        );
      }),
    );
  }
}
