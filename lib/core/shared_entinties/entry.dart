import 'package:freezed_annotation/freezed_annotation.dart';

part 'entry.freezed.dart';
part 'entry.g.dart';

@freezed
abstract class Entry with _$Entry {
  const factory Entry({
    required String id,
    required String competitionId,
    required String artistId,
    required String mediaUrl,
    @Default(true) bool isAnonymous,
    @Default(false) bool aiFlagged,
    @Default(0) int artistVotesCount,
    double? juryScore,
  }) = _Entry;

  factory Entry.fromJson(Map<String, dynamic> json) => _$EntryFromJson(json);
}
