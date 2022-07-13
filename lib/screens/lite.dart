import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:personale/Api/api.dart';

class Lite extends StatefulWidget {
  const Lite({Key? key}) : super(key: key);

  @override
  State<Lite> createState() => _LiteState();
}

String money = "loading";
String name = "loading";
String unit = "loading";

class _LiteState extends State<Lite> {
  void setmoney() async {
    Api a2 = new Api("ltc");
    await a2.getCurency();
    setState(() {
      money = a2.money;
      unit = a2.unit;
      name = a2.name;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("lite ekranındyaız");
    setmoney();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        backgroundColor: Colors.grey[800],
        centerTitle: true,
        title: Text("LITE",
            style: TextStyle(
                color: Colors.white,
                fontSize: 24.0,
                fontWeight: FontWeight.bold)),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Center(
              child: Image.network(
                  "https://s2.coinmarketcap.com/static/img/coins/200x200/2.png"),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Text(
                  "PRICE:",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 50,
                ),
                Text(
                  money,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24.0,
                      color: Colors.white),
                )
              ],
            ),
            Column(
              children: [
                Row(
                  children: [
                    Text(
                      "NAME:",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24.0,
                          color: Colors.white),
                    ),
                    SizedBox(
                      width: 50,
                    ),
                    Text(
                      name,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24.0,
                          color: Colors.white),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Text(
                      "UNIT:",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24.0,
                          color: Colors.white),
                    ),
                    SizedBox(
                      width: 60,
                    ),
                    Text(
                      unit,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24.0,
                          color: Colors.white),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(290, 200, 0, 0),
                  child: FloatingActionButton(
                    onPressed: () {
                      setmoney();
                    },
                    backgroundColor: Colors.white,
                    child: Icon(Icons.lock_reset_sharp, color: Colors.black),
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
