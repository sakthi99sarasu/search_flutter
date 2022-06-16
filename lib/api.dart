import 'dart:convert';

//import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'config.dart';
import 'dbhandler.dart';

class APIService {
  static var client = http.Client();

  //retrieve all product
  static Future<List<SearchModel>?> getdetails() async {
    Map<String, String> requestHeaders = {'Content-Type': 'application/json'};

    var url = Uri.http(Config.apiURL, Config.keywordURL);

    var response = await client.get(url, headers: requestHeaders);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      //print(data);
      //var tagObjsJson = jsonDecode(data)['tags'] as List;
      // List<SearchModel> tagObjs =
      //     data.map((tagJson) => SearchModel.fromJson(tagJson)).toList();
      // print(data['data']);
      //print(tagObjs);
      return productsFromJson(data['data']);
      //return tagObjs;
      //return fromJson(data['data']);
    }
  }

  static Future<List<SearchModel>?> getresult(String keyword) async {
    Map<String, String> requestHeaders = {'Content-Type': 'application/json'};
    String u = Config.resultURL + keyword;
    print(u);
    var url = Uri.http(Config.apiURL, Config.resultURL + keyword);

    var response = await client.get(url, headers: requestHeaders);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      //print(data);
      //var tagObjsJson = jsonDecode(data)['tags'] as List;
      // List<SearchModel> tagObjs =
      //     data.map((tagJson) => SearchModel.fromJson(tagJson)).toList();
      // print(data['data']);
      //print(tagObjs);
      return productsFromJson(data['data']);
      //return tagObjs;
      //return fromJson(data['data']);
    }
  }

  static Future<bool> getItem(String username, String password) async {
    Map<String, String> requestHeaders = {'Content-Type': 'application/json'};
    // String u = Config.resultURL + keyword;
    // print(u);
    var url = Uri.http(Config.apiURL, Config.login);

    var response = await client.post(
      url,
      headers: requestHeaders,
      body: jsonEncode(
          <String, dynamic>{'username': username, 'password': password}),
    );
    var data = jsonDecode(response.body);
    if (data['Status'] == 200) {
      print(response.statusCode);
      // var data = jsonDecode(response.body);

      return true;
    } else {
      print(response.statusCode);
      return false;
    }
  }
}
