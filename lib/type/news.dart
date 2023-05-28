import 'dart:convert';

class AiNewsType {
  String id;
  int datetime;
  Metadata metadata;
  String thumbnail;
  String icon;

  AiNewsType({
    required this.id,
    required this.datetime,
    required this.metadata,
    required this.thumbnail,
    required this.icon,
  });

  factory AiNewsType.fromRawJson(String str) =>
      AiNewsType.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AiNewsType.fromJson(Map<String, dynamic> json) => AiNewsType(
        id: json["_id"],
        datetime: json["datetime"],
        metadata: Metadata.fromJson(json["metadata"]),
        thumbnail: json["thumbnail"],
        icon: json["icon"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "datetime": datetime,
        "metadata": metadata.toJson(),
        "thumbnail": thumbnail,
        "icon": icon,
      };
}

class Metadata {
  String title;
  String description;

  Metadata({
    required this.title,
    required this.description,
  });

  factory Metadata.fromRawJson(String str) =>
      Metadata.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Metadata.fromJson(Map<String, dynamic> json) => Metadata(
        title: json["title"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "description": description,
      };
}
