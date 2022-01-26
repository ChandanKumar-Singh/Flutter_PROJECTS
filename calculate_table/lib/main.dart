import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  //this Widget is root of your Application
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Table App',
        color: Colors.yellow,
        home: MyHomeApp());
  }
}

class MyHomeApp extends StatefulWidget {
  @override
  _MyHomeAppState createState() => _MyHomeAppState();
}

class _MyHomeAppState extends State<MyHomeApp> {
  var _textController;
  double count = 0;
  int counts = 0;

  @override
  void initState() {
    super.initState();
    _textController = TextEditingController();
    counts = count.toInt();
    _textController.text = counts.toString();
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          title: Text('Table '),
          backgroundColor: Colors.pink,
          leading: Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(
              // color: Colors.white,
                shape: BoxShape.circle,
                image: DecorationImage(image: AssetImage('images/babli.jpg',),fit: BoxFit.fitHeight)),

          ),
          actions: [
            Container(
              width: 100,
              decoration: BoxDecoration(
                // color: Colors.white,
                  shape: BoxShape.circle,
                  image: DecorationImage(image: AssetImage('images/banty.jpg',),fit: BoxFit.fitHeight)),

            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Colors.black, offset: Offset(1, 1), blurRadius: 10)
              ],
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        style: TextStyle(fontSize: 20),
                        keyboardType: TextInputType.number,
                        controller: _textController,
                      ),
                    ),
                    IconButton(
                        onPressed: () => setState(() {
                              setState(() {
                                counts = int.parse(_textController.text);
                              });
                            }),
                        icon: Icon(
                          Icons.done,
                          color: Colors.green,
                          size: 20,
                        ))
                  ],
                ),
                Expanded(
                    // height: 300.0,
                    child: ListView.builder(
                        itemCount: 10,
                        itemBuilder: (BuildContext context, int index) =>
                            ListTile(
                              title: RichText(
                                  text: TextSpan(children: [
                                TextSpan(
                                    text: '${int.parse(_textController.text)} ',
                                    style: TextStyle(
                                        color: Colors.red, fontSize: 20)),
                                TextSpan(
                                    text: 'x ',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 20)),
                                TextSpan(
                                    text: '${index + 1} ',
                                    style: TextStyle(
                                        color: Colors.purpleAccent,
                                        fontSize: 20)),
                                TextSpan(
                                    text: '= ',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 20)),
                                TextSpan(
                                    text:
                                        '${(index + 1) * int.parse(_textController.text)}',
                                    style: TextStyle(
                                        color: Colors.green[900],
                                        fontSize: 20)),
                              ])),
                            ))),
              ],
            ),
          ),
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton.extended(
              backgroundColor: Colors.pink,
              icon: Icon(Icons.remove_rounded),
              label: Text('कम'),
              onPressed: () => {
                setState(() {
                  counts--;
                  _textController.text = counts.toString();
                })
              },
            ),
            SizedBox(
              width: 10,
            ),
            FloatingActionButton.extended(
              backgroundColor: Colors.deepPurpleAccent,
              icon: Icon(Icons.add),
              label: Text('ज्यादा'),
              onPressed: () => {
                setState(() {
                  counts++;
                  _textController.text = counts.toString();
                })
              },
            ),
          ],
        ));
  }
}
