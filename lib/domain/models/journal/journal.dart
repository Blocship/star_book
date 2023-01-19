import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:star_book/data/models/journal/journal.dart' as J;

part 'journal.freezed.dart';

@freezed
class Journal with _$Journal {
  const Journal._();
  const factory Journal({
    required final String id,
    required final DateTime createdAt,
    required final DateTime updatedAt,
    required final List<String> mood,
    required final String title,
    required final String memo,
  }) = _Journal;

  factory Journal.initial() => Journal(
        id: '',
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        mood: ['happy'],
        title: '',
        memo: '',
      );

  factory Journal.fromLSJournal(J.Journal from) {
    return Journal(
      id: from.id,
      createdAt: from.createdAt,
      updatedAt: from.updatedAt,
      mood: from.mood,
      title: from.title,
      memo: from.memo,
    );
  }
}

extension XJournal on Journal {
  J.Journal get toLSJournal {
    return J.Journal(
        id: id,
        createdAt: createdAt,
        updatedAt: updatedAt,
        mood: mood,
        title: title,
        memo: memo);
  }
}
