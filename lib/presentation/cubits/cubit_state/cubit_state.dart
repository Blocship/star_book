import 'package:freezed_annotation/freezed_annotation.dart';

part 'cubit_state.freezed.dart';

@freezed
class CubitState<T> with _$CubitState<T> {
  const factory CubitState.initial() = InitialState<T>;
  const factory CubitState.loading() = LoadingState<T>;
  const factory CubitState.loaded(T value) = LoadedState<T>;
  const factory CubitState.error(Exception exception) = ErrorState<T>;
}
