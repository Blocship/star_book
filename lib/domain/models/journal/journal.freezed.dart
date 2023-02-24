// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'journal.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Journal {
  String get id => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;
  Mood get mood => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get memo => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $JournalCopyWith<Journal> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $JournalCopyWith<$Res> {
  factory $JournalCopyWith(Journal value, $Res Function(Journal) then) =
      _$JournalCopyWithImpl<$Res, Journal>;
  @useResult
  $Res call(
      {String id,
      DateTime createdAt,
      DateTime updatedAt,
      Mood mood,
      String title,
      String memo});

  $MoodCopyWith<$Res> get mood;
}

/// @nodoc
class _$JournalCopyWithImpl<$Res, $Val extends Journal>
    implements $JournalCopyWith<$Res> {
  _$JournalCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? mood = null,
    Object? title = null,
    Object? memo = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      mood: null == mood
          ? _value.mood
          : mood // ignore: cast_nullable_to_non_nullable
              as Mood,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      memo: null == memo
          ? _value.memo
          : memo // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $MoodCopyWith<$Res> get mood {
    return $MoodCopyWith<$Res>(_value.mood, (value) {
      return _then(_value.copyWith(mood: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_JournalCopyWith<$Res> implements $JournalCopyWith<$Res> {
  factory _$$_JournalCopyWith(
          _$_Journal value, $Res Function(_$_Journal) then) =
      __$$_JournalCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      DateTime createdAt,
      DateTime updatedAt,
      Mood mood,
      String title,
      String memo});

  @override
  $MoodCopyWith<$Res> get mood;
}

/// @nodoc
class __$$_JournalCopyWithImpl<$Res>
    extends _$JournalCopyWithImpl<$Res, _$_Journal>
    implements _$$_JournalCopyWith<$Res> {
  __$$_JournalCopyWithImpl(_$_Journal _value, $Res Function(_$_Journal) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? mood = null,
    Object? title = null,
    Object? memo = null,
  }) {
    return _then(_$_Journal(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      mood: null == mood
          ? _value.mood
          : mood // ignore: cast_nullable_to_non_nullable
              as Mood,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      memo: null == memo
          ? _value.memo
          : memo // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_Journal extends _Journal {
  const _$_Journal(
      {required this.id,
      required this.createdAt,
      required this.updatedAt,
      required this.mood,
      required this.title,
      required this.memo})
      : super._();

  @override
  final String id;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;
  @override
  final Mood mood;
  @override
  final String title;
  @override
  final String memo;

  @override
  String toString() {
    return 'Journal(id: $id, createdAt: $createdAt, updatedAt: $updatedAt, mood: $mood, title: $title, memo: $memo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Journal &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.mood, mood) || other.mood == mood) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.memo, memo) || other.memo == memo));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, id, createdAt, updatedAt, mood, title, memo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_JournalCopyWith<_$_Journal> get copyWith =>
      __$$_JournalCopyWithImpl<_$_Journal>(this, _$identity);
}

abstract class _Journal extends Journal {
  const factory _Journal(
      {required final String id,
      required final DateTime createdAt,
      required final DateTime updatedAt,
      required final Mood mood,
      required final String title,
      required final String memo}) = _$_Journal;
  const _Journal._() : super._();

  @override
  String get id;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;
  @override
  Mood get mood;
  @override
  String get title;
  @override
  String get memo;
  @override
  @JsonKey(ignore: true)
  _$$_JournalCopyWith<_$_Journal> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$JournalBody {
  Mood get mood => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  String get memo => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $JournalBodyCopyWith<JournalBody> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $JournalBodyCopyWith<$Res> {
  factory $JournalBodyCopyWith(
          JournalBody value, $Res Function(JournalBody) then) =
      _$JournalBodyCopyWithImpl<$Res, JournalBody>;
  @useResult
  $Res call({Mood mood, String title, DateTime? createdAt, String memo});

  $MoodCopyWith<$Res> get mood;
}

/// @nodoc
class _$JournalBodyCopyWithImpl<$Res, $Val extends JournalBody>
    implements $JournalBodyCopyWith<$Res> {
  _$JournalBodyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mood = null,
    Object? title = null,
    Object? createdAt = freezed,
    Object? memo = null,
  }) {
    return _then(_value.copyWith(
      mood: null == mood
          ? _value.mood
          : mood // ignore: cast_nullable_to_non_nullable
              as Mood,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      memo: null == memo
          ? _value.memo
          : memo // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $MoodCopyWith<$Res> get mood {
    return $MoodCopyWith<$Res>(_value.mood, (value) {
      return _then(_value.copyWith(mood: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_JournalBodyCopyWith<$Res>
    implements $JournalBodyCopyWith<$Res> {
  factory _$$_JournalBodyCopyWith(
          _$_JournalBody value, $Res Function(_$_JournalBody) then) =
      __$$_JournalBodyCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Mood mood, String title, DateTime? createdAt, String memo});

  @override
  $MoodCopyWith<$Res> get mood;
}

/// @nodoc
class __$$_JournalBodyCopyWithImpl<$Res>
    extends _$JournalBodyCopyWithImpl<$Res, _$_JournalBody>
    implements _$$_JournalBodyCopyWith<$Res> {
  __$$_JournalBodyCopyWithImpl(
      _$_JournalBody _value, $Res Function(_$_JournalBody) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mood = null,
    Object? title = null,
    Object? createdAt = freezed,
    Object? memo = null,
  }) {
    return _then(_$_JournalBody(
      mood: null == mood
          ? _value.mood
          : mood // ignore: cast_nullable_to_non_nullable
              as Mood,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      memo: null == memo
          ? _value.memo
          : memo // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_JournalBody extends _JournalBody {
  const _$_JournalBody(
      {required this.mood,
      required this.title,
      this.createdAt,
      required this.memo})
      : super._();

  @override
  final Mood mood;
  @override
  final String title;
  @override
  final DateTime? createdAt;
  @override
  final String memo;

  @override
  String toString() {
    return 'JournalBody(mood: $mood, title: $title, createdAt: $createdAt, memo: $memo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_JournalBody &&
            (identical(other.mood, mood) || other.mood == mood) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.memo, memo) || other.memo == memo));
  }

  @override
  int get hashCode => Object.hash(runtimeType, mood, title, createdAt, memo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_JournalBodyCopyWith<_$_JournalBody> get copyWith =>
      __$$_JournalBodyCopyWithImpl<_$_JournalBody>(this, _$identity);
}

abstract class _JournalBody extends JournalBody {
  const factory _JournalBody(
      {required final Mood mood,
      required final String title,
      final DateTime? createdAt,
      required final String memo}) = _$_JournalBody;
  const _JournalBody._() : super._();

  @override
  Mood get mood;
  @override
  String get title;
  @override
  DateTime? get createdAt;
  @override
  String get memo;
  @override
  @JsonKey(ignore: true)
  _$$_JournalBodyCopyWith<_$_JournalBody> get copyWith =>
      throw _privateConstructorUsedError;
}
