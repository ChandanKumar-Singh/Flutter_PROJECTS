import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final String title = 'ListView';
  List<int> _listitems = [1, 2, 3, 4, 5, 6, 7, 8, 9];
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter = _listitems.length;
      _counter++;
      _listitems.add(_counter);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Container(
        width: double.infinity,
        child: ListView.separated(
          padding: EdgeInsets.all(10),
          itemBuilder: (BuildContext context, int index) {
            return Dismissible(
              key: ValueKey(123),
              direction: DismissDirection.endToStart,
              onDismissed: (direction) => print(direction),
              background: Container(
                color: Colors.red,
                child: Icon(
                  Icons.delete,
                  color: Colors.white,
                  size: 40,
                ),
                alignment: Alignment.centerRight,
                margin: const EdgeInsets.only(right: 15),
              ),
              child: Card(
                  margin: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
                  child:
                      ListTile(title: Text('Count => ${_listitems[index]}'))),
            );
          },
          separatorBuilder: (BuildContext context, int index) => Divider(
            color: Colors.white,
          ),
          itemCount: _listitems.length,
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: Text('Add'),
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        icon: Icon(Icons.add),
        backgroundColor: Colors.red,
      ),
    );
  }
}
