import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:esys_flutter_share/esys_flutter_share.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

void convertWidgetToImageAndShare(BuildContext context, containerKey) async {
  RenderRepaintBoundary renderRepaintBoundary =
      containerKey.currentContext.findRenderObject();
  ui.Image boxImage = await renderRepaintBoundary.toImage(pixelRatio: 1);
  ByteData byteData = await boxImage.toByteData(format: ui.ImageByteFormat.png);
  Uint8List uInt8List = byteData.buffer.asUint8List();
  try {
    await Share.file('Star Book', 'activity.png', uInt8List, 'image/png',
        text:
            'See My Diary. I made it with Star Book App. Check it out at Github https://github.com/hashirshoaeb/star_book');
  } catch (e) {
    print('error: $e');
  }
}
