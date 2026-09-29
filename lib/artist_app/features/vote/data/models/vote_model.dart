import 'package:talent_x/artist_app/features/vote/domain/entities/vote.dart';

class CandidateModel extends Candidate {
  const CandidateModel({
    required super.id,
    required super.name,
    required super.role,
    required super.imageUrl,
  });

  factory CandidateModel.fromJson(Map<String, dynamic> json) {
    return CandidateModel(
      id: json['id'],
      name: json['name'],
      role: json['role'],
      imageUrl: json['imageUrl'],
    );
  }
}
