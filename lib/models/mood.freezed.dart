// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'mood.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$MoodTearOff {
  const _$MoodTearOff();

  _Mood call(
      {@HiveField(0) required int id,
      @HiveField(1) required String label,
      @HiveField(2) required int colorCode}) {
    return _Mood(
      id: id,
      label: label,
      colorCode: colorCode,
    );
  }
}

/// @nodoc
const $Mood = _$MoodTearOff();

/// @nodoc
mixin _$Mood {
  @HiveField(0)
  int get id => throw _privateConstructorUsedError;
  @HiveField(1)
  String get label => throw _privateConstructorUsedError;
  @HiveField(2)
  int get colorCode => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MoodCopyWith<Mood> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MoodCopyWith<$Res> {
  factory $MoodCopyWith(Mood value, $Res Function(Mood) then) =
      _$MoodCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(0) int id,
      @HiveField(1) String label,
      @HiveField(2) int colorCode});
}

/// @nodoc
class _$MoodCopyWithImpl<$Res> implements $MoodCopyWith<$Res> {
  _$MoodCopyWithImpl(this._value, this._then);

  final Mood _value;
  // ignore: unused_field
  final $Res Function(Mood) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? label = freezed,
    Object? colorCode = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      label: label == freezed
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      colorCode: colorCode == freezed
          ? _value.colorCode
          : colorCode // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$MoodCopyWith<$Res> implements $MoodCopyWith<$Res> {
  factory _$MoodCopyWith(_Mood value, $Res Function(_Mood) then) =
      __$MoodCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(0) int id,
      @HiveField(1) String label,
      @HiveField(2) int colorCode});
}

/// @nodoc
class __$MoodCopyWithImpl<$Res> extends _$MoodCopyWithImpl<$Res>
    implements _$MoodCopyWith<$Res> {
  __$MoodCopyWithImpl(_Mood _value, $Res Function(_Mood) _then)
      : super(_value, (v) => _then(v as _Mood));

  @override
  _Mood get _value => super._value as _Mood;

  @override
  $Res call({
    Object? id = freezed,
    Object? label = freezed,
    Object? colorCode = freezed,
  }) {
    return _then(_Mood(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      label: label == freezed
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      colorCode: colorCode == freezed
          ? _value.colorCode
          : colorCode // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

@HiveType(typeId: kMoodTypeId, adapterName: 'MoodAdapter')
class _$_Mood implements _Mood {
  const _$_Mood(
      {@HiveField(0) required this.id,
      @HiveField(1) required this.label,
      @HiveField(2) required this.colorCode});

  @override
  @HiveField(0)
  final int id;
  @override
  @HiveField(1)
  final String label;
  @override
  @HiveField(2)
  final int colorCode;

  @override
  String toString() {
    return 'Mood(id: $id, label: $label, colorCode: $colorCode)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Mood &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.colorCode, colorCode) ||
                other.colorCode == colorCode));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, label, colorCode);

  @JsonKey(ignore: true)
  @override
  _$MoodCopyWith<_Mood> get copyWith =>
      __$MoodCopyWithImpl<_Mood>(this, _$identity);
}

abstract class _Mood implements Mood {
  const factory _Mood(
      {@HiveField(0) required int id,
      @HiveField(1) required String label,
      @HiveField(2) required int colorCode}) = _$_Mood;

  @override
  @HiveField(0)
  int get id;
  @override
  @HiveField(1)
  String get label;
  @override
  @HiveField(2)
  int get colorCode;
  @override
  @JsonKey(ignore: true)
  _$MoodCopyWith<_Mood> get copyWith => throw _privateConstructorUsedError;
}
