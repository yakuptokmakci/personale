import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:personale/Api/api.dart';

class Xrp extends StatefulWidget {
  const Xrp({Key? key}) : super(key: key);

  @override
  State<Xrp> createState() => _XrpState();
}

class _XrpState extends State<Xrp> {
  String money = "loading";
  String name = "";
  String unit = "";

  void setmoney() async {
    Api a6 = new Api("xrp");
    await a6.getCurency();
    setState(() {
      money = a6.money;
      name = a6.name;
      unit = a6.unit;
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
        title: Text("XRP",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24.0,
                color: Colors.white)),
      ),
      body: Center(
        child: Column(
          children: [
            Image.network(
                "https://s2.coinmarketcap.com/static/img/coins/200x200/52.png"),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Text(
                  "PRICE: ",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 50.0,
                ),
                Text(money,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24.0,
                        color: Colors.white)),
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
