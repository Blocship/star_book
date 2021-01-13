import 'dart:convert';

class UnsplashPhoto {
  String url;
  String photographer;
  String link;
  String blurhash;
  UnsplashPhoto({
    this.url,
    this.photographer,
    this.link,
    this.blurhash,
  });

  UnsplashPhoto copyWith({
    String url,
    String photographer,
    String link,
    String blurhash,
  }) {
    return UnsplashPhoto(
      url: url ?? this.url,
      photographer: photographer ?? this.photographer,
      link: link ?? this.link,
      blurhash: blurhash ?? this.blurhash,
    );
  }

  // Map<String, dynamic> toMap() {
  //   return {
  //     'url': url,
  //     'photographer': photographer,
  //     'link': link,
  //     'blurhash': blurhash,
  //   };
  // }

  factory UnsplashPhoto.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return UnsplashPhoto(
      url: map['urls']['regular'],
      photographer: map['user']['username'],
      link: map['links']['html'],
      blurhash: map['blur_hash'],
    );
  }

  // String toJson() => json.encode(toMap());

  factory UnsplashPhoto.fromJson(String source) =>
      UnsplashPhoto.fromMap(json.decode(source));

  @override
  String toString() {
    return '{\n url: $url,\n photographer: $photographer,\n link: $link,\n blurhash: $blurhash\n}';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is UnsplashPhoto &&
        o.url == url &&
        o.photographer == photographer &&
        o.link == link &&
        o.blurhash == blurhash;
  }

  @override
  int get hashCode {
    return url.hashCode ^
        photographer.hashCode ^
        link.hashCode ^
        blurhash.hashCode;
  }
}
