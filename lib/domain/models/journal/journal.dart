import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:star_book/data/models/journal/journal.dart' as J;
import 'package:star_book/domain/models/mood/mood.dart';

part 'journal.freezed.dart';

@freezed
class Journal with _$Journal {
  const Journal._();
  const factory Journal({
    required final String id,
    required final DateTime createdAt,
    required final DateTime updatedAt,
    required final Mood mood,
    required final String title,
    required final String memo,
  }) = _Journal;

  factory Journal.initial() => Journal(
        id: '',
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        mood: Mood.initial(),
        title: '',
        memo: '',
      );

  factory Journal.fromLSJournal(
    J.Journal from,
  ) {
    return Journal(
      id: from.id,
      createdAt: from.createdAt,
      updatedAt: from.updatedAt,
      mood: Mood.fromLSMood(from.mood),
      title: from.title,
      memo: from.memo,
    );
  }
}

extension XJournal on Journal {
  J.Journal get toLSJournal {
    var journal = J.Journal(
        id: id,
        createdAt: createdAt,
        updatedAt: updatedAt,
        title: title,
        memo: memo);
    journal.mood = mood.toLSMood;
    return journal;
  }
}
