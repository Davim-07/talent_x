import 'package:talent_x/core/domain/entities/artist.dart';
import 'package:talent_x/core/data/local/schemas/artist_schema.dart';

class ArtistModel extends Artist {
  ArtistModel({
    required super.id,
    required super.name,
    required super.imageUrl,
    required super.category,
  });

  // 1. Depuis Firestore -> ArtistModel (avec fallbacks sécurisés)
  factory ArtistModel.fromFirestore(Map<String, dynamic> json, String docId) {
    return ArtistModel(
      id: (json['id'] as String?) ?? docId,
      name: (json['name'] as String?) ?? 'Artiste sans nom',
      imageUrl: (json['imageUrl'] as String?) ?? '',
      category: (json['category'] as String?) ?? 'Général',
    );
  }

  // 2. Depuis Schema Isar -> ArtistModel
  factory ArtistModel.fromSchema(ArtistSchema schema) {
    return ArtistModel(
      id: schema.id,
      name: schema.name,
      imageUrl: schema.imageUrl,
      category: schema.category,
    );
  }

  // 3. ArtistModel -> Map Firestore
  Map<String, dynamic> toFirestore() {
    return {
      'id': id,
      'name': name,
      'imageUrl': imageUrl,
      'category': category,
    };
  }

  // 4. ArtistModel -> Schéma Isar
  ArtistSchema toSchema({bool isSynced = false}) {
    return ArtistSchema()
      ..id = id
      ..name = name
      ..imageUrl = imageUrl
      ..category = category
      ..isSynced = isSynced;
  }
}
