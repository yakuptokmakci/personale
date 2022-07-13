import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:personale/Api/api.dart';

class Bcash extends StatefulWidget {
  const Bcash({Key? key}) : super(key: key);

  @override
  State<Bcash> createState() => _BcashState();
}

class _BcashState extends State<Bcash> {
  String money = "loading";
  String name = "loading";
  String unit = "";

  void setmoney() async {
    Api a3 = new Api("bch");
    await a3.getCurency();
    setState(() {
      money = a3.money;
      unit = a3.unit;
      name = a3.name;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setmoney();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        backgroundColor: Colors.grey[800],
        centerTitle: true,
        title: Text("BITCOIN CASH",
            style: TextStyle(
              color: Colors.white,
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            )),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Center(
              child: Image.network(
                  "https://s2.coinmarketcap.com/static/img/coins/200x200/1831.png"),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Text(
                  "PRICE:",
                  style: TextStyle(
                      fontSize: 24.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 50,
                ),
                Text(money,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 24.0)),
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
      ),
    );
  }
}
