import 'package:flutter/cupertino.dart' as c;
import 'package:flutter/material.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:fluttertoast/fluttertoast.dart';

// Files
import '../models/unsplash_photo.dart';
import '../services/unsplash_api_service.dart';
import '../utils/brightness.dart';

class BackgroundImage extends StatefulWidget {
  const BackgroundImage({
    Key? key,
    required this.month,
  }) : super(key: key);

  final int month;

  @override
  _BackgroundImageState createState() => _BackgroundImageState();
}

class _BackgroundImageState extends State<BackgroundImage> {
  late final FToast errToast;
  late final Future<List<UnsplashPhoto>> _getBGImages;
  List<UnsplashPhoto> images = [];
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
        String credits;
        print(snapshot);
        if ((snapshot.connectionState == c.ConnectionState.done) &&
            (snapshot.hasData) &&
            (snapshot.data.isNotEmpty)) {
          images = snapshot.data;
          credits = images[widget.month - 1].photographer;

          try {
            child = BlurHash(
              hash: images[widget.month - 1].blurHash,
              image: images[widget.month - 1].url,
              imageFit: c.BoxFit.cover,
            );
             } catch (_err) {
            //Handle Errors
            // handleErrors(_err, errToast);

            child = Image.asset(
              brightness == Brightness.light
                  ? 'backup-bg-image.JPG'
                  : 'bg_dark.jpg',
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            );
          }
        } else {
          child = Image.asset(
            brightness == Brightness.light
                ? 'backup-bg-image.JPG'
                : 'bg_dark.jpg',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          );
          credits = '';
        }
        return c.AnimatedSwitcher(
          child: Stack(
            children: [
              child,
              Positioned(
                child: Text(
                  credits,
                  style: const TextStyle(color: Colors.black, fontSize: 18),
                ),
                bottom: 100,
                right: 100,
              ),
            ],
          ),
          switchInCurve: Curves.easeIn,
          switchOutCurve: Curves.easeOut,
          duration: const Duration(milliseconds: 800),
        );
      },
    );
  }
}
