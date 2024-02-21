// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'mood.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Mood {
  String get id => throw _privateConstructorUsedError;
  String get label => throw _privateConstructorUsedError;
  int get color => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MoodCopyWith<Mood> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MoodCopyWith<$Res> {
  factory $MoodCopyWith(Mood value, $Res Function(Mood) then) =
      _$MoodCopyWithImpl<$Res, Mood>;
  @useResult
  $Res call({String id, String label, int color});
}

/// @nodoc
class _$MoodCopyWithImpl<$Res, $Val extends Mood>
    implements $MoodCopyWith<$Res> {
  _$MoodCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? label = null,
    Object? color = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MoodCopyWith<$Res> implements $MoodCopyWith<$Res> {
  factory _$$_MoodCopyWith(_$_Mood value, $Res Function(_$_Mood) then) =
      __$$_MoodCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String label, int color});
}

/// @nodoc
class __$$_MoodCopyWithImpl<$Res> extends _$MoodCopyWithImpl<$Res, _$_Mood>
    implements _$$_MoodCopyWith<$Res> {
  __$$_MoodCopyWithImpl(_$_Mood _value, $Res Function(_$_Mood) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? label = null,
    Object? color = null,
  }) {
    return _then(_$_Mood(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_Mood extends _Mood {
  const _$_Mood({required this.id, required this.label, required this.color})
      : super._();

  @override
  final String id;
  @override
  final String label;
  @override
  final int color;

  @override
  String toString() {
    return 'Mood(id: $id, label: $label, color: $color)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Mood &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.color, color) || other.color == color));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, label, color);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MoodCopyWith<_$_Mood> get copyWith =>
      __$$_MoodCopyWithImpl<_$_Mood>(this, _$identity);
}

abstract class _Mood extends Mood {
  const factory _Mood(
      {required final String id,
      required final String label,
      required final int color}) = _$_Mood;
  const _Mood._() : super._();

  @override
  String get id;
  @override
  String get label;
  @override
  int get color;
  @override
  @JsonKey(ignore: true)
  _$$_MoodCopyWith<_$_Mood> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$MoodBody {
  String get label => throw _privateConstructorUsedError;
  int get color => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MoodBodyCopyWith<MoodBody> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MoodBodyCopyWith<$Res> {
  factory $MoodBodyCopyWith(MoodBody value, $Res Function(MoodBody) then) =
      _$MoodBodyCopyWithImpl<$Res, MoodBody>;
  @useResult
  $Res call({String label, int color});
}

/// @nodoc
class _$MoodBodyCopyWithImpl<$Res, $Val extends MoodBody>
    implements $MoodBodyCopyWith<$Res> {
  _$MoodBodyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? label = null,
    Object? color = null,
  }) {
    return _then(_value.copyWith(
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MoodBodyCopyWith<$Res> implements $MoodBodyCopyWith<$Res> {
  factory _$$_MoodBodyCopyWith(
          _$_MoodBody value, $Res Function(_$_MoodBody) then) =
      __$$_MoodBodyCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String label, int color});
}

/// @nodoc
class __$$_MoodBodyCopyWithImpl<$Res>
    extends _$MoodBodyCopyWithImpl<$Res, _$_MoodBody>
    implements _$$_MoodBodyCopyWith<$Res> {
  __$$_MoodBodyCopyWithImpl(
      _$_MoodBody _value, $Res Function(_$_MoodBody) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? label = null,
    Object? color = null,
  }) {
    return _then(_$_MoodBody(
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_MoodBody extends _MoodBody {
  const _$_MoodBody({required this.label, required this.color}) : super._();

  @override
  final String label;
  @override
  final int color;

  @override
  String toString() {
    return 'MoodBody(label: $label, color: $color)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MoodBody &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.color, color) || other.color == color));
  }

  @override
  int get hashCode => Object.hash(runtimeType, label, color);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MoodBodyCopyWith<_$_MoodBody> get copyWith =>
      __$$_MoodBodyCopyWithImpl<_$_MoodBody>(this, _$identity);
}

abstract class _MoodBody extends MoodBody {
  const factory _MoodBody(
      {required final String label, required final int color}) = _$_MoodBody;
  const _MoodBody._() : super._();

  @override
  String get label;
  @override
  int get color;
  @override
  @JsonKey(ignore: true)
  _$$_MoodBodyCopyWith<_$_MoodBody> get copyWith =>
      throw _privateConstructorUsedError;
}
