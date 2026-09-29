import '../../domain/entities/vote.dart';

class CandidateModel extends Candidate {
  CandidateModel({
    required super.id,
    required super.name,
    required super.role,
    required super.imageUrl,
  });

  factory CandidateModel.fromJson(Map<String, dynamic> json) {
    return CandidateModel(
      id: json['id'] as String,
      name: json['name'] as String,
      role: json['role'] as String,
      imageUrl: json['imageUrl'] as String? ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'role': role,
      'imageUrl': imageUrl,
    };
  }
}
