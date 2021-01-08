import 'dart:convert';
import 'package:http/http.dart' as http;

class APIService {

  Future<List> getImages() async {
    var onlineData = await http.get(
        'https://api.unsplash.com/search/photos?per_page=30&client_id=kuoRAOdNXkxVLTRzFZ6hqvUJwG9k8UTtTgfzPZWU8ao&query=nature&orientation=portrait');
    var jsonData = json.decode(onlineData.body);
    return jsonData['results'];
  }

}