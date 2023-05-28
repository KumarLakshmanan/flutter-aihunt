import 'dart:convert';

class AiToolType {
  String id;
  String title;
  List<String> category;
  bool thumbnailExists;
  String link;
  int favouriteCount;
  Pricing pricing;
  String video;
  int priority;
  Gpt33 gpt33;

  AiToolType({
    required this.id,
    required this.title,
    required this.category,
    required this.thumbnailExists,
    required this.link,
    required this.favouriteCount,
    required this.pricing,
    required this.video,
    required this.priority,
    required this.gpt33,
  });

  factory AiToolType.fromRawJson(String str) =>
      AiToolType.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AiToolType.fromJson(Map<String, dynamic> json) => AiToolType(
        id: json["_id"],
        title: json["title"],
        category: List<String>.from(json["category"].map((x) => x)),
        thumbnailExists: json["thumbnail_exists"] ?? false,
        link: json["link"],
        favouriteCount: json["favourite_count"] ?? 0,
        pricing: Pricing.fromJson(json["pricing"]),
        video: json["video"] ?? "",
        priority: json["priority"] ?? "",
        gpt33: json["gpt33"].runtimeType != Map
            ? Gpt33(heading: "No Description Provided")
            : Gpt33.fromJson(json["gpt33"]),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "title": title,
        "category": List<dynamic>.from(category.map((x) => x)),
        "thumbnail_exists": thumbnailExists,
        "link": link,
        "favourite_count": favouriteCount,
        "pricing": pricing.toJson(),
        "video": video,
        "priority": priority,
        "gpt33": gpt33.toJson(),
      };
}

class Gpt33 {
  String heading;

  Gpt33({
    required this.heading,
  });

  factory Gpt33.fromRawJson(String str) => Gpt33.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Gpt33.fromJson(Map<String, dynamic> json) => Gpt33(
        heading: json["heading"],
      );

  Map<String, dynamic> toJson() => {
        "heading": heading,
      };
}

class Pricing {
  String price;
  String type;

  Pricing({
    required this.price,
    required this.type,
  });

  factory Pricing.fromRawJson(String str) => Pricing.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Pricing.fromJson(Map<String, dynamic> json) => Pricing(
        price: json["price"],
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "price": price,
        "type": type,
      };
}
