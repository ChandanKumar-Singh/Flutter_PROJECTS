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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              onPressed: () {},
              color: Colors.red[400],
              height: 40.0,
              minWidth: 200.0,
              splashColor: Colors.green,
              child: Text(
                "Material Button",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
              // shape: RoundedRectangleBorder(
              //   borderRadius: BorderRadius.circular(15),
              // ),
              // shape: StadiumBorder(),
              // shape: OutlineInputBorder(),
              shape: Border.all(
                color: Colors.yellow,
                width: 7,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.add_a_photo),
              splashColor: Colors.red,
              splashRadius: 20,
              tooltip: 'add a photo',
            ),
          ],
        ),
      ),
    );
  }
}
