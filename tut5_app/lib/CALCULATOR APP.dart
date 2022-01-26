
class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late int firstnum;
  late int secnum;
  late String texttodisplay = "";
  late String res;
  late String operatortoperform;

  void btnClicked(String btnValue) {
    if (btnValue == 'C') {
      texttodisplay = '';
      firstnum = 0;
      secnum = 0;
      res = '';
    } else if (btnValue == '-' ||
        btnValue == 'x' ||
        btnValue == '/' ||
        btnValue == '+') {
      firstnum = int.parse(texttodisplay);
      res = '';
      operatortoperform = btnValue;
    } else if (btnValue == '=') {
      secnum = int.parse(texttodisplay);
      if (operatortoperform == '-') {
        res = {firstnum - secnum}.toString();
      }
      if (operatortoperform == 'x') {
        res = {firstnum * secnum}.toString();
      }
      if (operatortoperform == '/') {
        res = {firstnum / secnum}.toString();
      }
      if (operatortoperform == '+') {
        res = {firstnum + secnum}.toString();
      }
    } else {
      res = int.parse(texttodisplay + btnValue).toString();
    }
    setState(() {
      texttodisplay = res;
    });
  }

  Widget CustomButton(String btnValue) {
    return Expanded(
      child: OutlineButton(
        padding: EdgeInsets.all(25),
        onPressed: () => btnClicked(btnValue),
        child: Text(
          ' $btnValue',
          style: TextStyle(
            fontSize: 25,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'CALCULATOR',
          style: TextStyle(),
        ),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            new Text(
              r"Let's Calculate",
              style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.w600,
              ),
            ),
            Expanded(
                child: Container(
              alignment: Alignment.bottomRight,
              padding: EdgeInsets.all(10),
              child: Text(
                '$texttodisplay',
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            )),
            Row(
              children: [
                CustomButton('9'),
                CustomButton('8'),
                CustomButton('7'),
                CustomButton('+'),
              ],
            ),
            Row(
              children: [
                CustomButton('6'),
                CustomButton('5'),
                CustomButton('4'),
                CustomButton('-'),
              ],
            ),
            Row(
              children: [
                CustomButton('3'),
                CustomButton('2'),
                CustomButton('1'),
                CustomButton('x'),
              ],
            ),
            Row(
              children: [
                CustomButton('C'),
                CustomButton('0'),
                CustomButton('='),
                CustomButton('/'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
