import 'package:http/io_client.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';

class statesService {
  static const baseURL =
      "https://api.ck3oh5xguk-shreeceme1-d1-public.model-t.cc.commerce.ondemand.com/occ/v2/powertools/users/ulf.becker%40rustic-hw.com/states";
  static const token = 'iLXyc2CEgTlbI5wUROh7aeLu4E0';

  getState() {
    final ioc = new HttpClient();
    ioc.badCertificateCallback =
        (X509Certificate cert, String host, int port) => true;
    final http = new IOClient(ioc);
    http
        .post(
      Uri.parse(baseURL),
      headers: {
        "Content-Type": "application/json",
        'Authorization': 'Bearer $token',
      },
      encoding: Encoding.getByName("utf-8"),
    )
        .then((response) {
      List<DropdownMenuItem<String>> statemenuItems = [];
      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        for (var i = 0; i < data.length; i++) {
          statemenuItems.add(DropdownMenuItem(
              child: Text(data[i]['name']), value: data[i]['name']));
        }
      } else {
        return [
          statemenuItems.add(DropdownMenuItem(child: Text(''), value: ''))
        ];
      }
    });
  }
}
