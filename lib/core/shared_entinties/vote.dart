import 'package:freezed_annotation/freezed_annotation.dart';

part 'vote.freezed.dart';
part 'vote.g.dart';

@freezed
abstract class Vote with _$Vote {
  const factory Vote({
    required String id,
    required String competitionId,
    required String voterId,
    required String targetEntryId,
    @Default(2) int txPoints,
    required DateTime createdAt,
  }) = _Vote;

  factory Vote.fromJson(Map<String, dynamic> json) => _$VoteFromJson(json);
}
