import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart';

// Files
import '../models/unsplash_photo.dart';

const String _api = 'https://api.unsplash.com/';

/// UnsplashAPIService class provides static methods to use UnSplash Api Services.
class UnsplashAPIService {
  // TODO: shift it to proper place.

  /// Load Environment
  static void loadenv() async {
    try {
      await DotEnv().load('.env');
    } catch (e) {
      print('.env loading: $e');
    }
  }
  /// Retrieve List of [UnsplashPhoto] using Unsplash Api
  static Future<List<UnsplashPhoto>> getPhotos(int count) async {
    assert(count > 0 && count <= 30);

    List<UnsplashPhoto> photos = List<UnsplashPhoto>();
    const String _path = 'photos/random/';
    final String _clientID = DotEnv().env['CLIENT_ID'];
    final String query =
        '?count=$count&client_id=$_clientID&query=nature&orientation=portrait';
    try {
      print('$_api$_path$query');
      Response response = await get('$_api$_path$query');
      if (response.statusCode == 200) {
        List<dynamic> photosdata = json.decode(response.body);
        photosdata.forEach((photoData) {
          UnsplashPhoto photo = UnsplashPhoto.fromMap(photoData);
          photos.add(photo);
        });
      } else {
        print('Unsplash status Code: ${response.statusCode}');
      }
      return photos;
    } catch (e) {
      print('Unsplash Error: $e');
      return photos;
    }
  }
}
