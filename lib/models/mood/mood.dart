import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:star_book/models/app.dart';
import 'package:star_book/packages/hive_collection.dart';

part 'mood.freezed.dart';
part 'mood.g.dart';

@freezed
@HiveType(typeId: HiveTypeIds.mood)
class Mood with _$Mood, HiveBaseModel {
  const Mood._();
  const factory Mood({
    @HiveField(0) @JsonKey(name: '_id') required final String id,
    @HiveField(1) required final String label,
    @HiveField(2) required final String color,
  }) = _Mood;

  factory Mood.fromJson(Map<String, dynamic> json) => _$MoodFromJson(json);

  factory Mood.initial() => const Mood(
        id: '',
        label: '',
        color: '',
      );

  String get key => id;
}
