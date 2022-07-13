import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:personale/Api/api.dart';

class Bnb extends StatefulWidget {
  const Bnb({Key? key}) : super(key: key);

  @override
  State<Bnb> createState() => _BnbState();
}

class _BnbState extends State<Bnb> {
  String money = "loading";
  String name = "";
  String unit = "";

  void setmoney() async {
    Api a4 = new Api("bnb");
    await a4.getCurency();
    setState(() {
      money = a4.money;
      name = a4.name;
      unit = a4.unit;
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
        title: Text("BNB",
            style: TextStyle(
                fontSize: 24.0,
                color: Colors.white,
                fontWeight: FontWeight.bold)),
      ),
      body: Center(
        child: Column(
          children: [
            SafeArea(
                child: Center(
              child: Image.network(
                  "https://s2.coinmarketcap.com/static/img/coins/200x200/1839.png"),
            )),
            Row(
              children: [
                Text(
                  "PRICE:",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 24.0),
                ),
                SizedBox(
                  width: 50,
                ),
                Text(money,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
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
