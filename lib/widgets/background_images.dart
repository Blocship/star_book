import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart' as c;
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:star_book/api/errors_toast.dart';

// Files
import '../models/unsplash_photo.dart';
import '../api/unsplash_api_service.dart';
import '../utils/brightness.dart';

class BackgroundImage extends StatefulWidget {
  const BackgroundImage({
    Key key,
    @required this.month,
  }) : super(key: key);

  final int month;

  @override
  _BackgroundImageState createState() => _BackgroundImageState();
}

class _BackgroundImageState extends State<BackgroundImage> {
  FToast errToast;
  Future<List<UnsplashPhoto>> _getBGImages;
  List<UnsplashPhoto> images = List<UnsplashPhoto>();
  @override
  void initState() {
    super.initState();
    errToast = FToast();
    errToast.init(context);
    _getBGImages = initImages();
  }

  Future<List<UnsplashPhoto>> initImages() async {
    return await UnsplashAPIService.getPhotos(12, errToast);
  }

  @override
  Widget build(BuildContext context) {
    return c.FutureBuilder(
        future: _getBGImages,
        builder: (c.BuildContext context, c.AsyncSnapshot snapshot) {
          Widget child;
          if ((snapshot.connectionState == c.ConnectionState.done) &&
              (snapshot.hasData) &&
              (snapshot.data.isNotEmpty)) {
            images = snapshot.data;
            try {
              child = BlurHash(
                hash: images[widget.month - 1].blurhash,
                image: images[widget.month - 1].url,
                imageFit: c.BoxFit.cover,
              );
            } catch (_err) {
              //Handle Errors
              handleErrors(_err, errToast);
            }
          } else {
            child = Image.asset(
              brightness == Brightness.light
                  ? "backup-bg-image.JPG"
                  : "bg_dark.jpg",
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            );
          }
          return c.AnimatedSwitcher(
            child: child,
            switchInCurve: Curves.easeIn,
            switchOutCurve: Curves.easeOut,
            duration: const Duration(milliseconds: 800),
          );
        });
  }
}
