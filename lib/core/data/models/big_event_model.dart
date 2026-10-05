import 'package:talent_x/core/data/local/schemas/big_event_schema.dart';
import 'package:talent_x/core/domain/entities/big_event.dart';

class BigEventModel extends BigEvent {
  BigEventModel({
    required super.title,
    required super.subtitle,
    required super.imageUrl,
  });

  factory BigEventModel.fromFirestore(Map<String, dynamic> json, String docId) {
    return BigEventModel(
      title: json['title'],
      subtitle: json['subtitle'],
      imageUrl: json['imageUrl'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'title': title,
      'subtitle': subtitle,
      'imageUrl': imageUrl,
    };
  }

  BigEventSchema toSchema({bool isSynced = false}) {
    return BigEventSchema()
      ..title = title
      ..subtitle = subtitle
      ..imageUrl = imageUrl
      ..isSynced = isSynced;
  }

  factory BigEventModel.fromSchema(BigEventSchema schema) {
    return BigEventModel(
      title: schema.title,
      subtitle: schema.subtitle,
      imageUrl: schema.imageUrl,
    );
  }
}
