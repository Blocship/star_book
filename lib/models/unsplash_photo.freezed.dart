// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'unsplash_photo.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$UnsplashPhotoTearOff {
  const _$UnsplashPhotoTearOff();

  _UnsplashPhoto call(
      {required String url,
      required String photographer,
      required String link,
      required String blurHash}) {
    return _UnsplashPhoto(
      url: url,
      photographer: photographer,
      link: link,
      blurHash: blurHash,
    );
  }
}

/// @nodoc
const $UnsplashPhoto = _$UnsplashPhotoTearOff();

/// @nodoc
mixin _$UnsplashPhoto {
  String get url => throw _privateConstructorUsedError;
  String get photographer => throw _privateConstructorUsedError;
  String get link => throw _privateConstructorUsedError;
  String get blurHash => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UnsplashPhotoCopyWith<UnsplashPhoto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnsplashPhotoCopyWith<$Res> {
  factory $UnsplashPhotoCopyWith(
          UnsplashPhoto value, $Res Function(UnsplashPhoto) then) =
      _$UnsplashPhotoCopyWithImpl<$Res>;
  $Res call({String url, String photographer, String link, String blurHash});
}

/// @nodoc
class _$UnsplashPhotoCopyWithImpl<$Res>
    implements $UnsplashPhotoCopyWith<$Res> {
  _$UnsplashPhotoCopyWithImpl(this._value, this._then);

  final UnsplashPhoto _value;
  // ignore: unused_field
  final $Res Function(UnsplashPhoto) _then;

  @override
  $Res call({
    Object? url = freezed,
    Object? photographer = freezed,
    Object? link = freezed,
    Object? blurHash = freezed,
  }) {
    return _then(_value.copyWith(
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      photographer: photographer == freezed
          ? _value.photographer
          : photographer // ignore: cast_nullable_to_non_nullable
              as String,
      link: link == freezed
          ? _value.link
          : link // ignore: cast_nullable_to_non_nullable
              as String,
      blurHash: blurHash == freezed
          ? _value.blurHash
          : blurHash // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$UnsplashPhotoCopyWith<$Res>
    implements $UnsplashPhotoCopyWith<$Res> {
  factory _$UnsplashPhotoCopyWith(
          _UnsplashPhoto value, $Res Function(_UnsplashPhoto) then) =
      __$UnsplashPhotoCopyWithImpl<$Res>;
  @override
  $Res call({String url, String photographer, String link, String blurHash});
}

/// @nodoc
class __$UnsplashPhotoCopyWithImpl<$Res>
    extends _$UnsplashPhotoCopyWithImpl<$Res>
    implements _$UnsplashPhotoCopyWith<$Res> {
  __$UnsplashPhotoCopyWithImpl(
      _UnsplashPhoto _value, $Res Function(_UnsplashPhoto) _then)
      : super(_value, (v) => _then(v as _UnsplashPhoto));

  @override
  _UnsplashPhoto get _value => super._value as _UnsplashPhoto;

  @override
  $Res call({
    Object? url = freezed,
    Object? photographer = freezed,
    Object? link = freezed,
    Object? blurHash = freezed,
  }) {
    return _then(_UnsplashPhoto(
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      photographer: photographer == freezed
          ? _value.photographer
          : photographer // ignore: cast_nullable_to_non_nullable
              as String,
      link: link == freezed
          ? _value.link
          : link // ignore: cast_nullable_to_non_nullable
              as String,
      blurHash: blurHash == freezed
          ? _value.blurHash
          : blurHash // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_UnsplashPhoto implements _UnsplashPhoto {
  const _$_UnsplashPhoto(
      {required this.url,
      required this.photographer,
      required this.link,
      required this.blurHash});

  @override
  final String url;
  @override
  final String photographer;
  @override
  final String link;
  @override
  final String blurHash;

  @override
  String toString() {
    return 'UnsplashPhoto(url: $url, photographer: $photographer, link: $link, blurHash: $blurHash)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UnsplashPhoto &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.photographer, photographer) ||
                other.photographer == photographer) &&
            (identical(other.link, link) || other.link == link) &&
            (identical(other.blurHash, blurHash) ||
                other.blurHash == blurHash));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, url, photographer, link, blurHash);

  @JsonKey(ignore: true)
  @override
  _$UnsplashPhotoCopyWith<_UnsplashPhoto> get copyWith =>
      __$UnsplashPhotoCopyWithImpl<_UnsplashPhoto>(this, _$identity);
}

abstract class _UnsplashPhoto implements UnsplashPhoto {
  const factory _UnsplashPhoto(
      {required String url,
      required String photographer,
      required String link,
      required String blurHash}) = _$_UnsplashPhoto;

  @override
  String get url;
  @override
  String get photographer;
  @override
  String get link;
  @override
  String get blurHash;
  @override
  @JsonKey(ignore: true)
  _$UnsplashPhotoCopyWith<_UnsplashPhoto> get copyWith =>
      throw _privateConstructorUsedError;
}
