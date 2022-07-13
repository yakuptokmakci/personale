import 'package:flutter/material.dart';
import 'screens/eth.dart';
import 'screens/lite.dart';
import 'screens/bcash.dart';
import 'screens/bnb.dart';
import 'screens/eos.dart';
import 'screens/xrp.dart';

void main() {
  runApp(MaterialApp(
    home: Homescreen(),
    initialRoute: '/Homescreen',
    routes: {
      '/eth': (context) => Etherium(),
      '/ltc': (context) => Lite(),
      '/bcash': (context) => Bcash(),
      '/Homescreen': (context) => Homescreen(),
      '/eos': (context) => Eos(),
      '/xrp': (context) => Xrp(),
      '/bnb': (context) => Bnb(),
    },
  ));
}

class Homescreen extends StatelessWidget {
  const Homescreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  color: Colors.red,
                  height: 100,
                  width: 100,
                  margin: EdgeInsets.fromLTRB(20, 20, 0, 0),
                  child: FlatButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/eth');
                    },
                    child: Image.network(
                      "https://s2.coinmarketcap.com/static/img/coins/200x200/1027.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  color: Colors.red,
                  height: 100,
                  width: 100,
                  margin: EdgeInsets.fromLTRB(20, 20, 0, 0),
                  child: FlatButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/ltc');
                    },
                    child: Image.network(
                        "https://s2.coinmarketcap.com/static/img/coins/200x200/2.png",
                        fit: BoxFit.cover),
                  ),
                ),
                Container(
                  color: Colors.red,
                  height: 100,
                  width: 100,
                  margin: EdgeInsets.fromLTRB(20, 20, 0, 0),
                  child: FlatButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/bcash');
                    },
                    child: Image.network(
                        "https://s2.coinmarketcap.com/static/img/coins/200x200/1831.png",
                        fit: BoxFit.cover),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  color: Colors.red,
                  height: 100,
                  width: 100,
                  margin: EdgeInsets.fromLTRB(20, 20, 0, 0),
                  child: FlatButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/bnb');
                    },
                    child: Image.network(
                        "https://s2.coinmarketcap.com/static/img/coins/200x200/1839.png",
                        fit: BoxFit.cover),
                  ),
                ),
                Container(
                  color: Colors.red,
                  height: 100,
                  width: 100,
                  margin: EdgeInsets.fromLTRB(20, 20, 0, 0),
                  child: FlatButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/eos');
                    },
                    child: Image.network(
                        "https://s2.coinmarketcap.com/static/img/coins/200x200/1765.png",
                        fit: BoxFit.cover),
                  ),
                ),
                Container(
                  color: Colors.red,
                  height: 100,
                  width: 100,
                  margin: EdgeInsets.fromLTRB(20, 20, 0, 0),
                  child: FlatButton(
                    onPressed: () {
                      Navigator.pushNamed(context, 'xrp');
                    },
                    child: Image.network(
                        "https://s2.coinmarketcap.com/static/img/coins/200x200/52.png",
                        fit: BoxFit.cover),
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
