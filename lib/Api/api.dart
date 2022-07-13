import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';

class Api {
  String money = "";

  String type = "";
  String name = "";
  String unit = "";

  Api(String type) {
    this.type = type;
  }

  var url = Uri.parse('https://api.coingecko.com/api/v3/exchange_rates');

  Future<void> getCurency() async {
    Response response = await get(url);
    Map currency = jsonDecode(response.body);
    double price = currency['rates'][type]['value'];
    String names = currency['rates'][type]['name'];
    String units = currency['rates'][type]['unit'];
    print(price);
    money = price.toString();
    name = names;
    unit = units;
  }
}
