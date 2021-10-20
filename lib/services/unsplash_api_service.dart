import 'dart:convert';
import 'package:http/http.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

// Files
import '../models/unsplash_photo.dart';

const String _api = 'https://api.unsplash.com/';

/// UnsplashAPIService class provides static methods to use UnSplash Api Services.
class UnsplashAPIService {
  static final UnsplashAPIService unsplashAPIServiceSingleton = UnsplashAPIService._internal();
  UnsplashAPIService._internal();
  factory UnsplashAPIService() => unsplashAPIServiceSingleton;

  /// Retrieve List of [UnsplashPhoto] using Unsplash Api
  static Future<List<UnsplashPhoto>> getPhotos(int count, FToast _errorToast) async {
    assert(count > 0 && count <= 30);

    final List<UnsplashPhoto> photos = [];
    const String _path = 'photos/random/';
    final String? _clientID = DotEnv().env['CLIENT_ID'];
    final String query = '?count=$count&client_id=$_clientID&query=nature&color=dark&orientation=portrait';
    try {
      print('$_api$_path$query');

      final Response response = await get(Uri.parse('$_api$_path$query'));
      if (response.statusCode == 200) {
        final List<dynamic> photosdata = json.decode(response.body);
        photosdata.forEach((photoData) {
          final UnsplashPhoto photo = UnsplashPhoto.fromMap(photoData);
          photos.add(photo);
        });
      } else if (response.statusCode == 401) {
        print('[Unsplash API Error] Unauthorized Access!!');
        // displayErrorDescription(
        //     "Unauthorized access, Try again Later!!", _errorToast);
      } else {
        print('[Unsplash API Error] ${response.statusCode}: ${response.reasonPhrase}');
        // displayErrorDescription(
        //     "Multiple error occurred, Try again Later!!", _errorToast);
      }
    } catch (_err) {
      print('Unsplash Error: ${_err.toString()}');
      //Display Error Message
      // handleErrors(_err, _errorToast);
    }
    return photos;
  }
}
