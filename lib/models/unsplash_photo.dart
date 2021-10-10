import 'dart:convert';

/// If you think as relational database then it is the name of [UnsplashPhoto] table.

/// UnSplashPhoto Table
///
/// If you think as relational database,
/// [url], [photographer], [link] and [blurhash]
/// are table column names
// 5
class UnsplashPhoto {
  final String url;
  final String photographer;
  final String link;
  final String blurhash;
  UnsplashPhoto({
    required this.url,
    required this.photographer,
    required this.link,
    required this.blurhash,
  });

  factory UnsplashPhoto.fromJson(String source) => UnsplashPhoto.fromMap(json.decode(source));

  // Map<String, dynamic> toMap() {
  //   return {
  //     'url': url,
  //     'photographer': photographer,
  //     'link': link,
  //     'blurhash': blurhash,
  //   };
  // }

  factory UnsplashPhoto.fromMap(Map<String, dynamic> map) {
    return UnsplashPhoto(
      url: map['urls']['regular'],
      photographer: map['user']['username'],
      link: map['links']['html'],
      blurhash: map['blur_hash'],
    );
  }

  // String toJson() => json.encode(toMap());

  @override
  int get hashCode {
    return url.hashCode ^ photographer.hashCode ^ link.hashCode ^ blurhash.hashCode;
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is UnsplashPhoto && o.url == url && o.photographer == photographer && o.link == link && o.blurhash == blurhash;
  }

  UnsplashPhoto copyWith({
    String? url,
    String? photographer,
    String? link,
    String? blurhash,
  }) {
    return UnsplashPhoto(
      url: url ?? this.url,
      photographer: photographer ?? this.photographer,
      link: link ?? this.link,
      blurhash: blurhash ?? this.blurhash,
    );
  }

  @override
  String toString() {
    return '{\n url: $url,\n photographer: $photographer,\n link: $link,\n blurhash: $blurhash, \n}';
  }
}
