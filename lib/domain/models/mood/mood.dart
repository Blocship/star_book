import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:star_book/data/models/mood/mood.dart' as M;

part 'mood.freezed.dart';

@freezed
class Mood with _$Mood {
  const Mood._();
  const factory Mood({
    required final String id,
    required final String label,
    required final String color,
  }) = _Mood;

  factory Mood.initial() => const Mood(
        id: '',
        label: '',
        color: '',
      );

  factory Mood.fromLSMood(M.Mood from) {
    return Mood(
      id: from.id,
      label: from.label,
      color: from.color,
    );
  }
}

extension XMood on Mood {
  M.Mood get toLSMood {
    return M.Mood(
      id: id,
      label: label,
      color: color,
    );
  }
}
