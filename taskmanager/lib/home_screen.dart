import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:taskmanager/task.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/home-screen';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var _textController;
  var _tasks;
  var _tasksDone;

  void saveData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Task t = Task.fromString(_textController.text);
    // prefs.setString('task', json.encode(t.getMap()));
    // _textController.text='';

    String? tasks = prefs.getString('task');
    List list = (tasks == null) ? [] : json.decode(tasks);
    print(list);
    list.add(json.encode(t.getMap()));
    print(list);
    prefs.setString('task', json.encode(list));
    _textController.task = '';
    Navigator.of(context).pop();
  }

  void _getTasks() async {
    _tasks = [];
    SharedPreferences prefs = await SharedPreferences.getIn-+stance();
    String? tasks = prefs.getString('task');
    List list = (tasks == null) ? [] : json.decode(tasks);
    for (dynamic d in list) {
      _tasks.add(Task.fromMap(json.decode(d)));
    }
    print(_tasks);

    _tasksDone = List.generate(_tasks.length, (index) => false);
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _textController = TextEditingController();

    _getTasks();
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Task Manager',
          style: GoogleFonts.montserrat(),
        ),
      ),
      body: (_tasks == null)
          ? Center(
              child: Text('No Tasks added yet!'),
            )
          : Column(
              children: _tasks
                  .map((e) => Container(
                        height: 70.0,
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.symmetric(
                          horizontal: 10.0,
                          vertical: 5.0,
                        ),
                        padding: const EdgeInsets.only(
                          left: 10.0,
                        ),
                        alignment: Alignment.centerLeft,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          border: Border.all(
                            color: Colors.black,
                            width: 0.5,
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              e.task,
                              style: GoogleFonts.montserrat(),
                            ),
                            Checkbox(
                              value: _tasksDone[_tasks.indexof(e)],
                              key: GlobalKey(),
                              onChanged: (val) {
                                setState(() {
                                  _tasksDone[_tasks.indexof(e)] = val;
                                });
                              },
                            ),
                          ],
                        ),
                      ))
                  .toList(),
            ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        backgroundColor: Colors.blue,
        onPressed: () => showModalBottomSheet(
            context: context,
            builder: (BuildContext context) => Container(
                  padding: const EdgeInsets.all(10.0),
                  height: 300,
                  color: Colors.blue[200],
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Add task',
                            style: GoogleFonts.montserrat(
                              color: Colors.white,
                              fontSize: 20.0,
                            ),
                          ),
                          GestureDetector(
                            onTap: () => Navigator.of(context).pop(),
                            child: Icon(Icons.close),
                          )
                        ],
                      ),
                      Divider(thickness: 1.2),
                      SizedBox(height: 20.0),
                      TextField(
                        controller: _textController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                            borderSide: BorderSide(color: Colors.blueAccent),
                          ),
                          fillColor: Colors.white,
                          filled: true,
                          hintText: 'Enter task',
                          hintStyle: GoogleFonts.montserrat(),
                        ),
                      ),
                      SizedBox(height: 20.0),
                      Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          width: MediaQuery.of(context).size.width,
                          height: 100.0,
                          child: Row(
                            children: [
                              Container(
                                width: (MediaQuery.of(context).size.width / 2) -
                                    20,
                                child: RaisedButton(
                                  color: Colors.white,
                                  child: Text(
                                    'RESET',
                                    style: GoogleFonts.montserrat(),
                                  ),
                                  onPressed: () => _textController.text = '',
                                ),
                              ),
                              Container(
                                width: (MediaQuery.of(context).size.width / 2) -
                                    20,
                                child: RaisedButton(
                                  color: Colors.blue[400],
                                  child: Text(
                                    'ADD',
                                    style: GoogleFonts.montserrat(),
                                  ),
                                  onPressed: () => print('add Pressed'),
                                ),
                              )
                            ],
                          ))
                    ],
                  ),
                )),
      ),
    );
  }
}
