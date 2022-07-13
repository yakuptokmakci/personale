import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:personale/Api/api.dart';

class Etherium extends StatefulWidget {
  const Etherium({Key? key}) : super(key: key);

  @override
  State<Etherium> createState() => _EtheriumState();
}

class _EtheriumState extends State<Etherium> {
  String money = "loading...";
  String name = "loading";
  String unit = "loading";

  void setmoney() async {
    Api a = new Api("eth");
    await a.getCurency();
    print(a.money);
    setState(() {
      money = a.money;
      name = a.name;
      unit = a.unit;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setmoney();
    print("etheryum ekranındayız");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        backgroundColor: Colors.grey[800],
        centerTitle: true,
        title: Text("ETHERIUM",
            style: TextStyle(
                fontSize: 24.0,
                color: Colors.white,
                fontWeight: FontWeight.bold)),
      ),
      body: Column(
        children: [
          Center(
              child: Image.network(
                  "https://s2.coinmarketcap.com/static/img/coins/200x200/1027.png")),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Text("PRICE:",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold)),
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
          SizedBox(
            height: 10,
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
    );
  }
}
