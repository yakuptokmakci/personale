import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:personale/Api/api.dart';

class Eos extends StatefulWidget {
  const Eos({Key? key}) : super(key: key);

  @override
  State<Eos> createState() => _EosState();
}

class _EosState extends State<Eos> {
  String money = "loading...";
  String name = "";
  String unit = "";
  void setmoney() async {
    Api a5 = new Api("eos");
    await a5.getCurency();
    setState(() {
      money = a5.money;
      name = a5.name;
      unit = a5.unit;
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
        title: Text("EOS",
            style: TextStyle(
                color: Colors.white,
                fontSize: 24.0,
                fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            Image.network(
                "https://s2.coinmarketcap.com/static/img/coins/200x200/1765.png"),
            Row(
              children: [
                Text(
                  "PRICE:",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24.0,
                      color: Colors.white),
                ),
                SizedBox(
                  width: 50,
                ),
                Text(money,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold)),
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
