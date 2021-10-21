// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'activity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ActivityTearOff {
  const _$ActivityTearOff();

  _Activity call(
      {@HiveField(0) int? id,
      @HiveField(1) required int day,
      @HiveField(2) required int month,
      @HiveField(3) required int year,
      @HiveField(4) int? moodId,
      @HiveField(5) String? title,
      @HiveField(6) String? note}) {
    return _Activity(
      id: id,
      day: day,
      month: month,
      year: year,
      moodId: moodId,
      title: title,
      note: note,
    );
  }
}

/// @nodoc
const $Activity = _$ActivityTearOff();

/// @nodoc
mixin _$Activity {
  @HiveField(0)
  int? get id => throw _privateConstructorUsedError;
  @HiveField(1)
  int get day => throw _privateConstructorUsedError;
  @HiveField(2)
  int get month => throw _privateConstructorUsedError;
  @HiveField(3)
  int get year => throw _privateConstructorUsedError;
  @HiveField(4)
  int? get moodId => throw _privateConstructorUsedError;
  @HiveField(5)
  String? get title => throw _privateConstructorUsedError;
  @HiveField(6)
  String? get note => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ActivityCopyWith<Activity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ActivityCopyWith<$Res> {
  factory $ActivityCopyWith(Activity value, $Res Function(Activity) then) =
      _$ActivityCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(0) int? id,
      @HiveField(1) int day,
      @HiveField(2) int month,
      @HiveField(3) int year,
      @HiveField(4) int? moodId,
      @HiveField(5) String? title,
      @HiveField(6) String? note});
}

/// @nodoc
class _$ActivityCopyWithImpl<$Res> implements $ActivityCopyWith<$Res> {
  _$ActivityCopyWithImpl(this._value, this._then);

  final Activity _value;
  // ignore: unused_field
  final $Res Function(Activity) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? day = freezed,
    Object? month = freezed,
    Object? year = freezed,
    Object? moodId = freezed,
    Object? title = freezed,
    Object? note = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      day: day == freezed
          ? _value.day
          : day // ignore: cast_nullable_to_non_nullable
              as int,
      month: month == freezed
          ? _value.month
          : month // ignore: cast_nullable_to_non_nullable
              as int,
      year: year == freezed
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as int,
      moodId: moodId == freezed
          ? _value.moodId
          : moodId // ignore: cast_nullable_to_non_nullable
              as int?,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      note: note == freezed
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$ActivityCopyWith<$Res> implements $ActivityCopyWith<$Res> {
  factory _$ActivityCopyWith(_Activity value, $Res Function(_Activity) then) =
      __$ActivityCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(0) int? id,
      @HiveField(1) int day,
      @HiveField(2) int month,
      @HiveField(3) int year,
      @HiveField(4) int? moodId,
      @HiveField(5) String? title,
      @HiveField(6) String? note});
}

/// @nodoc
class __$ActivityCopyWithImpl<$Res> extends _$ActivityCopyWithImpl<$Res>
    implements _$ActivityCopyWith<$Res> {
  __$ActivityCopyWithImpl(_Activity _value, $Res Function(_Activity) _then)
      : super(_value, (v) => _then(v as _Activity));

  @override
  _Activity get _value => super._value as _Activity;

  @override
  $Res call({
    Object? id = freezed,
    Object? day = freezed,
    Object? month = freezed,
    Object? year = freezed,
    Object? moodId = freezed,
    Object? title = freezed,
    Object? note = freezed,
  }) {
    return _then(_Activity(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      day: day == freezed
          ? _value.day
          : day // ignore: cast_nullable_to_non_nullable
              as int,
      month: month == freezed
          ? _value.month
          : month // ignore: cast_nullable_to_non_nullable
              as int,
      year: year == freezed
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as int,
      moodId: moodId == freezed
          ? _value.moodId
          : moodId // ignore: cast_nullable_to_non_nullable
              as int?,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      note: note == freezed
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@HiveType(typeId: kActivityTypeId, adapterName: 'ActivityAdapter')
class _$_Activity extends _Activity {
  const _$_Activity(
      {@HiveField(0) this.id,
      @HiveField(1) required this.day,
      @HiveField(2) required this.month,
      @HiveField(3) required this.year,
      @HiveField(4) this.moodId,
      @HiveField(5) this.title,
      @HiveField(6) this.note})
      : super._();

  @override
  @HiveField(0)
  final int? id;
  @override
  @HiveField(1)
  final int day;
  @override
  @HiveField(2)
  final int month;
  @override
  @HiveField(3)
  final int year;
  @override
  @HiveField(4)
  final int? moodId;
  @override
  @HiveField(5)
  final String? title;
  @override
  @HiveField(6)
  final String? note;

  @override
  String toString() {
    return 'Activity(id: $id, day: $day, month: $month, year: $year, moodId: $moodId, title: $title, note: $note)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Activity &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.day, day) || other.day == day) &&
            (identical(other.month, month) || other.month == month) &&
            (identical(other.year, year) || other.year == year) &&
            (identical(other.moodId, moodId) || other.moodId == moodId) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.note, note) || other.note == note));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, id, day, month, year, moodId, title, note);

  @JsonKey(ignore: true)
  @override
  _$ActivityCopyWith<_Activity> get copyWith =>
      __$ActivityCopyWithImpl<_Activity>(this, _$identity);
}

abstract class _Activity extends Activity {
  const factory _Activity(
      {@HiveField(0) int? id,
      @HiveField(1) required int day,
      @HiveField(2) required int month,
      @HiveField(3) required int year,
      @HiveField(4) int? moodId,
      @HiveField(5) String? title,
      @HiveField(6) String? note}) = _$_Activity;
  const _Activity._() : super._();

  @override
  @HiveField(0)
  int? get id;
  @override
  @HiveField(1)
  int get day;
  @override
  @HiveField(2)
  int get month;
  @override
  @HiveField(3)
  int get year;
  @override
  @HiveField(4)
  int? get moodId;
  @override
  @HiveField(5)
  String? get title;
  @override
  @HiveField(6)
  String? get note;
  @override
  @JsonKey(ignore: true)
  _$ActivityCopyWith<_Activity> get copyWith =>
      throw _privateConstructorUsedError;
}
