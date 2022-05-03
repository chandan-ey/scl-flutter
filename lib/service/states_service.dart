import 'package:http/io_client.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';

class statesService {
  static const baseURL =
      "https://api.ck3oh5xguk-shreeceme1-d1-public.model-t.cc.commerce.ondemand.com/occ/v2/powertools";
  static const token = 'toNh7F65NdbYa7muKF66dAamtSk';

  getState() async {
    final ioc = new HttpClient();
    ioc.badCertificateCallback =
        (X509Certificate cert, String host, int port) => true;
    final http = new IOClient(ioc);
    var response = await http.post(
      Uri.parse(baseURL + '/region/states'),
      headers: {
        "Content-Type": "application/json",
        //'Authorization': 'Bearer $token',
      },
      encoding: Encoding.getByName("utf-8"),
    );
    return json.decode(response.body);
  }

  getDistrict(stateId) async {
    final ioc = new HttpClient();
    ioc.badCertificateCallback =
        (X509Certificate cert, String host, int port) => true;
    final http = new IOClient(ioc);
    var response = await http.post(
      Uri.parse(baseURL + '/region/districts?stateCode=' + stateId),
      headers: {
        "Content-Type": "application/json",
        //'Authorization': 'Bearer $token',
      },
      encoding: Encoding.getByName("utf-8"),
    );
    return json.decode(response.body);
  }

  getTaluka(districtId) async {
    final ioc = new HttpClient();
    ioc.badCertificateCallback =
        (X509Certificate cert, String host, int port) => true;
    final http = new IOClient(ioc);
    print(districtId);
    var response = await http.post(
      Uri.parse(baseURL + '/region/talukas?districtCode=' + districtId),
      headers: {
        "Content-Type": "application/json",
        //'Authorization': 'Bearer $token',
      },
      encoding: Encoding.getByName("utf-8"),
    );
    return json.decode(response.body);
  }

  getCity(talukaId) async {
    final ioc = new HttpClient();
    ioc.badCertificateCallback =
        (X509Certificate cert, String host, int port) => true;
    final http = new IOClient(ioc);
    print(talukaId);
    var response = await http.post(
      Uri.parse(baseURL + '/region/cities?talukaCode=' + talukaId),
      headers: {
        "Content-Type": "application/json",
        //'Authorization': 'Bearer $token',
      },
      encoding: Encoding.getByName("utf-8"),
    );
    return json.decode(response.body);
  }

  postDealerData(formData) async {
    final ioc = HttpClient();
    ioc.badCertificateCallback =
        (X509Certificate cert, String host, int port) => true;
    final http = IOClient(ioc);
    var response = await http.post(
      Uri.parse(baseURL + '/sclProsDealers/saveBasicDetails'),
      headers: {
        "Content-Type": "application/json",
      },
      body: jsonEncode(formData),
      encoding: Encoding.getByName("utf-8"),
    );
    print(response.body);
    var result = jsonDecode(response.body);
    if (result == 'true') {
      return 'true';
    } else if (result.containsKey("errors")) {
      if (result['errors'][0]['type'] == 'DuplicateUidError') {
        return 'Phone number already exist.';
      }
    }
  }
}
