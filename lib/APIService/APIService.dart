import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class APIService {

  Future<List> getImages() async {
    debugPrint(DotEnv().env['API_URL']);
    var onlineData = await http.get(DotEnv().env['API_URL']);
    var jsonData = json.decode(onlineData.body);
    return jsonData['results'];
  }

}