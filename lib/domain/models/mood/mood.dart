import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:star_book/data/models/mood/mood.dart' as M;

part 'mood.freezed.dart';

@freezed
class Mood with _$Mood {
  const Mood._();
  const factory Mood({
    required final String id,
    required final String label,
    required final int color,
  }) = _Mood;

  factory Mood.initial() => const Mood(
        id: '',
        label: '',
        color: 0xFFFFFFFF,
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

@freezed
class MoodBody with _$MoodBody {
  const MoodBody._();
  const factory MoodBody({
    required final String label,
    required final int color,
  }) = _MoodBody;

  factory MoodBody.initial() => const MoodBody(
        label: '',
        color: 0xFFFFFFFF,
      );

  factory MoodBody.fromMood(Mood mood) => MoodBody(
        label: mood.label,
        color: mood.color,
      );

  factory MoodBody.fromLSMoodBody(M.MoodBody from) {
    return MoodBody(
      label: from.label,
      color: from.color,
    );
  }
}

extension XMoodBody on MoodBody {
  M.MoodBody get toLSMoodBody {
    return M.MoodBody(
      label: label,
      color: color,
    );
  }
}
