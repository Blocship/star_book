// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cubit_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CubitState<T> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(T value) loaded,
    required TResult Function(Exception exception) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(T value)? loaded,
    TResult? Function(Exception exception)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(T value)? loaded,
    TResult Function(Exception exception)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitialState<T> value) initial,
    required TResult Function(LoadingState<T> value) loading,
    required TResult Function(LoadedState<T> value) loaded,
    required TResult Function(ErrorState<T> value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InitialState<T> value)? initial,
    TResult? Function(LoadingState<T> value)? loading,
    TResult? Function(LoadedState<T> value)? loaded,
    TResult? Function(ErrorState<T> value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialState<T> value)? initial,
    TResult Function(LoadingState<T> value)? loading,
    TResult Function(LoadedState<T> value)? loaded,
    TResult Function(ErrorState<T> value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CubitStateCopyWith<T, $Res> {
  factory $CubitStateCopyWith(
          CubitState<T> value, $Res Function(CubitState<T>) then) =
      _$CubitStateCopyWithImpl<T, $Res, CubitState<T>>;
}

/// @nodoc
class _$CubitStateCopyWithImpl<T, $Res, $Val extends CubitState<T>>
    implements $CubitStateCopyWith<T, $Res> {
  _$CubitStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InitialStateCopyWith<T, $Res> {
  factory _$$InitialStateCopyWith(
          _$InitialState<T> value, $Res Function(_$InitialState<T>) then) =
      __$$InitialStateCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$InitialStateCopyWithImpl<T, $Res>
    extends _$CubitStateCopyWithImpl<T, $Res, _$InitialState<T>>
    implements _$$InitialStateCopyWith<T, $Res> {
  __$$InitialStateCopyWithImpl(
      _$InitialState<T> _value, $Res Function(_$InitialState<T>) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitialState<T> implements InitialState<T> {
  const _$InitialState();

  @override
  String toString() {
    return 'CubitState<$T>.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialState<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(T value) loaded,
    required TResult Function(Exception exception) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(T value)? loaded,
    TResult? Function(Exception exception)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(T value)? loaded,
    TResult Function(Exception exception)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitialState<T> value) initial,
    required TResult Function(LoadingState<T> value) loading,
    required TResult Function(LoadedState<T> value) loaded,
    required TResult Function(ErrorState<T> value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InitialState<T> value)? initial,
    TResult? Function(LoadingState<T> value)? loading,
    TResult? Function(LoadedState<T> value)? loaded,
    TResult? Function(ErrorState<T> value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialState<T> value)? initial,
    TResult Function(LoadingState<T> value)? loading,
    TResult Function(LoadedState<T> value)? loaded,
    TResult Function(ErrorState<T> value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class InitialState<T> implements CubitState<T> {
  const factory InitialState() = _$InitialState<T>;
}

/// @nodoc
abstract class _$$LoadingStateCopyWith<T, $Res> {
  factory _$$LoadingStateCopyWith(
          _$LoadingState<T> value, $Res Function(_$LoadingState<T>) then) =
      __$$LoadingStateCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$LoadingStateCopyWithImpl<T, $Res>
    extends _$CubitStateCopyWithImpl<T, $Res, _$LoadingState<T>>
    implements _$$LoadingStateCopyWith<T, $Res> {
  __$$LoadingStateCopyWithImpl(
      _$LoadingState<T> _value, $Res Function(_$LoadingState<T>) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadingState<T> implements LoadingState<T> {
  const _$LoadingState();

  @override
  String toString() {
    return 'CubitState<$T>.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingState<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(T value) loaded,
    required TResult Function(Exception exception) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(T value)? loaded,
    TResult? Function(Exception exception)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(T value)? loaded,
    TResult Function(Exception exception)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitialState<T> value) initial,
    required TResult Function(LoadingState<T> value) loading,
    required TResult Function(LoadedState<T> value) loaded,
    required TResult Function(ErrorState<T> value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InitialState<T> value)? initial,
    TResult? Function(LoadingState<T> value)? loading,
    TResult? Function(LoadedState<T> value)? loaded,
    TResult? Function(ErrorState<T> value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialState<T> value)? initial,
    TResult Function(LoadingState<T> value)? loading,
    TResult Function(LoadedState<T> value)? loaded,
    TResult Function(ErrorState<T> value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class LoadingState<T> implements CubitState<T> {
  const factory LoadingState() = _$LoadingState<T>;
}

/// @nodoc
abstract class _$$LoadedStateCopyWith<T, $Res> {
  factory _$$LoadedStateCopyWith(
          _$LoadedState<T> value, $Res Function(_$LoadedState<T>) then) =
      __$$LoadedStateCopyWithImpl<T, $Res>;
  @useResult
  $Res call({T value});
}

/// @nodoc
class __$$LoadedStateCopyWithImpl<T, $Res>
    extends _$CubitStateCopyWithImpl<T, $Res, _$LoadedState<T>>
    implements _$$LoadedStateCopyWith<T, $Res> {
  __$$LoadedStateCopyWithImpl(
      _$LoadedState<T> _value, $Res Function(_$LoadedState<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_$LoadedState<T>(
      freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class _$LoadedState<T> implements LoadedState<T> {
  const _$LoadedState(this.value);

  @override
  final T value;

  @override
  String toString() {
    return 'CubitState<$T>.loaded(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadedState<T> &&
            const DeepCollectionEquality().equals(other.value, value));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(value));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadedStateCopyWith<T, _$LoadedState<T>> get copyWith =>
      __$$LoadedStateCopyWithImpl<T, _$LoadedState<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(T value) loaded,
    required TResult Function(Exception exception) error,
  }) {
    return loaded(value);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(T value)? loaded,
    TResult? Function(Exception exception)? error,
  }) {
    return loaded?.call(value);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(T value)? loaded,
    TResult Function(Exception exception)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitialState<T> value) initial,
    required TResult Function(LoadingState<T> value) loading,
    required TResult Function(LoadedState<T> value) loaded,
    required TResult Function(ErrorState<T> value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InitialState<T> value)? initial,
    TResult? Function(LoadingState<T> value)? loading,
    TResult? Function(LoadedState<T> value)? loaded,
    TResult? Function(ErrorState<T> value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialState<T> value)? initial,
    TResult Function(LoadingState<T> value)? loading,
    TResult Function(LoadedState<T> value)? loaded,
    TResult Function(ErrorState<T> value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class LoadedState<T> implements CubitState<T> {
  const factory LoadedState(final T value) = _$LoadedState<T>;

  T get value;
  @JsonKey(ignore: true)
  _$$LoadedStateCopyWith<T, _$LoadedState<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ErrorStateCopyWith<T, $Res> {
  factory _$$ErrorStateCopyWith(
          _$ErrorState<T> value, $Res Function(_$ErrorState<T>) then) =
      __$$ErrorStateCopyWithImpl<T, $Res>;
  @useResult
  $Res call({Exception exception});
}

/// @nodoc
class __$$ErrorStateCopyWithImpl<T, $Res>
    extends _$CubitStateCopyWithImpl<T, $Res, _$ErrorState<T>>
    implements _$$ErrorStateCopyWith<T, $Res> {
  __$$ErrorStateCopyWithImpl(
      _$ErrorState<T> _value, $Res Function(_$ErrorState<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? exception = null,
  }) {
    return _then(_$ErrorState<T>(
      null == exception
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as Exception,
    ));
  }
}

/// @nodoc

class _$ErrorState<T> implements ErrorState<T> {
  const _$ErrorState(this.exception);

  @override
  final Exception exception;

  @override
  String toString() {
    return 'CubitState<$T>.error(exception: $exception)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorState<T> &&
            (identical(other.exception, exception) ||
                other.exception == exception));
  }

  @override
  int get hashCode => Object.hash(runtimeType, exception);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorStateCopyWith<T, _$ErrorState<T>> get copyWith =>
      __$$ErrorStateCopyWithImpl<T, _$ErrorState<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(T value) loaded,
    required TResult Function(Exception exception) error,
  }) {
    return error(exception);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(T value)? loaded,
    TResult? Function(Exception exception)? error,
  }) {
    return error?.call(exception);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(T value)? loaded,
    TResult Function(Exception exception)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(exception);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitialState<T> value) initial,
    required TResult Function(LoadingState<T> value) loading,
    required TResult Function(LoadedState<T> value) loaded,
    required TResult Function(ErrorState<T> value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InitialState<T> value)? initial,
    TResult? Function(LoadingState<T> value)? loading,
    TResult? Function(LoadedState<T> value)? loaded,
    TResult? Function(ErrorState<T> value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialState<T> value)? initial,
    TResult Function(LoadingState<T> value)? loading,
    TResult Function(LoadedState<T> value)? loaded,
    TResult Function(ErrorState<T> value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class ErrorState<T> implements CubitState<T> {
  const factory ErrorState(final Exception exception) = _$ErrorState<T>;

  Exception get exception;
  @JsonKey(ignore: true)
  _$$ErrorStateCopyWith<T, _$ErrorState<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
