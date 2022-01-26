import 'package:flutter/material.dart';
// import 'package:tut5_app/Material Button And Icon Button.dart';
// import 'package:tut5_app/CALCULATOR APP.dart';
import 'package:tut5_app/TimerApp.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Hand Written',
      theme: ThemeData(
        primarySwatch: Colors.cyan,
      ),
      home: MyHomePage(),
    );
  }
}

// class MyHomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Yes Home Screen',
//         style: TextStyle(
//
//         ),),
//       ),
//       body: Center(
//
//         child: Text(
//
//           'Hii From Desi Programmer',
//           style: TextStyle(
//             color: Colors.red,
//             fontSize: 40,
//             fontWeight: FontWeight.bold,
//             fontStyle: FontStyle.italic,
//             fontFamily: 'Times New Roman',
//             // letterSpacing: 10,
//             // decoration: TextDecoration.underline,
//             // decorationColor: Colors.black,
//             // decorationStyle: TextDecorationStyle.dashed,
//             // wordSpacing: 20,
//             // backgroundColor: Colors.black,
//             // background:Paint()..color = Colors.black..style= PaintingStyle.stroke,
//           ),
//         ),
//       ),
//     );
//   }
// }
