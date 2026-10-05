import 'package:freezed_annotation/freezed_annotation.dart';

part 'competition.freezed.dart';
part 'competition.g.dart';

@freezed
abstract class Competition with _$Competition {
  const factory Competition({
    required String id,
    required String title,
    required String subtitle,
    required String description,
    required String category, // 'danse', 'chant', 'dessin'
    required bool isBigEvent,
    required String status, // 'draft', 'open', 'jury_phase', 'closed'
    required DateTime entryDeadline,
    required DateTime endDate,
  }) = _Competition;

  factory Competition.fromJson(Map<String, dynamic> json) =>
      _$CompetitionFromJson(json);
}
