import 'package:flutter/cupertino.dart' as c;

//Files
import '../APIService/APIService.dart';
import '../styles/style.dart';

class UnsplashImage {
  List photoList;
  int dataLoaded = 0;

  //this variable indicates if we have finished getting images from
  // the api and storing it into local variable photoList

  UnsplashImage() {
    _init();
  }

  void _init() async {
    APIService api = APIService();
    List response = await api.getImages();
    photoList = response;
    dataLoaded = 1;
  }

  c.NetworkImage getBg(int index) {
    //returns images from api if they have been received and stored
    // into local variable or returns a particular network image
    return dataLoaded == 1
        ? c.NetworkImage(photoList[index]['urls']['regular'])
        : c.NetworkImage(
            "https://images.unsplash.com/photo-1609974631382-441d02050871?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=358&q=80");
  }

  c.Text getAttribution(int index, context) {
    return dataLoaded == 1
        ? c.Text(
            "by ${photoList[index]['user']['username']} from Unsplash",
            style: Style.footerNoteSecondary(context),
          )
        : c.Text(
            "by Mark Boss from Unsplash",
            style: Style.footerNoteSecondary(context),
          );
  }
}
