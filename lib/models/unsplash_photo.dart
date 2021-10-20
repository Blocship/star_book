import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'unsplash_photo.freezed.dart';

/// If you think as relational database then it is the name of [UnsplashPhoto] table.

/// UnSplashPhoto Table
///
/// If you think as relational database,
/// [url], [photographer], [link] and [blurhash]
/// are table column names
// 5
@freezed
class UnsplashPhoto with _$UnsplashPhoto {
  const factory UnsplashPhoto({
    required String url,
    required String photographer,
    required String link,
    required String blurHash,
  }) = _UnsplashPhoto;

  factory UnsplashPhoto.fromMap(String source) {
    final Map<String, dynamic> json = jsonDecode(source);
    return UnsplashPhoto(
      url: json['urls']['regular'],
      photographer: json['user']['username'],
      link: json['links']['html'],
      blurHash: json['blur_hash'],
    );
  }
}
