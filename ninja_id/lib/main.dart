import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(  debugShowCheckedModeBanner: false,

    home: NinjaCard(),
  ));
}

class NinjaCard extends StatefulWidget {
  @override
  State<NinjaCard> createState() => _NinjaCardState();
}

class _NinjaCardState extends State<NinjaCard> {
  int ninjalevel = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: const Text('Ninja ID Card'),
        backgroundColor: Colors.grey[850],
        centerTitle: true,
        elevation: 0.0,
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        setState(() {

          ninjalevel += 1;
        });
        icon: Icon(Icons.add);
      }),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(30.0, 40, 30, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Center(
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/cartoon-boy-images-11.jpg'),
                radius: 40,
              ),
            ),
            const Divider(
              height: 90,
              color: Colors.grey,
            ),
            const Text(
              'NAME',
              style: TextStyle(
                letterSpacing: 2,
                color: Colors.grey,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Chandan',
              style: TextStyle(
                color: Colors.amberAccent[200],
                letterSpacing: 2,
                fontSize: 28,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              'AGE',
              style: TextStyle(
                color: Colors.grey,
                letterSpacing: 2,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              '20',
              style: const TextStyle(
                color: Colors.amberAccent,
                letterSpacing: 2,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),const SizedBox(
              height: 30,
            ),
            const Text(
              'CONTACT',
              style: TextStyle(
                color: Colors.grey,
                letterSpacing: 2,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: const [
                Icon(
                  Icons.phone,
                  color: Colors.grey,
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  '9693559248',
                  style: TextStyle(
                    color: Colors.yellow,
                    fontSize: 21,
                    letterSpacing: 1,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              'CURRENT NINJA LEVEL',
              style: TextStyle(
                color: Colors.grey,
                letterSpacing: 2,
              ),
            ),

            const SizedBox(
              height: 10,
            ),
            Text(
              '$ninjalevel',
              style: const TextStyle(
                color: Colors.amberAccent,
                letterSpacing: 2,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              children: const [
                Icon(
                  Icons.email,
                  color: Colors.grey,
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  'chintas787@gmail.com',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 18,
                    letterSpacing: 1,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
