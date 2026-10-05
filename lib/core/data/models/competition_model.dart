import 'package:talent_x/core/data/local/schemas/competition_schema.dart';
import 'package:talent_x/core/domain/entities/competitition.dart';

class CompetitionModel extends Competition {
  CompetitionModel({
    required super.id,
    required super.title,
    required super.category,
    required super.description,
    required super.imageUrl,
    required super.deadline,
  });

  factory CompetitionModel.fromFirestore(
    Map<String, dynamic> json,
    String docId,
  ) {
    return CompetitionModel(
      id: docId,
      title: json['title'] as String,
      category: json['category'] as String,
      description: json['description'] as String,
      imageUrl: json['imageUrl'] as String,
      deadline: json['deadline'] as String,
    );
  }

  Map<String, dynamic> toFirestore(){
    return{
      'id': id,
      'title': title,
      'category': category,
      'description': description,
      'imageUrl': imageUrl,
      'deadline': deadline,
    };
  }

  CompetitionSchema toSchema({bool isSynced = false}) {
    return CompetitionSchema()
      ..id = id
      ..title = title
      ..category = category
      ..description = description
      ..imageUrl = imageUrl
      ..deadline = deadline
      ..isSynced = isSynced;
  }

  factory CompetitionModel.fromSchema(CompetitionSchema schema) {
    return CompetitionModel(
      id: schema.id,
      title: schema.title,
      category: schema.category,
      description: schema.description,
      imageUrl: schema.imageUrl,
      deadline : schema.deadline
    );
  }
}
