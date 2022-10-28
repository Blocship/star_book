import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:star_book/models/app.dart';
import 'package:star_book/packages/hive_collection.dart';
part 'journal.freezed.dart';
part 'journal.g.dart';

@freezed
@HiveType(typeId: HiveTypeIds.journal)
class Journal with _$Journal, HiveBaseModel {
  const Journal._();
  const factory Journal({
    @HiveField(0) @JsonKey(name: '_id') required final String id,
    @HiveField(1) required final DateTime createdAt,
    @HiveField(2) required final DateTime updatedAt,
    @HiveField(3) required final List<String> mood,
    @HiveField(4) required final String title,
    @HiveField(5) required final String memo,
  }) = _Journal;

  factory Journal.fromJson(Map<String, dynamic> json) => _$JournalFromJson(json);

  factory Journal.initial() => Journal(
        id: '',
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        mood: ['happy'],
        title: '',
        memo: '',
      );

  String get key => id;
}
