// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'journal_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$JournalState {
  List<Journal> get journals => throw _privateConstructorUsedError;
  DateTime get selectedDate => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $JournalStateCopyWith<JournalState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $JournalStateCopyWith<$Res> {
  factory $JournalStateCopyWith(
          JournalState value, $Res Function(JournalState) then) =
      _$JournalStateCopyWithImpl<$Res, JournalState>;
  @useResult
  $Res call({List<Journal> journals, DateTime selectedDate});
}

/// @nodoc
class _$JournalStateCopyWithImpl<$Res, $Val extends JournalState>
    implements $JournalStateCopyWith<$Res> {
  _$JournalStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? journals = null,
    Object? selectedDate = null,
  }) {
    return _then(_value.copyWith(
      journals: null == journals
          ? _value.journals
          : journals // ignore: cast_nullable_to_non_nullable
              as List<Journal>,
      selectedDate: null == selectedDate
          ? _value.selectedDate
          : selectedDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_JournalStateCopyWith<$Res>
    implements $JournalStateCopyWith<$Res> {
  factory _$$_JournalStateCopyWith(
          _$_JournalState value, $Res Function(_$_JournalState) then) =
      __$$_JournalStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Journal> journals, DateTime selectedDate});
}

/// @nodoc
class __$$_JournalStateCopyWithImpl<$Res>
    extends _$JournalStateCopyWithImpl<$Res, _$_JournalState>
    implements _$$_JournalStateCopyWith<$Res> {
  __$$_JournalStateCopyWithImpl(
      _$_JournalState _value, $Res Function(_$_JournalState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? journals = null,
    Object? selectedDate = null,
  }) {
    return _then(_$_JournalState(
      journals: null == journals
          ? _value._journals
          : journals // ignore: cast_nullable_to_non_nullable
              as List<Journal>,
      selectedDate: null == selectedDate
          ? _value.selectedDate
          : selectedDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$_JournalState implements _JournalState {
  _$_JournalState(
      {required final List<Journal> journals, required this.selectedDate})
      : _journals = journals;

  final List<Journal> _journals;
  @override
  List<Journal> get journals {
    if (_journals is EqualUnmodifiableListView) return _journals;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_journals);
  }

  @override
  final DateTime selectedDate;

  @override
  String toString() {
    return 'JournalState(journals: $journals, selectedDate: $selectedDate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_JournalState &&
            const DeepCollectionEquality().equals(other._journals, _journals) &&
            (identical(other.selectedDate, selectedDate) ||
                other.selectedDate == selectedDate));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_journals), selectedDate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_JournalStateCopyWith<_$_JournalState> get copyWith =>
      __$$_JournalStateCopyWithImpl<_$_JournalState>(this, _$identity);
}

abstract class _JournalState implements JournalState {
  factory _JournalState(
      {required final List<Journal> journals,
      required final DateTime selectedDate}) = _$_JournalState;

  @override
  List<Journal> get journals;
  @override
  DateTime get selectedDate;
  @override
  @JsonKey(ignore: true)
  _$$_JournalStateCopyWith<_$_JournalState> get copyWith =>
      throw _privateConstructorUsedError;
}
